WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, outils, abr_med, Lst_Visite ;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, outils, Abr_Med, Lst_Visite;

PACKAGE BODY Lst_Visite IS

   --- Création d'une visite ---
   -----------------------------

   PROCEDURE CreaVisite (Visite : in out T_Visite ; pAbr_Med : T_pAbr_Med) IS

      Medecin : T_PAbr_Med;

   BEGIN

      Put("Entrer le nom du medecin visite : ");
      Saisie(Chaine);

      IF PAbr_Med/=NULL THEN
         Medecin := Recherchemed(PAbr_Med, Chaine);
      ELSE
         Put("Aucun medecin enregistre");
         RETURN;
      END IF;


      IF Medecin /= NULL THEN
         Visite.Med := Medecin;

         Put("Nature de la visite : ");
         Saisie(Chaine);

         Visite.NatureVisite := T_NatureVisite'Value(Chaine);

         Put_line("Visite creee");
         Put("Dr.");Put(Visite.Med.Medecin.Identite.Nom); Put(" "); Put_Line(Visite.Med.Medecin.Identite.Prenom);
         Put_line(T_natureVisite'image(Visite.NatureVisite));

      ELSE
         Put(chaine); Put_Line("Ce medecin n'est pas enregistre");
      END IF;

   END CreaVisite;

   --- Ajout d'une visite ---
   --------------------------

   PROCEDURE AjoutVisite (ListeVisite : IN OUT T_ListeVisite ; Visite : T_Visite ; fait : out boolean) IS

   BEGIN

      IF ListeVisite.Taille = nbV THEN
         Fait := False;
      ELSE
         Fait := True;

         ListeVisite.Liste(ListeVisite.taille+1) := Visite;
         ListeVisite.Taille := ListeVisite.Taille + 1;

      END IF;
   END AjoutVisite;


   --- Affichage d'une visite ---
   ------------------------------

   PROCEDURE AfficheVisiteMedNat (Visite : T_Visite) IS

   BEGIN

      Put_Line("Visite avec :");
      Put("Dr.");Put(Visite.Med.Medecin.Identite.Nom); Put(" "); Put_Line(Visite.Med.Medecin.Identite.Prenom);
      put("Nature de la visite : ");
      Put_line(T_natureVisite'image(Visite.NatureVisite));


   END AfficheVisiteMedNat;

   --- Suppression d'une visite ---
   --------------------------------

--Procedure SuprVisite





END Lst_Visite;


