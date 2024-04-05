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

      Cslt: T_Consultant;

      Suiv: T_Ptr_Cslt;

   END RECORD;


   PROCEDURE Initialisation_Cslt (C: out T_Cslt; Tete: in out T_Ptr_Cslt) ;
   PROCEDURE Supp_Cslt (L: in out T_Ptr_Cslt; ok: out boolean; Cslt: T_Cslt) ;
   PROCEDURE Ajout_Cslt (C: out T_Cslt; tete: IN OUT T_Ptr_Cslt) ;
   PROCEDURE Saisie_Cslt (C: OUT T_Cslt; T: in out T_TabVisite ;


END Consultant;

