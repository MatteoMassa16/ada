WITH Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO;
USE Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO;

PACKAGE Outils IS


------------------------------------------------------------------------------
   TYPE Noeud;
   TYPE Arbre IS ACCESS Noeud;
   TYPE Noeud IS RECORD
      Op: Character:='#'; -- On représente les opérateurs par des caractères pou simplifier.
      Operande: Integer:= 0;
      Fg,Fd : Arbre;
   END RECORD;

------------------------------------------------------------------------------


FUNCTION Is_Feuille (A : Arbre) RETURN Boolean;-- Retourne vrai si feuille
PROCEDURE SaisieArb (A : IN OUT Arbre );
FUNCTION Profondeur (A : Arbre ) RETURN Integer;
PROCEDURE Affichage (A: IN Arbre);
FUNCTION Forme (A: T_Arbre; OK) RETURN Boolean;



END Outils;
