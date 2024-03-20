WITH Ada.Text_IO,Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med;
USE Ada.Text_IO,Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med;

PACKAGE BODY Abr_Med IS

   ----------------------- Saisie d'un nouveau medecin ---------------------------
   -------------------------------------------------------------------------------

   PROCEDURE SaisieMed (Med : IN OUT T_Medecin) IS

   BEGIN

      Put("Nom du medecin : ");
      saisie(chaine);
      Med.Identite.Nom := chaine;

      Put ("Prenom du medecin : ");
      Saisie(Chaine);
      Med.Identite.Prenom := Chaine;

      Put("Ville d'exercice du medecin : ");
      Saisie(Chaine);
      Med.Ville := chaine;

      Put("Decision prise : ");
      Get_line(chaine,K);
      Med.decision := t_decision'value(chaine(1..k));

      Put("Nombre de visite realisee : ");
      Get(Med.NbVisite); Skip_Line;

   END SaisieMed;


   ------------------------ Ajout medecin dans l'arbre -------------------------
   -----------------------------------------------------------------------------

   PROCEDURE AjoutMed (Ptr : IN OUT T_pAbr_Med; med : in T_medecin) IS


   BEGIN

      IF ptr = NULL THEN
         ptr := NEW T_Abr_Medecin'(Med, NULL, NULL);
      ELSE
         IF Med.identite.nom <= ptr.Medecin.Identite.Nom THEN
            AjoutMed(ptr.Fg, Med);
         ELSE
            AjoutMed(ptr.Fd, Med);
         END IF;
      END IF;
   END AjoutMed;


   ----------------------- Recherche d'un medecin dans l'arbre ----------------
   ----------------------------------------------------------------------------

   function Recherche (ptr: T_Pabr_Med; Nom: T_Mot) return T_Pabr_Med IS

   BEGIN

      IF Ptr /=NULL THEN

         IF Ptr.Medecin.Identite.Nom = Nom THEN
            RETURN (Ptr);
         ELSE
            IF Nom <= Ptr.Medecin.Identite.Nom THEN
               Return(Recherche(Ptr.Fg, Nom));
            ELSE
               RETURN(Recherche(Ptr.Fd, Nom));
            END IF;
         END IF;

      ELSE
         RETURN (NULL);
      END IF;

   END Recherche;

------------------------------ Affichage de l'arbre --------------------------
------------------------------------------------------------------------------

   PROCEDURE Affichage_Abr (Ptr : T_Pabr_Med) IS

   BEGIN

      IF Ptr /= NULL THEN
         Affichage_Abr(Ptr.Fg);
         Affichage_Med(Ptr);
         Affichage_Abr(Ptr.Fd);
      END IF;

   END Affichage_Abr;

   ------------------------------------------ Affichage d'un medecin ----------------------------------------
   ----------------------------------------------------------------------------------------------------------

   PROCEDURE Affichage_Med (Ptr : T_Pabr_Med) IS

   BEGIN

      Put("Dr.");Put(Ptr.Medecin.Identite.Nom); Put(" "); Put(Ptr.Medecin.Identite.Prenom);New_Line;
      Put("   - Ville : ");Put_Line(Ptr.Medecin.Ville);
      Put("   - Decision : "); Put(T_Decision'Image(Ptr.Medecin.Decision)); New_Line;
      Put("   - Nombre de visite(s) : ");Put(Ptr.Medecin.NbVisite); New_Line;

   END Affichage_Med;

   ---------------------------------------- Suppression d'un medecin ----------------------------------------
   ----------------------------------------------------------------------------------------------------------

   PROCEDURE Supp_Med (Ptr : T_Pabr_Med) IS

   BEGIN

      IF Ptr /= NULL THEN

if ptr

END Abr_Med;