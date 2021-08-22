pragma solidity >=0.4.0 <0.7.0; 
pragma experimental ABIEncoderV2;

contract EssaisCliniques {
    
    mapping (address => uint) LPatient; // list de patient inscrit (autorise le retour d'essai de medicament)
    mapping (address => uint) LMedecin; // list de medecin inscrit (autorise l'inscrition patient)

    struct retourPatient {
        address patient;
        string nomMedic;
        string retourDuPatient;
    }
    
    retourPatient private retourP; // instanciation de la structure  // tableau retourP 
    retourPatient[] private retourPatients; 
    
    struct MedicEssai {
        string medicName;
    }
    mapping (address => MedicEssai) medicEssai; // permet recup les add patient pour un medicament donné
    
    
    function inscriptionMedecin() public {
        require(LMedecin[msg.sender]==0, "Vous êtes déjà inscrit en tant que Medecin");
        LMedecin[msg.sender] += 1;
    }
    function inscriptionPatient (address patient, string memory _medicName) public { 
    // verifier medecin inscrit, verifier entrée (add + medicament) non nulle 
    // si tout ok alors incrit le patient dans la liste + stock l'add par le nom du medicament  
        require (LMedecin[msg.sender] ==1 , "Vous n'êtes pas inscrit en tant que Medecin, Accès refusé"); 
        require (patient != address(0), "Identifier le patient à inscrire"); 
        require (bytes(_medicName).length > 0 , "Communiquer le medicament"); 
        LPatient[patient] += 1;
        
        medicEssai[patient].medicName = _medicName;
    }
    
    function retourEssaiPatient(string memory descPatient) public returns (string memory) {
    // permet au patient de faire son retour (on stock son adresse en meme temps), 
        require (bytes(descPatient).length > 0 , "Communiquez la description"); 
        require (LPatient[msg.sender] ==1 , "Vous n'êtes pas inscrit en tant que patient, Accès refusé"); 
        retourPatient memory nouveauRetour = retourPatient(msg.sender, medicEssai[msg.sender].medicName, descPatient);
        retourPatients.push(nouveauRetour);
    }
    function stringsEqual(string storage _a, string memory _b) internal returns (bool) { 
        bytes storage a = bytes(_a); 
        bytes memory b = bytes(_b); 
        if (a.length != b.length) return false; 
        // @todo unroll this loop 
        for (uint i = 0; i < a.length; i ++) 
        if (a[i] != b[i]) return false; 
        return true; 
    }
    
    function GetAllReturn() public view returns (retourPatient[] memory) {
    // seul le medecin peut vérifier ces informations 
    // retourne les add patient et les retours associé du médicament cherché
        require(LMedecin[msg.sender]==1, "Vous n'êtes pas inscrit en tant que Medecin, Accès refusé");
        return retourPatients;
    }
    function GetReturnByAddress(address addpatient) public view returns (retourPatient[] memory) {
    // seul le medecin peut vérifier ces informations 
    // retourne les add patient et les retours associé du médicament cherché
        require(LMedecin[msg.sender]==1, "Vous n'êtes pas inscrit en tant que Medecin, Accès refusé");
        retourPatient[] memory subMsgs = new retourPatient[](retourPatients.length);
        uint count = 0;
        for (uint i=0; i<retourPatients.length ; i++) {
            if (retourPatients[i].patient == addpatient) {
                subMsgs[count] = retourPatients[i];
                count++;
            }
        }
        return subMsgs; 
    }
    function GetReturnByMedicament(string memory _medicName) public returns (retourPatient[] memory) {
    // seul le medecin peut vérifier ces informations 
    // retourne les add patient et les retours associé du médicament cherché
        require(LMedecin[msg.sender]==1, "Vous n'êtes pas inscrit en tant que Medecin, Accès refusé");
        retourPatient[] memory subMsgs = new retourPatient[](retourPatients.length);
        uint count = 0;
        for (uint i=0; i<retourPatients.length ; i++) {
            require (stringsEqual(retourPatients[i].nomMedic,_medicName) == true, "Pas de retour sur ce medicament");
            subMsgs[count] = retourPatients[i];
            count++;
        }
        return subMsgs; 
    }
}