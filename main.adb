WITH Ada.Text_IO,Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med, Lst_Ville, Lst_Visite, Agenda, Consultant;
USE Ada.Text_IO,Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med, Lst_Ville, Lst_Visite, Agenda, Consultant;

PROCEDURE Main IS

   Confirm : Boolean;


BEGIN

--   Initialisation_Ville(Ville,PVille);
   Initialisation_Cslt(Cslt, Ptr_Cslt);
--   IniMed(Med);
--   AfficheCsltTT (ptr_cslt);
--
--   Put("Nom du gars : ");
--   Saisie(Chaine);
--
--   Put(Chaine);

--   AfficheCslt (RechercheCslt(Ptr_Cslt, Chaine));

   LOOP
      
   Put("1 -> Ajouter un consultant : ");new_line;
   Put("2 -> Suppression d'un consultant : ");new_line;
   Put("3 -> Affichage consultant : "); new_line; new_line; 
   Put("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ");new_line;
   Put("4 -> Ajouter un medecin : ");new_line;
   Put("5 -> Saisir un medecin : ");new_line;
   Put("6 -> Afficher les medecins : ");new_line;
   Put("7 -> Modifier la fiche d'un medecin : ");New_Line;new_line;
   Put("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ");new_line;

   Put("8 -> Ajouter un jour dans l'agenda   : ");New_Line;
   Put("9 -> Cree une nouvelle entree dans l'agenda : ");new_line;
   Put("10 -> Ajouter une nouvelle visite : ");new_line;
   Put("11-> Affichage de l'agenda : ");New_Line;New_Line;
   Put("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ");new_line;

   Put("12 -> Creation d'une nouvelle ville : ");New_line;
   Put("13 -> Recherche d'une ville : ");New_line;
   Put("14 -> Suppression d'une ville : ");New_line;
   Put("15 -> Afficher une ville : ");New_line;
   Put("16 -> Affichage de toutes les villes  : ");New_line;

Get(K);skip_line;

   CASE K IS

      WHEN 1 =>
         Put("Veuillez saisir le nom du consultant : " );
            Saisie(Chaine);
            Ajout_Cslt (Cslt,Ptr_Cslt);

      WHEN 2 =>
         Put("Veuillez saisir le nom du consultant pour le supprimer : " );
         Supp_Cslt (Ptr_Cslt,Confirm,Cslt) ;

      WHEN 3 =>
            LOOP
               Put_line("Affiche_Cslt");
               Put_line("- 1 Affiche un consultant : ");
               put_line("- 2 Affiche tous les consultants : ");
               Get(K);Skip_Line;
               
                              
               CASE K IS
                     WHEN 1 => 
                     Put("Nom du consultant : " );
                     Saisie(Chaine);
                     AfficheCslt(RechercheCslt(Ptr_Cslt,chaine));
                     
                     WHEN 2 => AfficheCsltTT(Ptr_Cslt);
                     WHEN others =>
                     EXIT;      
               END CASE;
            END LOOP ;
            
               
      WHEN 4 =>
         Put("Veuillez ajoutez un medecin : " );
          AjoutMed (PAbr_Med,Med);  
            


      WHEN 5 =>
           Put("Veuillez saisir les donnees du medecin: " );
            Saisie(Chaine);
            SaisieMed (Med);

      WHEN 6 =>
         LOOP
               Put_line("AffichageMed");
               Put_line("- 1 Affiche un medecin : ");
               put_line("- 2 Affiche tous les medecins : ");
               Get(K);Skip_Line;
               
                              
               CASE K IS
                     WHEN 1 => 
                     Put("Nom du medecin : " );
                     Saisie(Chaine);
                     AffichageMed(RechercheMed(Pabr_Med,Chaine));
                     
                     WHEN 2 => AffichageAbr(Pabr_Med);
                     WHEN others =>
                     EXIT;      
               END CASE;
            END LOOP ;
            
      WHEN 7 =>
       Put("Veuillez saisir les modifications a apporter a la fiche medecin : " );
            
            ModifMed (Pabr_Med);

      
      WHEN 8 =>
            Put("Modification de la fiche medecin : ");

         WHEN 0 => EXIT;

      WHEN 9 =>
       Put("Veuillez saisir les modifications a apporter a la fiche medecin : " );
            
            ModifMed (Pabr_Med);

      WHEN 10 =>
       Put("Veuillez saisir les modifications a apporter a la fiche medecin : " );
            
            ModifMed (Pabr_Med);


      WHEN 11 =>
       Put("Veuillez saisir les modifications a apporter a la fiche medecin : " );
            
            ModifMed (Pabr_Med);

      WHEN 12 =>
         Put("Veuillez saisir la nouvelle ville : " );
            Saisie(Chaine);
            CreaVille (Ville,Chaine);
   
      WHEN 13 =>
      LOOP
               Put_line("AfficheVille");
               Put_line("- 1 Affiche d'une ville : ");
               put_line("- 2 Affiche toutes les villes : ");
               Get(K);Skip_Line;
               
                              
               CASE K IS
                     WHEN 1 => 
                     Put("Nom de la ville : " );
                     Saisie(Chaine);
                     AfficheVille(PVille,Chaine);
                     
                     WHEN 2 => AfficheVilleTT(PVille);
                     WHEN others =>
                     EXIT;      
               END CASE;
            END LOOP ;
         
       WHEN 14 =>
         Put("Veuillez saisir le nom de la ville pour la supprimer : " );
         SuprVille(PVille,Chaine) ;


      When others =>   
            NULL;
            
END CASE;
END LOOP;


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

