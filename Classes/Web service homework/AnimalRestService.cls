@RestResource(urlMapping='/Animals/*')
global class AnimalRestService {
    @HttpGet
    global static ID getAnimalById() {
        
        ID resultID;
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String animalExternalId = request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1);
        
        Animal__c[] animals = [Select ID FROM Animal__c WHERE webServiceID__c = :integer.valueOf(animalExternalId)];
        
        if(animals.isEmpty()){
            ID createdID = AnmalToDB.addAnimal(integer.valueOf(animalExternalId));
            resultID = createdID;
        }
        else{resultID = animals[0].ID;}
        
        return resultID;
    }

}