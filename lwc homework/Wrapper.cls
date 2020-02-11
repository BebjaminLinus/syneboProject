public with sharing class Wrapper {
    @AuraEnabled
    public String Name;
    @AuraEnabled
    public String Information;
    public Wrapper(Account account) {
        this.Name = account.Name;
        this.Information = account.Website + ' '+ account.Industry;
    }
    public Wrapper(Contact contact) {
        this.Name = contact.FirstName + ' ' + contact.LastName;
        this.Information = contact.Department;
    }
    public Wrapper(Lead lead) {
        this.Name = lead.FirstName + ' ' + lead.LastName;
        this.Information = lead.Company;
    }
}
