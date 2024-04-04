WITH Ada.Text_IO, Ada.Integer_Text_IO, ada.Characters.Handling;
USE Ada.Text_IO, Ada.Integer_Text_IO, ada.Characters.Handling;

Package body Consultant is

----------------------------------------------------------------------------------------
   Procedure Initialisation_Cslt (C: out T_Cslt; Tete: in out T_Ptr_Cslt);

   BEGIN

--Lucie Fer
      C.Nom(1..3):= "Fer";
      C.Prenom(1..5):= "Lucie";
      C.Ville := ("Bordeaux","Limoges","Tours");
      Ajout_Cslt(C, Tete);
      C.Nom(1..15):=(OTHERS=> ' ');
      C.Prenom(1..10):=(others=> ' ');

--Martin Guerre
      C.Nom(1..6):= "Guerre";
      C.Prenom(1..6):= "Martin";
      C.Ville := ("Bordeaux","Limoges","Tours") ;
      Ajout_Cslt(C, Tete);
      C.Nom(1..15):=(OTHERS=> ' ');
      C.Prenom(1..10):=(others=> ' ');

--Alice Merveille
      C.Nom(1..9):= "Merveille";
      C.Prenom(1..5):= "Alice";
      C.Ville := ("Bordeaux","Limoges","Tours") ;
      Ajout_Cslt(C, Tete);
      C.Nom(1..15):=(OTHERS=> ' ');
      C.Prenom(1..10):=(others=> ' ');

----------------------------------------------------------------------------------------


   END Initialisation_Cslt;

   Procedure Supp_Cslt (L: in out T_Ptr_Cslt; ok: out boolean; Cslt: T_Cslt) is
   Begin
      If (L = null) then
         Ok:= false;
      Elsif (L.Cslt.DmDepart = True) then
         L:=L.suiv;
         ok:= true;
      Else Supp_Cslt (L.suiv,ok,Cslt);
      End if;
   End;


----------------------------------------------------------------------------------------
   PROCEDURE Ajout_Cslt (C: out T_Cslt; tete: IN OUT T_Ptr_Cslt) IS
      Car : Character;

   BEGIN

      IF tete = NULL THEN
         tete:= NEW T_Cell_Cslt'(C, NULL);
      ELSIF C.Nom > tete.Cslt.Nom THEN
         tete:= NEW T_Cell_Cslt'(C,tete);
      ELSIF C.Nom < tete.Cslt.Nom THEN
         Ajout_Cslt (C,Tete.Suiv);   --on appelle récursivement la fonction Ajout_Cslt pour insérer C dans la suite de la liste.
      ELSIF C.Prenom<tete.C.Prenom THEN
         tete:= NEW T_Cell_Cslt'(C,tete);
      ELSIF C.Prenom > tete.Cslt.Prenom THEN -- Son prenom est plus grand, on insère le consultant en tête de liste.
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

   PROCEDURE Saisie_Cslt (C: OUT T_Cslt; T: in out T_TabVisite) IS
      K: Integer:=0;

   BEGIN
      initiaTab(T);
      C.VisiteM:=T;
      C.VisiteM_Suiv:=T;


      LOOP
         FOR i IN C.Nom'RANGE LOOP
            C.Nom(i):=' ';
         END LOOP;

         Put("Votre Nom : "); Get_line(C.Nom,k);

         FOR i IN C.Nom'RANGE LOOP
            C.Nom(i):=to_lower(C.Nom(i));
         END LOOP;

         C.Nom(1):=To_Upper(C.Nom(1)); -- EN MAJUSCULE

         for i in B.Prenom'range loop
            B.Prenom(i):=' ';
         end loop;

         Put("Votre prenom: "); Get_line(B.Prenom,k);

         for i in B.Nom'range loop
            B.Prenom(i):=to_lower(B.Prenom(i));
         end loop;

         B.Prenom(1):=To_Upper(B.Prenom(1));

--         loop
--            begin
--               Put("Votre : "); Get(C.); skip_line;
--               IF C. <quelque chose THEN
--                  Put ("Vous n'avez pas ... recquis pour vous inscrire"); new_line;
--               ELSE
--                  exit;
--               end if;

            exception
               when Data_Error =>skip_line; put("Erreur de saisie, veuillez recommencez"); new_line;
            
         end loop;
         EXIT;
      END LOOP;
   END;
