global class ordersBatchClass implements 
    Database.Batchable<sObject>, Database.Stateful{
        
        // instance member to retain state across transactions
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID FROM Employee__c');
        
    }
    global void execute(Database.BatchableContext bc, List<Employee__c> scope){
        // process each batch of records
        BatchService orderAmount = new BatchService();
        orderAmount.CountOrders(scope);
        
    }    
    global void finish(Database.BatchableContext bc){        
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];    
        
        System.debug('Total Jobs Process:  ' + job.TotalJobItems + 'batches with '+ job.NumberOfErrors + ' errors.');
        
    }  

}