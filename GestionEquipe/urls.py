from django.conf.urls import url
from . import views   

urlpatterns = [
   # url(r'^visualisation$', views.home),
    url(r'^$', views.home, name='GestionEquipe'),
    url(r'^$', views.Accueil, name='Accueil'),
    url(r'^article/(?P<id_article>\d+)$', views.view_article),
    url(r'^ajax/supprimer/$', views.supprimer, name='supprimer'),
    url(r'^ajax/modifierRemplir/$', views.modifierRemplir, name='modifierRemplir'),
    url(r'^ajax/modifier/$', views.modifier, name='modifier'),
    url(r'^classement$', views.classement, name='classement'),

    ]


