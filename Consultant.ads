WITH Outils, ada.Text_IO, ada.Characters ;
USE Outils, ada.Text_IO, ada.Character ;

Package Consultant is

   TYPE T_Consultant IS RECORD --définition consultant

      Nom: T_Mot :=(OTHERS =>' ');

      Prenom: T_Mot:=(OTHERS =>' ');

      Ville: character;

      Visite: T_pVisite;

      Frais_Dpl: Float;


      END RECORD;

 T_ListeConsultant is record
	Consultant : T_consultant;
	suiv : T_ptr;
 END RECORD;

   TYPE T_Liste_Cslt;

   TYPE T_Ptr_Cslt IS ACCESS T_Liste_Cslt;

   TYPE T_ListeConsultant IS RECORD

      Cslt: T_ T_Consultant;

      Suiv: T_Ptr_Cslt;

   END RECORD;


   Procedure Initialisation_Cslt (C: out T_Cslt; Tete: in out T_Ptr_Cslt);


END Consultant;

