WITH Ada.Text_IO,Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils;
USE Ada.Text_IO,Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils;

PACKAGE Abr_Med IS

   TYPE T_Abr_Medecin;
   TYPE T_Pabr_Med IS ACCESS T_Abr_Medecin;

   TYPE T_Decision IS (En_Attente, Hesitant, Adherant, Non_Interesse);

   TYPE T_Medecin IS RECORD
      Identite : T_Identite;
      Ville : T_Mot;
      Decision : T_Decision;
      NbVisite : Integer;
   END RECORD;

   TYPE T_Abr_Medecin IS RECORD
      Medecin : T_Medecin;
      Fg, Fd : T_pAbr_Med;
   END RECORD;

   PAbr_Med : T_PAbr_Med;
   Med : T_Medecin;



   PROCEDURE SaisieMed (Med : IN OUT T_Medecin);
   PROCEDURE AjoutMed (Ptr : IN OUT T_PAbr_Med; Med : IN T_Medecin);
   FUNCTION RechercheMed (Ptr: T_Pabr_Med; Nom: T_Mot) RETURN T_Pabr_Med;
   PROCEDURE AffichageAbr (Ptr : T_Pabr_Med);
   PROCEDURE AffichageMed (Ptr : T_Pabr_Med);
   PROCEDURE ModifMed (Ptr : IN OUT T_Pabr_Med);
   FUNCTION DoublonMed (Ptr : T_Pabr_Med ; Med : T_Medecin) RETURN Boolean;

END Abr_Med;

