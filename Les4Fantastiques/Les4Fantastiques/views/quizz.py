from django.views.generic import TemplateView
from django import forms
from django.views.generic.edit import FormView


class QuizzForm(forms.Form):
    name = forms.CharField(label='Nom', max_length=100)
    question = forms.CharField(label='Quelle est la marque de voiture qui a quatre anneaux ?', max_length=20)

class QuizzView(FormView):
    template_name = "quizz.html"
    form_class = QuizzForm
    success_url = "/result/"

    def form_valid(self, form):

        question = form.cleaned_data['question']
        name = form.cleaned_data['name']

        if question.lower() == 'audi': 
            self.request.session['quiz_status'] = 'success'
        else:
            self.request.session['quiz_status'] = 'failure'

        self.request.session['user_name'] = name

        return super().form_valid(form)
    
class ResultView(TemplateView):
    template_name = "result.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        quiz_status = self.request.session.get('quiz_status')
        user_name = self.request.session.get('user_name')
        context['quiz_status'] = quiz_status
        context['user_name'] = user_name
        return context    
