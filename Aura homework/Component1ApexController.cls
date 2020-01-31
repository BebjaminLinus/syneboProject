public with sharing class Component1ApexController {
    
    @AuraEnabled
    public static List<Client__c> getCLients(String Name) {
        List<Client__c> client = new List<Client__c>();
        if (String.isBlank(Name)){
            client = [SELECT Id, Name, Birth_Date__c, Phone_Number__c, Email_Address__c 
                FROM Client__c];
        }else {
            client = [SELECT Id, Name, Birth_Date__c, Phone_Number__c, Email_Address__c
                FROM Client__c where Name = :Name];
        }
        return client;
    }
}