from django import forms
from .models import Joueur

class classementForm(forms.ModelForm):
    class Meta:
        model = Joueur
        #fields = '__all__'
        exclude = ['id_joueur']

class modifJoueurForm(forms.ModelForm):
    class Meta:
        model = Joueur
        #fields = '__all__'
        exclude = ['id_joueur','poste','id_equipe']        