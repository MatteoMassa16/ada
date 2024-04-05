WITH Ada.Text_IO,Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med, Lst_Ville, Lst_Visite, agenda;
USE Ada.Text_IO,Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med, Lst_Ville, Lst_Visite, agenda;

PROCEDURE Main IS

   Confirm : Boolean;


BEGIN

   SaisieMed (Med);
   AjoutMed(Pabr_Med, Med);

   LOOP

      New_Line;
      Put("Saisir un autre medecin ? (O/N)  ");
      Get(C); Skip_Line;

      CASE C IS
         when 'o'|'O' =>    SaisieMed (Med);
            AjoutMed(Pabr_Med, Med);
         WHEN 'n'|'N' => EXIT;
         WHEN OTHERS => Put("WTF, bro !");
      END CASE;

   END LOOP;

   New_Line;
   AffichageAbr(Pabr_Med);
   New_Line;

----   new_line;
----   Put_line(" --- Recherche medecin --- ");
----   Put("Entrez le nom d'un medecin : ");
----   Saisie(Chaine);
----   New_Line;

----   IF RechercheMed(Pabr_Med, Chaine) = NULL THEN
----      Put("Ce medecin n'existe pas");
----   ELSE
----      AffichageMed(RechercheMed(Pabr_Med, Chaine));
----   END IF;
----
--   ModifMed(Pabr_Med);
--   AffichageAbr(Pabr_Med);

--   Creaville(Ville);
--   AjoutVille(PVille, Ville, Confirm);

--   LOOP

--      Put("Saisir une autre ville ? O/N");
--      get(C);Skip_line;
--      OuiNon(C,Res);

--      IF Res THEN
--         Creaville(Ville);
--         AjoutVille(PVille, Ville, Confirm);
--      ELSE
--         EXIT;
--      END IF;
--   END LOOP;

--   AfficheVilleTT(PVille);

--   New_Line;
--   Put("Ville a supprimer");
--   Saisie(Chaine);

--   SuprVille(Pville, chaine);

--   AfficheVilleTT(PVille);
   --CreaVisite (Visite, PAbr_Med);



   Creajour (Jour);
   Ajoutjour (Pagenda,Jour);
   AfficheAgenda (PAgenda);




END Main;

