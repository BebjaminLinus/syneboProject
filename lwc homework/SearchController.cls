public with sharing class SearchController {
    @AuraEnabled
    public static List<Wrapper> searchAccount(String accName) {
        List<List<sObject>> searchList = [FIND :accName IN ALL FIELDS
                RETURNING Account(Id,Name,Website,Industry, Phone),Contact(FirstName,LastName,Department), Lead(Name,Company)];
        List<Account> searchAccounts = (Account[])searchList[0];
        List<Contact> searchContacts = (Contact[])searchList[1];
        List<Lead>    searchLeads = (Lead[])searchList[2];
        List<Wrapper> records = new List<Wrapper>();
        for(Account account: searchAccounts){
            records.add(new Wrapper(account));
        }
        for(Contact contact: searchContacts){
            records.add(new Wrapper(contact));
        }
        for(Lead lead: searchLeads){
            records.add(new Wrapper(lead));
        }
        return records;
    }
}
