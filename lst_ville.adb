WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils;

PACKAGE BODY Lst_Ville IS

   --------------------------------------------- Création d'une ville -----------------------------------------------
   ------------------------------------------------------------------------------------------------------------------

   PROCEDURE CreaVille (Ville : IN OUT T_Ville) IS

   BEGIN

      Put("   * Nom de la ville : ");
      Saisie(Chaine);
      Ville.Nom := Chaine;
      New_Line;

      Put("   * Distance entre Poitiers et "); Put(Chaine); Put(" en Km : ");
      Get(Ville.Distance);Skip_Line;
      New_Line;

      Put("   * Montant des peages : ");
      Get(Ville.Peage);Skip_Line;
      New_Line;

      Put_Line("   --- Ville creee ---");
      Put("      - ");Put_Line(Ville.Nom);
      Put("      - Distance : ");Put(Ville.Distance, aft=>2,exp=>0);Put_line(" Km");
      Put("      - Peage : ");Put(Ville.Peage, aft=>2,exp=>0);Put_Line(" euros");

   END CreaVille;


   --------------------------------------------- Ajout d'une ville --------------------------------------------------
   ------------------------------------------------------------------------------------------------------------------

   PROCEDURE AjoutVille (P : IN OUT T_PVille ; Ville : T_Ville ; Confirm : out boolean) IS

   BEGIN

      IF P = NULL THEN
         P := NEW T_ListeVille'(Ville, P);   --Si le pointeur est sur une case vide : liste vide ou fin de liste
         Confirm := true;                       --Cofirmation qu'une case est créée. Retourne un boolean
      ELSIF P.Ville.Nom > Ville.Nom THEN
         P := NEW T_ListeVille'(Ville, P);
         confirm := true;
      ELSE
         AjoutVille(P.Suiv, Ville, Confirm);   --Recursivité
      END IF;

   END AjoutVille;


   --------------------------------------- Recherche d'une ville fonction -------------------------------------------
   ------------------------------------------------------------------------------------------------------------------

   FUNCTION ChercheVille (P : T_PVille ; Ville : T_Mot) RETURN T_PVille IS

   BEGIN

      IF P /= NULL THEN

         IF P.Ville.Nom = Ville THEN               --Recherche de correspondance, on suppose qu'il n'y a pas deux villes differentes avec le même nom
            RETURN P;                              --Résultat de la recherche : un pointeur de la liste ville
         ELSE
            RETURN(ChercheVille(P.Suiv, Ville));   --Recursivité
         END IF;
      ELSE

         RETURN NULL;   --P arrivera sur une case null si il ne trouve pas la ville

      END IF;
   END ChercheVille;


   ------------------------------------------ Suppression de ville --------------------------------------------------
   ------------------------------------------------------------------------------------------------------------------

   PROCEDURE SuprVille (P : IN OUT T_PVille ; Ville : T_Mot) IS

   BEGIN

      IF P /= NULL THEN

         IF P.Ville.Nom = Ville THEN
            P := P.Suiv;
         ELSE
            SuprVille (P.Suiv, Ville);
         END IF;

      END IF;

   END SuprVille;

   ------------------------------------------- Affichage d'une ville ------------------------------------------------
   ------------------------------------------------------------------------------------------------------------------

   PROCEDURE AfficheVille (P: T_PVille ; Ville : T_mot) IS

   BEGIN

      IF P /= NULL THEN

         IF P.Ville.Nom = Ville THEN
            Put("      - ");Put_line(P.Ville.Nom);
            Put("      - Distance : ");Put(P.Ville.Distance, aft=>2,exp=>0);Put_line(" Km");
            Put("      - Peage : ");Put(P.Ville.Peage, aft=>2,exp=>0);Put_Line(" euros");
         ELSE
            AfficheVille(P.Suiv, Ville);
         END IF;
      END IF;

   END AfficheVille;

   ------------- Affichage de toute les villes et, si le Dieu-Machine le veut, par ordre alphabétique ---------------
   ------------------------------------------------------------------------------------------------------------------

   PROCEDURE AfficheVilleTT (P : T_PVille) IS

   BEGIN

      if P /= NULL then

         Put("      - ");Put_Line(P.Ville.Nom);
         Put("      - Distance : ");Put(P.Ville.Distance, aft=>2,exp=>0);Put_line(" Km");
         Put("      - Peage : ");Put(P.Ville.Peage, aft=>2,exp=>0);Put_Line(" euros");

         AfficheVilleTT(P.Suiv);

      END if;

   END AfficheVilleTT;




   END Lst_Ville;

