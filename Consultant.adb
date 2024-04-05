WITH Ada.Text_IO, Ada.Integer_Text_IO, Outils, ada.Characters.Handling;
USE Ada.Text_IO, Ada.Integer_Text_IO, Outils, ada.Characters.Handling;

Package body Consultant is

----------------------------------------------------------------------------------------
   Procedure Initialisation_Cslt (C: out T_Cslt; Tete: in out T_Ptr_Cslt) IS

   BEGIN

--Lucie Fer
      C.Nom(1..3):= "Fer";
      C.Prenom(1..5):= "Lucie";
      C.Ville := "Bordeaux"; -- "Limoges","Tours");
      Ajout_Cslt(C, Tete);
      C.Nom(1..15):=(OTHERS=> ' ');
      C.Prenom(1..10):=(others=> ' ');

--Martin Guerre
      C.Nom(1..6):= "Guerre";
      C.Prenom(1..6):= "Martin";
      C.Ville := ("Bordeaux"); -- "Limoges","Tours");     
      Ajout_Cslt(C, Tete);
      C.Nom(1..15):=(OTHERS=> ' ');
      C.Prenom(1..10):=(others=> ' ');

--Alice Merveille
      C.Nom(1..9):= "Merveille";
      C.Prenom(1..5):= "Alice";
      C.Ville := ("Bordeaux"); -- "Limoges","Tours");
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
   End;


----------------------------------------------------------------------------------------
   PROCEDURE Ajout_Cslt (C: T_Cslt; tete: IN OUT T_Ptr_Cslt) IS
      Car : Character;

   BEGIN

      IF tete = NULL THEN
         tete:= NEW T_Liste_Cslt'(C, NULL);
      ELSIF C.Nom > tete.Cslt.Nom THEN
         tete:= NEW T_Liste_Cslt'(C,tete);
      ELSIF C.Nom < tete.Cslt.Nom THEN
         Ajout_Cslt (C,Tete.Suiv);   --on appelle récursivement la fonction Ajout_Cslt pour insérer C dans la suite de la liste.
      ELSIF C.Prenom<tete.Cslt.Prenom THEN
         tete:= NEW T_Liste_Cslt'(C,tete);
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

