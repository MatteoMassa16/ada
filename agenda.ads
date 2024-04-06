with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med, Lst_Ville, Lst_Visite;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med, Lst_Ville, Lst_Visite;

PACKAGE Agenda IS

   TYPE T_Agenda;

   TYPE T_pAgenda IS ACCESS T_Agenda;

   Type T_jour IS RECORD
      Date : T_Date;
      Ville : T_Mot;
      Visite : T_ListeVisite;
   END RECORD;

   TYPE T_Agenda IS RECORD
      jour : T_jour;
      Suiv : T_pAgenda;
   END RECORD;

   Jour : T_Jour;
   PAgenda : T_pAgenda;


   PROCEDURE Creajour (Jour: IN OUT T_Jour);
   PROCEDURE Ajoutjour (P : IN OUT T_Pagenda ; Jour : T_Jour);
   PROCEDURE AfficheAgenda (P : IN T_PAgenda);
   PROCEDURE AjoutVisiteListe (P : IN OUT T_PAgenda);


END Agenda;

