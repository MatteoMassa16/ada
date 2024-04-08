WITH Ada.Text_IO,Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med, Lst_Ville, Lst_Visite, Agenda, Consultant;
USE Ada.Text_IO,Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med, Lst_Ville, Lst_Visite, Agenda, Consultant;

PROCEDURE Main IS

   Confirm : Boolean;


BEGIN

--   Initialisation_Ville(Ville,PVille);
--   Initialisation_Cslt(Cslt, Ptr_Cslt);
--   IniMed(Med);    
--   AfficheCsltTT (ptr_cslt);
--   
--   Put("Nom du gars : ");
--   Saisie(Chaine);
--   
--   Put(Chaine);
   
--   AfficheCslt (RechercheCslt(Ptr_Cslt, Chaine));
 
   
   
   Put("1 -> Ajouter un consultant : ");new_line;
   Put("2 -> Suppression d'un consultant : ");new_line;
   Put("3 -> Rechercher un consultant : "); new_line; new_line;
   Put("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ");new_line;
   Put("4 -> Ajouter un medecin : ");new_line;
   Put("5 -> Saisir un medecin : ");new_line;
   Put("6 -> Rechercher un medecin : ");new_line;
   Put("7 -> Afficher les medecins : ");new_line;
   Put("8 -> Ajouter un medecin : ");new_line;
   Put("9 -> Modifier la fiche d'un medecin : ");New_Line;new_line;
   Put("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ");new_line;

-- Put("10 -> Ajouter un jour dans l'agenda   : ");New_Line;
   Put("11 -> Cree une nouvelle entree dans l'agenda : ");new_line;
   Put("12 -> Ajouter une nouvelle visite : ");new_line;
   Put("13 -> Affichage de l'agenda : ");New_Line;New_Line;
   Put("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ");new_line;

   Put("14 -> Creation d'une nouvelle ville : ");New_line; 
   Put("15 -> Recherche d'une ville : ");New_line; 
   Put("16 -> Suppression d'une ville : ");New_line; 
   Put("17 -> Afficher une ville : ");New_line; 
   Put("18 -> Affichage de toutes les villes  : ");New_line; 

Get(K);skip_line;


   CASE K IS 
      
      WHEN 1 =>
         Put("Veuillez saisir le nom du consultant : " );
         Saisie(Chaine);
      
      WHEN 2 => 
         Put("Veuillez saisir le nom du consultant pour le supprimer : " );
         
      WHEN 3 => 
         Put("Veuillez saisir le nom du consultant : " );
         
      WHEN 4 => 
         
      WHEN 5 =>
           
      WHEN 6 =>
         Put("Veuillez saisir le nom du medecin: " );
         
      WHEN 7
      Put("Veuillez saisir le nom du medecin : " );


    










--   SaisieMed (Med);
--   AjoutMed(Pabr_Med, Med);

--   LOOP

--      New_Line;
--      Put("Saisir un autre medecin ? (O/N)  ");
--      Get(C); Skip_Line;

--      CASE C IS
--         when 'o'|'O' =>    SaisieMed (Med);
--            AjoutMed(Pabr_Med, Med);
--         WHEN 'n'|'N' => EXIT;
--         WHEN OTHERS => Put("WTF, bro !");
--      END CASE;

--   END LOOP;

--   New_Line;
--   AffichageAbr(Pabr_Med);
--   New_Line;

------   new_line;
------   Put_line(" --- Recherche medecin --- ");
------   Put("Entrez le nom d'un medecin : ");
------   Saisie(Chaine);
------   New_Line;

------   IF RechercheMed(Pabr_Med, Chaine) = NULL THEN
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



--   Creajour (Jour);
--   new_line; new_line;
--   Ajoutjour (Pagenda,Jour);
--   new_line;new_line;
--   AfficheAgenda (PAgenda);
--   New_Line;
--   AjoutVisiteListe(pAgenda);





END Main;

