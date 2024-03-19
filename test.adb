with Ada.Integer_Text_IO, ada.Text_IO;
USE Ada.Integer_Text_IO, Ada.Text_IO;

PROCEDURE Test IS

   PROCEDURE Saisie (S : OUT String) IS
      S:String(1..10);
      k:integer;

   BEGIN

      S:= (OTHERS=>' ');
      Get_Line(S,K);

   END Saisie;

   S:String;


BEGIN

   Put("saisie : ");
   put(saisie(s));


END Test;

