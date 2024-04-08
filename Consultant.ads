WITH Outils, ada.Text_IO, ada.Characters, agenda ;
USE Outils, ada.Text_IO, ada.Characters, agenda ;

Package Consultant is

   TYPE T_Cslt IS RECORD --dÃ©finition consultant

      Nom: T_Mot :=(OTHERS =>' ');

      Prenom: T_Mot:=(OTHERS =>' ');

      Ville: T_Mot;

      PAgenda: T_Pagenda;            

      Frais_Dpl: Float;


      END RECORD;



   TYPE T_Liste_Cslt;

   TYPE T_Ptr_Cslt IS ACCESS T_Liste_Cslt;

   TYPE T_Liste_Cslt IS RECORD

      Cslt:T_Cslt;

      Suiv: T_Ptr_Cslt;

   END RECORD;
   
   Cslt : T_Cslt;
   ptr_Cslt : T_ptr_Cslt;



   PROCEDURE Initialisation_Cslt (C: out T_Cslt; Tete: in out T_Ptr_Cslt) ;
   PROCEDURE Supp_Cslt (L: in out T_Ptr_Cslt; ok: out boolean; Cslt: T_Cslt) ;
   PROCEDURE Ajout_Cslt (C: T_Cslt; tete: IN OUT T_Ptr_Cslt) ;
-- PROCEDURE Saisie_Cslt (C: OUT T_Cslt; T: in out T_TabVisite) ;
 --PROCEDURE RemiseZ (L: IN OUT T_Ptr_Cslt);
   PROCEDURE AfficheCslt (P : T_Ptr_Cslt);
   PROCEDURE AfficheCsltTT (P : T_Ptr_Cslt);
   FUNCTION RechercheCslt (Ptr: T_Ptr_Cslt; Nom :T_Mot) RETURN T_Ptr_Cslt;
   
   
   
-- PROCEDURE MAJ_Cslt (tete: IN OUT T_Ptr_Cslt; T: OUT T_Cslt; J: Jour);


END Consultant;

