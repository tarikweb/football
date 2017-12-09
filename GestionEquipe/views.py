# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.http import HttpResponse
from django.http import JsonResponse
from django.shortcuts import render

from GestionEquipe.models import Joueur
from GestionEquipe.models import Equipe
from GestionEquipe.models import Statistique

from pprint import pprint
from django.views.decorators.csrf import csrf_exempt
from .forms import classementForm
from .forms import modifierForm

#test
# Create your views here.


def home(request):
    """ Exemple de page HTML, non valide pour que l'exemple soit concis """
    text = """<h1>Bienvenue sur mon blog !</h1>
              <p>Les crêpes bretonnes ça tue des mouettes en plein vol !</p>"""
    joueurs = Joueur.objects.all().filter().order_by('position')
    formEquipe=modifierForm(request.POST)
    #return HttpResponse(text)
    return render(request,'GestionEquipe/visu.html',locals())

def classement(request):
    
    joueurs = Joueur.objects.all().filter().order_by('nom')
    equipes = Equipe.objects.all()
    statistiques = Statistique.objects.all()

    form = classementForm(request.POST)
    if form.is_valid():
        form.save()
        
    return render(request,'GestionEquipe/classement.html',locals())    

def view_article(request, id_article):

    """ 

    Vue qui affiche un article selon son identifiant (ou ID, ici un numéro)

    Son ID est le second paramètre de la fonction (pour rappel, le premier

    paramètre est TOUJOURS la requête de l'utilisateur)

    """

    return render(request,'GestionEquipe/testos.html',locals())

@csrf_exempt
def supprimer(request):
	id=request.POST.get('id', None)
	Joueur.objects.filter(id_joueur=id).delete()
	if request.method== "POST":
		reponse="ok"
		return JsonResponse({'reponse' : 'reponse'})

def Accueil(request):
    """ Exemple de page HTML, non valide pour que l'exemple soit concis """
    text = """<h1>Bienvenue sur mon blog !</h1>
              <p>Les crêpes bretonnes ça tue des mouettes en plein vol !</p>"""
    

    #return HttpResponse(text)
    return render(request,'GestionEquipe/Accueil.html',locals())

def modifierRemplir(request):
    id=request.POST.get('id', None)
    joueurs = Joueur.objects.all().filter(id_joueur=id)
    for joueur in joueurs:
        nom=joueur.nom
        prenom=joueur.prenom
        age=joueur.age
        taille=joueur.taille
        poste=joueur.poste
        disponible=joueur.disponible

    return JsonResponse({
            'id' : id,
            'nom' : nom,
            'prenom' : prenom,
            'age' : age,
            'taille' : taille,
            'poste' : poste,
            'disponible' : disponible,
            })

def modifier(request):
    #id=request.POST.get('donnees', None)
    formEquipe= modifierForm(request.POST)
    if formEquipe.is_valid():
        formEquipe.save()
        reponse="ok"
    else:
        reponse="nannn"
    return JsonResponse({'reponse' : 'reponse'})
