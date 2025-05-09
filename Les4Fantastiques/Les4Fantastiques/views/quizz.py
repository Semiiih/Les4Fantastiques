from django.shortcuts import render, redirect
from django.views import View
from .models import Choice, Question, Score
from django.contrib.auth.models import User

class QuizzView(View):
    def get(self, request):
        # Si 'quiz_questions' n'existe pas, réinitialiser la session
        if 'quiz_questions' not in request.session or 'replay' in request.GET:
            self.reset_quiz_session(request)

        # Récupérer l'état actuel du quiz
        current_index = request.session.get('current_question', 0)
        questions_ids = request.session['quiz_questions']
        questions = Question.objects.filter(id__in=questions_ids)

        # Afficher les corrections si le quiz est terminé
        if current_index >= len(questions):
            return self.show_corrections(request, questions)

        # Afficher la question actuelle
        current_question = questions[current_index]
        return render(request, 'quizz.html', {
            'start_quiz': True,
            'question': current_question,
            'question_number': current_index + 1,
            'total_questions': len(questions),
            'show_corrections': False,
        })

    def post(self, request):
        # Gestion du bouton "Rejouer"
        if 'replay_quiz' in request.POST:
            self.reset_quiz_session(request)
            return redirect('quizz')

        # Gestion des réponses utilisateur
        questions_ids = request.session['quiz_questions']
        current_index = request.session['current_question']
        user_answers = request.session['user_answers']

        selected_answer = request.POST.get('answer')
        if selected_answer:
            user_answers[str(questions_ids[current_index])] = int(selected_answer)
            request.session['user_answers'] = user_answers
            request.session['current_question'] = current_index + 1
        else:
            # Aucune réponse sélectionnée
            question = Question.objects.get(id=questions_ids[current_index])
            return render(request, 'quizz.html', {
                'start_quiz': True,
                'question': question,
                'question_number': current_index + 1,
                'total_questions': len(questions_ids),
                'error': "Vous devez sélectionner une réponse avant de continuer.",
                'show_corrections': False,
            })

        return redirect('quizz')

    def show_corrections(self, request, questions):
        user_answers = request.session.get('user_answers', {})
        corrections = []
        score = 0

        for question in questions:
            user_answer_id = user_answers.get(str(question.id))
            correct_answer = question.choices.filter(is_correct=True).first()
            user_answer = Choice.objects.filter(id=user_answer_id).first()

            # Calculer le score
            if user_answer and correct_answer and user_answer.id == correct_answer.id:
                score += 1

            corrections.append({
                'question_text': question.question_text,
                'user_answer': user_answer.choice_text if user_answer else "Aucune réponse sélectionnée",
                'correct_answer': correct_answer.choice_text if correct_answer else "Aucune réponse correcte",
                'is_correct': user_answer_id == correct_answer.id if correct_answer else False,
            })

        # Mettre à jour le meilleur score de l'utilisateur
        if request.user.is_authenticated:
            user_score, created = Score.objects.get_or_create(user=request.user)
            if score > user_score.best_score:
                user_score.best_score = score
                user_score.save()

        return render(request, 'quizz.html', {
            'start_quiz': True,
            'show_corrections': True,
            'corrections': corrections,
            'score': score,  # Passer le score au template
        })

    def reset_quiz_session(self, request):
        """Réinitialiser les données de session pour recommencer le quiz."""
        questions = Question.objects.order_by('?')[:10]
        request.session['quiz_questions'] = [q.id for q in questions]
        request.session['current_question'] = 0
        request.session['user_answers'] = {}
        request.session['start_quiz'] = True
