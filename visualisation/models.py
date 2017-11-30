# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.forms import ModelForm


# Create your models here.

class Entraineur(models.Model):
    id_entraineur = models.AutoField(db_column='Id_Entraineur', primary_key=True)  # Field name made lowercase.
    nom = models.CharField(db_column='Nom', max_length=15, blank=True, null=True)  # Field name made lowercase.
    prenom = models.CharField(db_column='Prenom', max_length=10, blank=True, null=True)  # Field name made lowercase.
    id_equipe = models.IntegerField(db_column='Id_Equipe')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Entraineur'


class Equipe(models.Model):
    id_equipe = models.AutoField(db_column='Id_Equipe', primary_key=True)  # Field name made lowercase.
    nom = models.CharField(db_column='Nom', max_length=10, blank=True, null=True)  # Field name made lowercase.
    nb_joueurs = models.CharField(db_column='Nb_joueurs', max_length=10, blank=True, null=True)  # Field name made lowercase.
    systeme_jeu = models.CharField(db_column='Systeme_jeu', max_length=10, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Equipe'


class Joueur(models.Model):
    id_joueur = models.AutoField(db_column='Id_Joueur', primary_key=True)  # Field name made lowercase.
    nom = models.CharField(db_column='Nom', max_length=15, blank=True, null=True)  # Field name made lowercase.
    prenom = models.CharField(db_column='Prenom', max_length=25, blank=True, null=True)  # Field name made lowercase.
    age = models.IntegerField(db_column='Age', blank=True, null=True)  # Field name made lowercase.
    taille = models.IntegerField(db_column='Taille', blank=True, null=True)  # Field name made lowercase.
    poste = models.CharField(db_column='Poste', max_length=10, blank=True, null=True)  # Field name made lowercase.
    status = models.IntegerField(db_column='Status', blank=True, null=True)  # Field name made lowercase.
    disponible = models.IntegerField(db_column='Disponible', blank=True, null=True)  # Field name made lowercase.
    position = models.IntegerField(db_column='Position', blank=True, null=True)  # Field name made lowercase.
    numero = models.IntegerField(db_column='Numero')  # Field name made lowercase.
    id_equipe = models.ForeignKey(Equipe, models.DO_NOTHING, db_column='Id_Equipe', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Joueur'


class Statistique(models.Model):
    id_stat = models.AutoField(db_column='Id_stat', primary_key=True)  # Field name made lowercase.
    temps_jeu = models.IntegerField(db_column='Temps_jeu', blank=True, null=True)  # Field name made lowercase.
    but = models.IntegerField(db_column='But', blank=True, null=True)  # Field name made lowercase.
    passe_decisive = models.IntegerField(db_column='Passe_decisive', blank=True, null=True)  # Field name made lowercase.
    match_dispute = models.IntegerField(db_column='Match_dispute', blank=True, null=True)  # Field name made lowercase.
    id_joueur = models.ForeignKey(Joueur, models.DO_NOTHING, db_column='Id_Joueur', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Statistique'
