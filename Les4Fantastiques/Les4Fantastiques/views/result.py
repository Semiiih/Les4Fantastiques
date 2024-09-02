from django.views.generic import TemplateView

class ResultView(TemplateView):
    template_name = "result.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        quiz_status = self.request.session.get('quiz_status')
        user_name = self.request.session.get('user_name')
        context['quiz_status'] = quiz_status
        context['user_name'] = user_name
        return context