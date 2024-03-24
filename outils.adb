WITH Ada.Text_IO, Ada.Integer_Text_IO, Outils,ada.characters.Handling;
USE Ada.Text_IO, Ada.Integer_Text_IO, Outils,ada.characters.Handling;


PACKAGE BODY Outils IS

   PROCEDURE Saisie (S:OUT String) IS

      Erreur : Boolean := False;

   BEGIN

      LOOP
         Cmpt := 0;

      S:=(OTHERS=>' ');
      Get_Line(S,K);

         FOR I IN S'RANGE LOOP
            CASE s(I) IS
               WHEN 'a'..'z'|'A'..'Z' => Erreur := false;
               WHEN '-' => Erreur := False; cmpt := cmpt + 1;
               when ' ' => Erreur := False; Cmpt := cmpt + 1;
               WHEN OTHERS => Erreur := True;
                  Put("La saisie ne peut contenir que des lettres, espaces et '-'");New_Line;
                  put("Nouvelle saisie : ");
                  EXIT;
            END CASE;
         END LOOP;

         IF Cmpt = S'Length THEN
            Put("->");Put(S);Put_Line(" => ce n'est pas un mot ... ");
            Put("Nouvelle saisie : ");
            Erreur := True;
         END IF;

         EXIT WHEN Erreur = False;

      END LOOP;

      S := To_Upper(S);

   END Saisie;

   --- Choix : Oui / Non ---
   -------------------------

   Procedure OuiNon (C : Character ; Res : out boolean) IS

   BEGIN

      loop
         CASE C IS
            WHEN 'o'|'O' => Res := True; exit;
            WHEN 'n'|'N' => Res := False; exit;
            When others => put_line("Entrez O pour oui ou N pour non");
         END CASE ;
      END LOOP;

   END OuiNon;


END Outils;


