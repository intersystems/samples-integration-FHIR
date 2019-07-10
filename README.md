# samples-integration-FHIR
This code shows a sample FHIR integration solution for InterSystems IRIS for Health. FHIR data can be sent over REST and stored to a FHIR repository. HL7v2 data can also be consumed, converted to FHIR and stored in the FHIR repository. This data can then be retrieved through a REST client.

The full QuickStart can be found at https://learning.intersystems.com/course/view.php?name=FHIR%20Integration

This sample is already loaded into IRIS for Health Learning Labs and the cloud marketplace Evaluator edition. If using this sample with any other installation of InterSystems IRIS for Health, please see setup instructions at the bottom of this README.


## Try this sample
1. Go to your REST client (such as (Chrome's Advanced REST client)[https://chrome.google.com/webstore/detail/advanced-rest-client/hgmloofddffdnphfgcellkdfbfbjeloo?hl=en-US]) and retrieve data for the first patient that is stored in the FHIR repository:  

**HTTP Request**: GET http://YourIP:YourPort/csp/healthshare/fhirnamespace/fhir/stu3/Patient/1    (replacing YourIP and YourPort for IRIS for Health)

**Headers**:

    **Authorization**: SuperUser/SYS (or other credentials that work for your IRIS for Health instance)  
    **Accept**: application/fhir+json
	
2. Store a new AllergyIntolerance resource.  
**HTTP Request**: POST  http://YourIP:YourPort/csp/healthshare/fhirnamespace/fhir/stu3/AllergyIntolerance  
**Headers**:  

    **Authorization**: SuperUser/SYS (or other credentials that work for your IRIS for Health instance)  
    **Content-type**: application/fhir+json;charset=utf-8

**Body**: Copy and paste the (example from the FHIR website)[http://hl7.org/fhir/stu3/allergyintolerance-medication.json.html].  
If successful, you should have gotten a 201 Created message. 	

3. Retrieve the AllergyIntolerance resource again.    
**HTTP Request**: POST    http://YourIP:YourPort/csp/healthshare/fhirnamespace/fhir/stu3/AllergyIntolerance 

4. Open the provided learning IDE (which has a mapped folder between the provided IDE and InterSystems IRIS for Health, named shared).  
Copy and paste home/project/shared/Samples-Integration-FHIR/samples/ADT_A01.txt to the home/project/shared/Samples-Integration-FHIR/in folder.


Problems? If doing this on your local machine, you may need to modify some configuration settings to point to the appropriate folder on your system. Go to the Management Portal > Configuration > Production > Go. Select the From_ADT business service > Settings. Modify the File Path setting to be the path to the In folder within your repository. Click Apply.
 
## Setup to run locally
1. Clone or download this repository. This repository has a folder named data, which contains all files needed to load the sample integration solution as well as folders that contain the sample HL7v2 messages.
2. Next, create a new FHIR namespace with the standard FHIR STU3 production. To do this, in Terminal type:
    >>zn "HSLIB"  
    >>do ##class(HS.HC.Util.Installer.FHIR).Install()  
    >>Namespace : FHIRNamespace  
    >>Install DSTU2? (Y/N) N  
    >>Install STU3? (Y/N) Y  
    >>STU3 CSP App <Press Enter to accept default>  
    >>STU3 CSP Open ID Connect (OAuth 2.0) app <Press Enter to accept default>  
    >>Install STU3 resource repository? (Y/N) Y  
    >>Install STU3 PIXm (Y/N) N  
    >>Install STU3 PDQm? (Y/N) N  
    >>Install STU3 MHD? (Y/N) N  
    >>Continue with Installation? (Y/N) Y  
3. In the Management Portal, navigate to System Explorer > Classes. Select FHIRNamespace as the namespace on the left and import the sample production from /data/FHIRNamespaceProduction.xml.
4. Follow steps in the section above.

