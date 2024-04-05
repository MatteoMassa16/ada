WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, abr_med ;
use ada.Text_IO, ada.Integer_Text_IO, ada.Float_Text_IO, abr_med;

PACKAGE Lst_Visite IS

   NbV : Integer := 3;

   TYPE T_NatureVisite IS (PROSPECTION, seconde, MAINTENANCE);

   TYPE T_Visite IS RECORD
      Med : T_Pabr_Med;
      NatureVisite : T_NatureVisite;
   END RECORD;

   TYPE T_Lstc_Visite IS ARRAY (Integer RANGE <>) OF T_Visite;

   TYPE T_ListeVisite IS RECORD
      Liste : T_Lstc_Visite (1..NbV);
      Taille : Integer RANGE 0..NbV := 0;
   END RECORD;

   Visite : T_Visite;
   ListeVisite : T_ListeVisite;



   PROCEDURE CreaVisite (Visite : IN OUT T_Visite ; PAbr_Med : T_PAbr_Med);
   PROCEDURE AjoutVisite (ListeVisite : IN OUT T_ListeVisite ; Visite : T_Visite ; Fait : OUT Boolean);
   PROCEDURE AfficheVisiteMedNat (Visite : T_Visite);

END Lst_Visite;
