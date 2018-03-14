# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.http import HttpResponse
from django.http import JsonResponse
from django.shortcuts import render
from django.shortcuts import redirect
from django.views.generic import TemplateView
from django.conf import settings

from GestionEquipe.models import Joueur
from GestionEquipe.models import Equipe
from GestionEquipe.models import Statistiques
from GestionEquipe.models import Arbitre
from GestionEquipe.models import Entraineur
from GestionEquipe.models import Entraineur


from pprint import pprint
from django.views.decorators.csrf import csrf_exempt
from .forms import classementForm
from .forms import modifierForm
from .forms import ajouterForm


#test
# Create your views here.

def home(request):
    """ Exemple de page HTML, non valide pour que l'exemple soit concis """

    text = """<h1>Bienvenue sur mon blog !</h1>
              <p>Les crêpes bretonnes ça tue des mouettes en plein vol !</p>"""
    joueurs = Joueur.objects.all().filter()
    formAjouter=ajouterForm(request.POST)
    #return HttpResponse(text)
    return render(request,'GestionEquipe/visu.html',locals())

def classement(request):

    joueurs = Joueur.objects.all().filter().order_by('nom')
    equipes = Equipe.objects.all()
    statistiques = Statistiques.objects.all()

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
        test=formEquipe.save()
        test.save()
        reponse="ok"
    else:
        reponse="nannn"
    return JsonResponse({'reponse' : reponse})

def ajouter(request):
    #id=request.POST.get('donnees', None)
    formAjouter= ajouterForm(request.POST)
    if formAjouter.is_valid():
        formAjouter.save()
        reponse="ok"
    else:
        reponse="nannn"
    return redirect('../../GestionEquipe/GestionEquipe')



class LoginView(TemplateView):

  template_name = '/template/GestionEquipe/Accueil.html'

  def post(self, request, **kwargs):

    username = request.POST.get('username', False)
    password = request.POST.get('password', False)
    user = authenticate(username=username, password=password)
    if user is not None and user.is_active:
        login(request, user)
        return HttpResponseRedirect( settings.LOGIN_REDIRECT_URL )

    return render(request, self.template_name)


class LogoutView(TemplateView):

  template_name = '/template/GestionEquipe/Accueil.html'

  def get(self, request, **kwargs):

    logout(request)

    return render(request, self.template_name)
