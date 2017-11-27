# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.http import HttpResponse
from django.http import JsonResponse
from django.shortcuts import render
from visualisation.models import Joueur
from pprint import pprint
from django.views.decorators.csrf import csrf_exempt

# Create your views here.

def home(request):
    """ Exemple de page HTML, non valide pour que l'exemple soit concis """
    text = """<h1>Bienvenue sur mon blog !</h1>
              <p>Les crêpes bretonnes ça tue des mouettes en plein vol !</p>"""
    joueurs=Joueur.objects.all()

    #return HttpResponse(text)
    return render(request,'visualisation/visu.html',locals())

def view_article(request, id_article):

    """ 

    Vue qui affiche un article selon son identifiant (ou ID, ici un numéro)

    Son ID est le second paramètre de la fonction (pour rappel, le premier

    paramètre est TOUJOURS la requête de l'utilisateur)

    """

    return render(request,'visualisation/testos.html',locals())

#@csrf_exempt
def supprimer(request):
	id=request.POST.get('id', None)
	Joueur.objects.filter(id_joueur=id).delete()
	if request.method== "POST":
		reponse="ok"
		return JsonResponse({'reponse' : 'reponse'})
