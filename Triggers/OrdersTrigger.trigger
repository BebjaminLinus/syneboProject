trigger OrdersTrigger on Order__c (after insert, after update) {
    
    HandleClass hndlr = new HandleClass();
    if(Trigger.isInsert)
    {
        hndlr.isInsert(Trigger.newMap);
    }
    else
    {
        hndlr.isUpdate(Trigger.newMap, Trigger.oldMap);
    }
    
}