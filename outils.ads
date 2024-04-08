WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

PACKAGE Outils IS

   SUBTYPE T_mot IS String (1..20);

   TYPE T_Identite IS RECORD
      Nom,Prenom: T_mot;
   END RECORD;

   TYPE T_Mois IS (Janvier, Fevrier, Mars, Avril, Mai, Juin, Juillet, Aout, Septembre, Octobre, Novembre, Decembre);

   TYPE T_Date IS RECORD
      Jour : INTEGER RANGE 1..31;
      Mois : T_Mois;
      Annee: Integer;
   END RECORD;



   C : Character;
   Chaine : String (1..20);
   K, Cmpt : Integer;
   L: float;
   confirm, Res, erreur : Boolean;

   PROCEDURE Saisie (S:OUT String);
   PROCEDURE OuiNon (C : Character ; Res : OUT Boolean);

END Outils;