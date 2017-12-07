from django import forms
from .models import Joueur

class classementForm(forms.ModelForm):
    class Meta:
        model = Joueur
        fields = '__all__'
        