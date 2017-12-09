from django import forms
from .models import Joueur

class classementForm(forms.ModelForm):
    class Meta:
        model = Joueur
        #fields = '__all__'
        exclude = ['id_joueur']

class modifierForm(forms.ModelForm):

	class Meta:

		model = Joueur
		fields = '__all__'
		exclude = ['id_joueur','status', 'id_equipe','position']