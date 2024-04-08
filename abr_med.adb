WITH Ada.Text_IO,Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med, lst_Ville;
USE Ada.Text_IO,Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med, lst_ville;

PACKAGE BODY Abr_Med IS

   ------------------------------------- Saisie d'un nouveau medecin ---------------------------------------------
   ---------------------------------------------------------------------------------------------------------------

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


   -------------------------------------- Ajout medecin dans l'arbre ---------------------------------------------
   ---------------------------------------------------------------------------------------------------------------

   PROCEDURE AjoutMed (Ptr : IN OUT T_pAbr_Med; med : in T_medecin) IS

   BEGIN

      IF ptr = NULL THEN
         Ptr := NEW T_Abr_Medecin'(Med, NULL, NULL);

         IF  ChercheVille(PVille, Med.Ville) = NULL THEN
            Put(Med.Ville);Put(" n'est pas enregistree"); New_Line;
            Put("L'enregistrer ? (O/N)  ");
            Get(C);Skip_Line;OuiNon(C, Res);

            IF Res THEN
               Creaville (Ville, med.ville);
               AjoutVille(PVille, Ville, Confirm);

               IF Confirm THEN
                  Put("Ville creee");
               END IF;

            END IF;
         END IF;

      ELSE

         DoublonMed(Ptr, Med, erreur);

         IF  erreur = False THEN

            IF Med.identite.nom <= ptr.Medecin.Identite.Nom THEN
               AjoutMed(ptr.Fg, Med);
            ELSE
               AjoutMed(ptr.Fd, Med);
            END IF;

         ELSE

            Put_Line("   * Ce medecin est deja enregistre.");
            AffichageMed(RechercheMed(Ptr, Med.Identite.Nom));
            New_Line;
            Put("   - Voulez-vous le changer ? (O/N)  ");
            Get(C); Skip_Line;

            OuiNon(C, Res);

            IF Res THEN
               ModifMed(Ptr);
            ELSE
               put_line("   * Ajout annule.");
            END IF;

         END IF;
      END IF;

   END AjoutMed;



   ------------------------------------- Recherche d'un medecin dans l'arbre -------------------------------------
   ---------------------------------------------------------------------------------------------------------------

   FUNCTION RechercheMed (Ptr: T_Pabr_Med; Nom :T_Mot) RETURN T_Pabr_Med IS

   BEGIN

      IF Ptr /=NULL THEN

         IF Ptr.Medecin.Identite.Nom = Nom THEN
            RETURN (Ptr);
         ELSE
            IF Nom <= Ptr.Medecin.Identite.Nom THEN
               Return(RechercheMed(Ptr.Fg, Nom));
            ELSE
               RETURN(RechercheMed(Ptr.Fd, Nom));
            END IF;
         END IF;

      ELSE
         RETURN (NULL);
      END IF;

   END RechercheMed;

----------------------------------------------- Affichage de l'arbre ---------------------------------------------
------------------------------------------------------------------------------------------------------------------

   PROCEDURE AffichageAbr (Ptr : T_Pabr_Med) IS

   BEGIN

      IF Ptr /= NULL THEN
         AffichageAbr(Ptr.Fg);
         AffichageMed(Ptr);
         AffichageAbr(Ptr.Fd);
      END IF;

   END AffichageAbr;

   ------------------------------------------ Affichage d'un medecin ---------------------------------------------
   ---------------------------------------------------------------------------------------------------------------

   PROCEDURE AffichageMed (Ptr : T_Pabr_Med) IS

   BEGIN

      Put("Dr.");Put(Ptr.Medecin.Identite.Nom); Put(" "); Put(Ptr.Medecin.Identite.Prenom);New_Line;
      Put("   - Ville : ");Put_Line(Ptr.Medecin.Ville);
      Put("   - Decision : "); Put(T_Decision'Image(Ptr.Medecin.Decision)); New_Line;
      Put("   - Nombre de visite(s) : ");Put(Ptr.Medecin.NbVisite); New_Line;

   END AffichageMed;

   ------------------------------------------ Suppression d'un medecin -------------------------------------------
   ---------------------------------------------------------------------------------------------------------------

--   PROCEDURE Supp_Med (Ptr : T_Pabr_Med) IS

--   BEGIN

   --      IF Ptr /= NULL THEN


   ------------------------------------------ Modification d'un medecin ------------------------------------------
   ---------------------------------------------------------------------------------------------------------------

   PROCEDURE ModifMed (Ptr : IN OUT T_Pabr_Med) IS

      MedTemp : T_Medecin;
      TestDoublon : Boolean;

   BEGIN

      Put_Line("--- Modification d'un medecin ---");
      Put("   - Entrez le nom d'un medecin : ");
      Saisie(Chaine);

      ptr := RechercheMed(Ptr, Chaine);
      AffichageMed(Ptr);

      LOOP

         Put_Line("   - Que voulez-vous modifier ? :");
         Put_Line("      - 1 Nom");
         Put_Line("      - 2 Prenom");
         Put_Line("      - 3 Ville");
         Put_Line("      - 4 Decision");
         Put_Line("      - 5 Nombre de visite");
         Put_line("      - 6 Quitter");
         Get(K);Skip_Line;

         CASE K IS
            WHEN 1 => Put("      - Nouveau nom : ");
               Saisie(Chaine);
               New_Line;

               MedTemp := ((Chaine, Ptr.Medecin.Identite.Prenom), Ptr.Medecin.Ville, Hesitant, 0);

               DoublonMed(Ptr, MedTemp, erreur);

               IF erreur = false THEN
                  Ptr.Medecin.Identite.Nom := Chaine;
                  AffichageMed(Ptr);
               END IF;


            WHEN 2 => Put("      - Nouveau prenom : ");
               Saisie(Chaine);
               New_Line;

               MedTemp := ((Ptr.Medecin.Identite.Nom, Chaine), Ptr.Medecin.Ville, Hesitant, 0);

               DoublonMed(Ptr, MedTemp, erreur);

               IF erreur = false THEN
                  Ptr.Medecin.Identite.Prenom := Chaine;
                  AffichageMed(Ptr);
               END IF;


            WHEN 3 => Put("      - Nouvelle Ville : ");
               Saisie(Chaine);
               New_Line;

               MedTemp := ((Ptr.Medecin.Identite.Nom, Ptr.Medecin.Identite.Prenom), Chaine, Hesitant, 0);
               Put(Medtemp.Ville);
               put(ptr.medecin.ville);

               DoublonMed(Ptr, MedTemp, erreur);

               IF erreur = false THEN
                  Ptr.Medecin.Ville := Chaine;
                  AffichageMed(Ptr);
               END IF;

            WHEN 4 => Put("      - Enfin changer d'avis !");
               Saisie(Chaine);
               New_line;
               Ptr.Medecin.Decision := T_Decision'Value(Chaine);
               AffichageMed(Ptr);

            WHEN 5 => Put("      - Nombre de visite : ");
               Get(K);Skip_Line;
               New_Line;
               Ptr.Medecin.NbVisite := K;
               AffichageMed(Ptr);

            WHEN OTHERS => Put_Line("      * Procedure terminee.");
               EXIT;
         END CASE;
      END LOOP;

   END ModifMed;

   -------------------------------------- Verif des doublons de medecin ------------------------------------------
   ---------------------------------------------------------------------------------------------------------------

   Procedure DoublonMed (Ptr : T_Pabr_Med ; Med : T_Medecin ; erreur : out boolean) IS

   BEGIN

      Erreur := False;

      IF Ptr /= NULL THEN

         IF Ptr.Medecin.Identite.Nom = Med.Identite.Nom AND
               Ptr.Medecin.Identite.Prenom = Med.Identite.Prenom AND
               Ptr.Medecin.Ville = Med.Ville THEN

            Put_line("Ce medecin existe deja : "); new_line;
            AffichageMed (Ptr);
            Erreur := True;

         ELSE

            DoublonMed(Ptr.Fg, Med, Erreur);
            DoublonMed(Ptr.Fd, Med, Erreur);

         END IF;
      END IF;

   END DoublonMed;






END Abr_Med;