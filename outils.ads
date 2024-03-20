PACKAGE Outils IS

   SUBTYPE T_mot IS String (1..20);

   TYPE T_Identite IS RECORD
      Nom,Prenom: T_mot;
   END RECORD;

   TYPE T_Date IS RECORD
      Jour : INTEGER RANGE 1..31;
      Mois : T_Mois;
      Annee: Integer;
   END RECORD;

   TYPE T_Mois IS (Janvier, Fevrier, Mars, Avril, Mai, Juin, Juillet, Aout, Septembre, Octobre, Novembre, Decembre);


   PROCEDURE Saisie_Date(Dx : OUT T_Date);


END Outils
