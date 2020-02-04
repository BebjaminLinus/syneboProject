public with sharing class Component1ApexController {
    
    @AuraEnabled
    public static List<Client__c> getCLients(String Name) {
        List<Client__c> client = new List<Client__c>();
        
        String clientQuery = 'SELECT Id, Name, Birth_Date__c, Phone_Number__c, Email_Address__c FROM Client__c'; 
        
        if (String.isBlank(Name)){
            client = Database.query(clientQuery);
        }else {
            client = Database.query(clientQuery + ' WHERE Name LIKE  \'%'+name+ '%\'');
        }
        return client;
    }
}