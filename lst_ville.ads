WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils;

PACKAGE Lst_Ville IS

   TYPE T_Ville IS RECORD
      Nom : T_Mot;
      Distance : Float; -- exprimé en Km
      Peage : Float;
   END RECORD;

   TYPE T_ListeVille;
   Type T_PVille IS ACCESS T_ListeVille;

   type T_ListeVille IS RECORD
      Ville : T_Ville;
      Suiv : T_PVille;
   END RECORD;

   Ville : T_Ville;
   PVille : T_PVille;

   PROCEDURE CreaVille (Ville : IN OUT T_Ville);
   PROCEDURE AjoutVille (P : IN OUT T_PVille ; Ville : T_Ville ; Confirm : OUT Boolean);
   FUNCTION ChercheVille (P : T_PVille ; Ville : T_Mot) RETURN T_PVille;
   PROCEDURE SuprVille (P : IN OUT T_PVille ; Ville : T_Mot);
   PROCEDURE AfficheVille (P: T_PVille ; Ville : T_Mot);
   PROCEDURE AfficheVilleTT (P : T_PVille);

END Lst_Ville;

