with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med, Lst_Ville, Lst_Visite, agenda;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med, Lst_Ville, Lst_Visite, agenda;

PACKAGE BODY Agenda IS

   PROCEDURE Creajour (jour : IN OUT T_jour) IS

   BEGIN

      Put_Line("Entrer la date : ");
      Put("   - jour : ");
      Get(jour.Date.Jour); Skip_Line;

      Put ("   - mois : ");
      saisie(chaine);
      jour.Date.Mois := T_Mois'Value(Chaine);


      Put("   - annee : ");
      Get(jour.Date.Annee);Skip_Line;

      Put("Enter la ville : ");
      Saisie(Chaine);
      jour.Ville := Chaine;

      CreaVisite (Visite, PAbr_Med);

      Put("Pour le ");Put(jour.Date.Jour);Put(" ");Put(t_mois'image(jour.Date.Mois));Put(" ");Put(jour.Date.Annee);Put(" a ");Put_Line(jour.Ville);


      AjoutVisite(ListeVisite, Visite, Res);

      IF Res THEN
         Put_Line("Visite ajoutee");
      ELSE
         put_line("Erreur : Visite non ajoutee a l'agenda du jour");
      END IF;

   END CreaJour;

   --- Ajout d'un jour à l'agenda du consultant ---
   ------------------------------------------------

   PROCEDURE Ajoutjour (P : IN OUT T_Pagenda ; Jour : T_Jour) IS

   BEGIN

      IF P = NULL THEN
         P := NEW T_Agenda'(Jour, p);
         put_line("Agenda mis a jour");
      ELSE
         AjoutJour(P.Suiv, Jour);
      END IF;

   END AjoutJour;

   --- Affichage de l'agenda ---
   -----------------------------

   PROCEDURE AfficheAgenda (P : IN OUT T_PAgenda) IS

   BEGIN


      IF P /= NULL THEN

         Put("   - Le ");Put(P.Jour.Date.Jour);Put(" ");Put(T_Mois'Image(P.Jour.Date.Mois));Put(" ");Put(P.Jour.Date.Annee);Put(" a ");Put_Line(P.Jour.Ville);

         AfficheVisiteMedNat(P.Jour.Visite.liste(1));

         AfficheAgenda(P.Suiv);


      END IF;



   END AfficheAgenda;





END Agenda;

