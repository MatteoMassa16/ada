WITH Ada.Text_IO, Ada.Integer_Text_IO, Outils, ada.Characters.Handling, agenda;
USE Ada.Text_IO, Ada.Integer_Text_IO, Outils, ada.Characters.Handling, agenda;

Package body Consultant is

----------------------------------------------------------------------------------------
   Procedure Initialisation_Cslt (C: out T_Cslt; Tete: in out T_Ptr_Cslt) IS

   BEGIN

--Lucie Fer
      C.Nom(1..3):= "FER";
      C.Prenom(1..5):= "LUCIE";
      C.Ville(1..8) := "BORDEAUX"; -- "Limoges","Tours");
--      CreaJour(Jour);
--      AjoutJour(Pagenda, Jour);
--      C.pAgenda := pagenda;
      Ajout_Cslt(C, Tete);
      
      C.Nom(1..15):=(OTHERS=> ' ');
      C.Prenom(1..10):=(others=> ' ');
--Martin Guerre
      C.Nom(1..6):= "GUERRE";
      C.Prenom(1..6):= "MARTIN";
      C.Ville(1..8) := "BORDEAUX"; -- "Limoges","Tours");
      Ajout_Cslt(C, Tete);
      C.Nom(1..15):=(OTHERS=> ' ');
      C.Prenom(1..10):=(others=> ' ');

--Alice Merveille
      C.Nom(1..9):= "MERVEILLE";
      C.Prenom(1..5):= "ALICE";
      C.Ville(1..8) := ("BORDEAUX"); -- "Limoges","Tours");
      CreaJour(Jour);
      AjoutJour(Pagenda, Jour);
      C.pAgenda := pagenda;
      Ajout_Cslt(C, Tete);
      C.Nom(1..15):=(OTHERS=> ' ');
      C.Prenom(1..10):=(others=> ' ');


END Initialisation_Cslt;

----------------------------------------------------------------------------------------

   Procedure Supp_Cslt (L: in out T_Ptr_Cslt; ok: out boolean; Cslt: T_Cslt) is
   Begin
      If (L = null) then
         Ok:= false;
      Elsif L.Cslt.Nom = Cslt.nom then
         L:=L.suiv;
         ok:= true;
      Else Supp_Cslt (L.suiv,ok,Cslt);
      End if;
   End supp_cslt;


----------------------------------------------------------------------------------------
   PROCEDURE Ajout_Cslt (C: T_Cslt; tete: IN OUT T_Ptr_Cslt) IS
      Car : Character;

   BEGIN

      IF tete = NULL THEN
         tete:= NEW T_Liste_Cslt'(C, NULL);
      ELSIF C.Nom > tete.Cslt.Nom THEN
         tete:= NEW T_Liste_Cslt'(C,tete);
      ELSIF C.Nom < tete.Cslt.Nom THEN
         Ajout_Cslt (C,Tete.Suiv);   --on appelle rÃ©cursivement la fonction Ajout_Cslt pour insÃ©rer C dans la suite de la liste.
      ELSIF C.Prenom<tete.Cslt.Prenom THEN
         tete:= NEW T_Liste_Cslt'(C,tete);
      ELSIF C.Prenom > tete.Cslt.Prenom THEN -- Son prenom est plus grand, on insÃ¨re le consultant en tÃªte de liste.
         Ajout_Cslt(C,tete.Suiv);
      ELSE
         LOOP
            BEGIN
               Put("Le nom existe deja"); New_Line;
               Put("Voulez-vous completer le prenom ? OUI (O) ou NON (N)"); New_Line;
               Get(Car); skip_line;
               EXIT WHEN Car='O' OR Car='o' OR Car='n' OR Car='N';
            END;
         END LOOP;
      END IF;
   END Ajout_Cslt;

----------------------------------------------------------------------------------------
   
--  PROCEDURE MAJ_Cslt (tete: IN OUT T_Ptr_Cslt; T: OUT T_Cslt; J: Jour) IS
--   BEGIN
--      IF J= T_semaine'value("lundi") THEN
--         IF tete/=NULL THEN
--            tete.C.Cslt:= tete.C.Cslt_Suiv;
--            initiaTab(T);
--            tete.C.Cslt_Suiv:=T;
--         END IF;
--      END IF;

--   END MAJ_Cslt ;
------------------------------------------------------------------------------------------


--   PROCEDURE Affichage_Cslt (tete: T_Ptr_Cslt) IS
--      ID: T_Ptr_Cslt:=Tete;
--      k: integer;
--   BEGIN

--      FOR i IN C.Nom'RANGE LOOP
--         C.Nom(i) :=' ';
--      END LOOP;

--      FOR i IN C.Prenom'RANGE LOOP
--         C.Prenom(i) :=' ';
--      END LOOP;

--      put("Saisir le nom du consultant: ");
--      get_line(C.Nom,k);
--      put("Saisir le prenom du consultant: ");
--      get_line(C.Prenom,k);

--      WHILE ID/=null loop
--         IF ID.Cslt.Nom = C.Nom AND ID.cslt.Prenom = C.Prenom THEN

--            FOR i IN T_semaine LOOP
--               new_line;
--               put(T_semaine'image(i));
--               new_line;
--               FOR j IN T_creneau LOOP
--                  put(T_creneau'image(j));
--                  put(": ");
--                  put(ID.C. -- VISITE?(i,j));
--                  new_line;
--               END LOOP;
--            END LOOP;
--         END IF;
--         ID:=ID.suiv;
--      END LOOP;
--   END Affichage_Cslt;
--   
----------------------------------------------------------------------------------------
   
   --PROCEDURE RemiseZ (L: IN OUT T_Ptr_Cslt) IS --pour chaque debut de semaine
   --BEGIN
   --      IF (L/= NULL) THEN
   --         IF L.Jour= Lundi THEN
   --            L.C.F_Depla := 0;
   --            RemiseZ (L, Deplacement);
   --         ELSE
   --            RemiseZ (L.Suiv, Deplacement);
   --         END IF;
   --      END IF;
   --END RemiseZ ;
   
----------------------------------------------------------------------------------------
 PROCEDURE AfficheCsltTT (P : T_ptr_Cslt) IS

   BEGIN


      IF P /= NULL THEN

         Put(P.Cslt.Nom);Put(" ");Put(P.Cslt.Prenom); New_Line;
         Put("SA ville : "); Put(P.Cslt.Ville);
         New_Line;New_Line;
         
         AfficheAgenda(P.Cslt.Pagenda);
         
         AfficheCsltTT(P.Suiv);

      END IF;

   END AfficheCsltTT;




----------------------------------------------------------------------------------------

 FUNCTION RechercheCslt (Ptr: T_Ptr_Cslt; Nom :T_Mot) RETURN T_ptr_Cslt IS

   BEGIN

      IF Ptr /= NULL THEN

         IF Ptr.Cslt.Nom = Nom THEN
            RETURN (Ptr);
         ELSE
           RETURN(RechercheCslt(Ptr.suiv,Nom));                     
         END IF;

      ELSE
         RETURN (NULL);
      END IF;
      
   END RechercheCslt ;
   

   --- Affichage d'un consultant ---
   --------------------------
   
 PROCEDURE AfficheCslt (P : T_ptr_Cslt) IS

 BEGIn
         if p/= null then
         Put(P.Cslt.Nom);Put(" ");Put(P.Cslt.Prenom); New_Line;
         Put("SA ville : "); Put(P.Cslt.Ville);
         New_Line;New_Line;

end if;
 END AfficheCslt;
----------------------------------------------------------------------------------------
    

END Consultant ;
