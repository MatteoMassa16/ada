WITH Ada.Text_IO,Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med;
USE Ada.Text_IO,Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Abr_Med;

PROCEDURE Main IS

   Pabr_Med : T_Pabr_Med;
   Med : T_Medecin;


BEGIN

   SaisieMed (Med);
   AjoutMed(Pabr_Med, Med);

   LOOP

      Put("Saisir un autre medecin ? O/N");
      Get(C); Skip_Line;

      CASE C IS
         when 'o'|'O' =>    SaisieMed (Med);
            AjoutMed(Pabr_Med, Med);
         WHEN 'n'|'N' => EXIT;
         WHEN OTHERS => Put("WTF, bro !");
      END CASE;

   END LOOP;

   Affichage_Abr(Pabr_Med);

END Main;

