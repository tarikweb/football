from django.conf.urls import url
from . import views   

urlpatterns = [
   # url(r'^visualisation$', views.home),
    url(r'^$', views.home, name='GestionEquipe'),
    url(r'^article/(?P<id_article>\d+)$', views.view_article),
    url(r'^ajax/supprimer/$', views.supprimer, name='supprimer'),
    #url(r'^ajax/modifier/$', views.modifier, name='modifier'),
    #url(r'^ajax/ajouter/$', views.ajouter, name='ajouter'),
    #url(r'^ajax/visualiser/$', views.visualiser, name='visualiser'),
    url(r'^classement$', views.classement, name='classement'),
    ]


