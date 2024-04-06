with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med, Lst_Ville, Lst_Visite, agenda;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med, Lst_Ville, Lst_Visite, agenda;

PACKAGE BODY Agenda IS

   ----------------------------- Creation d'un jour dans l'agenda du consultant ----------------------------------
   ---------------------------------------------------------------------------------------------------------------

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

      Jour.Visite := ListeVisite;

   END CreaJour;

   -------------------------------- Ajout d'un jour à l'agenda du consultant -------------------------------------
   ---------------------------------------------------------------------------------------------------------------

   PROCEDURE Ajoutjour (P : IN OUT T_Pagenda ; Jour : T_Jour) IS

   BEGIN

      IF P = NULL THEN
         P := NEW T_Agenda'(Jour, p);
         put_line("Agenda mis a jour");
      ELSE
         AjoutJour(P.Suiv, Jour);
      END IF;

   END AjoutJour;

   --------------------------------------- Affichage de l'agenda -------------------------------------------------
   ---------------------------------------------------------------------------------------------------------------

   PROCEDURE AfficheAgenda (P : T_PAgenda) IS

   BEGIN


      IF P /= NULL THEN

         Put("   - Le ");Put(P.Jour.Date.Jour);Put(" ");Put(T_Mois'Image(P.Jour.Date.Mois));Put(" ");Put(P.Jour.Date.Annee);Put(" a ");Put_Line(P.Jour.Ville);

         AfficheVisiteMedNat(P.Jour.Visite);

         AfficheAgenda(P.Suiv);

      END IF;

   END AfficheAgenda;


   ----------------------- Ajout d'une visite à une liste de visite d'un consultant ------------------------------
   ---------------------------------------------------------------------------------------------------------------

   PROCEDURE AjoutVisiteListe (P : IN OUT T_PAgenda) IS

      Jour, Annee : Integer;
      Mois : T_Mois;
      fait : boolean;

   BEGIN

      Put_line("Entrer la date de la nouvelle visite : ");
      Put("   * Jour : ");
      Get(Jour);Skip_Line;

      Put("   * Mois : ");
      Saisie(Chaine);
      Mois := T_Mois'Value(Chaine);

      Put("   * Annee : ");
      Get(Annee);Skip_Line;

      IF P /= NULL THEN

         IF P.Jour.Date.Jour = Jour AND
               P.Jour.Date.Mois = Mois AND
               P.Jour.Date.Annee = Annee THEN

            AfficheAgenda(P);
            New_Line;

            CreaVisite (Visite, PAbr_Med);
            New_Line;

            AjoutVisite (P.Jour.Visite, Visite, Fait);
            New_Line;New_Line;

            IF Fait THEN
               Put_Line("Visite ajoutee");
            ELSE
               Put_Line("Erreur, visite non ajoutee");
            END IF;

            New_Line;
            AfficheAgenda(p);

         ELSE

            AjoutVisiteListe (P.Suiv);

         END IF;
      END IF;

   END AjoutVisiteListe;

END Agenda;

