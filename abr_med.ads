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


   PROCEDURE SaisieMed (Med : IN OUT T_Medecin);
   PROCEDURE AjoutMed (Ptr : IN OUT T_PAbr_Med; Med : IN T_Medecin);
   FUNCTION Recherche (Ptr: T_Pabr_Med; Nom: T_Mot) RETURN T_Pabr_Med;
   PROCEDURE Affichage_Abr (Ptr : T_Pabr_Med);
   PROCEDURE Affichage_Med (Ptr : T_Pabr_Med);


END Abr_Med;
