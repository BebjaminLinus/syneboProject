public class AnmalToDB {
    
    public static ID addAnimal(Integer externalId){
        ID sfAnimalId;		       
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + externalId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200){
        	animalTransfer animalToTransfer = animalTransfer.parse(response.getBody());
            if(animalToTransfer.Animal.id != 0){  
            	                  
                    Animal__c newAnimal = new Animal__c(Name = animalToTransfer.Animal.name,
                                                        Eats__c = animalToTransfer.Animal.eats,
                                                       	Says__c = animalToTransfer.Animal.says,
                                                        webServiceID__c = animalToTransfer.Animal.id );
                    insert newAnimal;
                    System.debug('Animal created. The id is: ' + newAnimal.ID);
                    sfAnimalId = newAnimal.ID;               
        	}
        }
        
        return sfAnimalId; 
    }

}