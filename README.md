# Smart contract in the context of clinical trials
***

## Introduction
### What is smart contract ?
It's a contract that has been encoded and stored by each of the participants of a single blockchain. During the execution of the smart contract, all validation steps are recorded in the blockchain used. This makes it possible to secure all the data by **preventing their modification or deletion** after the fact.

### Why using smart contract in health 
Blockchain seems to be an optimal solution for managing health data. Indeed, it would allow to trace the origin and the fate of each recorded data. Moreover, the encryption of data ensures the **confidentiality** and **security** of sensitive data despite their availability to all members of the network.
Each result and document produced during a clinical trial can be :
* recorded on a private blockchain, 
* managed by the regulators, the pharmaceutical company pharmaceutical company and the research organizations. 

The information then becomes **immutable** and **transparent**.

---

## Equipment 
No installation needed, we designed and compiled our code on the [remix.ethereum](https://remix.ethereum.org/) platform.

Langage : Solidity language V0.4.0 to V0.7.0

---

## Objectives
-> Provide a secure and transparent platform for the exchange of data on clinical trial effects. 


---
## Demonstration 
### <ins>Step 1</ins> : registration / recording of the practitioner's address ans the patient
Choose an address for the practittioner and the patient. With the practitioner's address click to register. Then,  in the 'inscriptionPatient' section, add the patient address and the name of the medicine in trials. During the trial, only one drug is prescribed to the patient. 

_NB_ : only the practitionner can register patient address and see data collected (see Step 3).

![](/capture_img/inscrp_me.gif) 

<br>

### <ins>Step 2</ins> : patient add return on the drug 
For this step, enter the address of the selected patient in the "account" section. You now have the possibility, as a patient, to give your feedback on the tested drug. 
The patient's information and comments will be directly associated with the tested drug.

![](/capture_img/patient_section.gif)

<br>

### <ins>Step 3</ins> : view the data collected 
To access the collected data, identify yourself with the doctor's address. There are three ways to search the data: 
* with the patient's address 
* by drug name 
* get all the data recorded

![](/capture_img/call_data.gif)


