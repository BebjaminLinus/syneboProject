public class HandleClass {
    
    public void isInsert(Map<ID, Order__c> newOrders)
    {
        Map<ID, Order__c> empty = new Map<ID, Order__c>();
        dataForProcessing(newOrders, empty);
    }
    
    public void isUpdate(Map<ID, Order__c> newOrders, Map<ID, Order__c> oldOrders)
    {
        dataForProcessing(newOrders, oldOrders);
    }
    
    public void dataForProcessing(Map<ID, Order__c> newOr, Map<ID, Order__c> oldOr)
    {
        Set<ID> emplsID = new Set<ID>();        
        
   		for(ID ordID : newOR.keySet())
    		{   if(!oldOr.isEmpty())  
            	{
        			Order__c Oldord = oldOr.get(ordId);
            		Order__c Neword = newOr.get(ordId);
                	if(Oldord.Employees__c != Neword.Employees__c || Oldord.Status__c != Neword.Status__c)
                	{
                    	emplsID.add(Oldord.Employees__c);
                    	emplsID.add(Neword.Employees__c);
                	}
            	}
             	else
                {
                    Order__c Neword = newOr.get(ordId);
                    emplsID.add(Neword.Employees__c);
				}
    		}        
    
    	List<Employee__c> empls = [SELECT ID, (SELECT ID, Status__c FROM Orders__r)
                             FROM Employee__c WHERE ID IN :emplsID];
        
        batchHandlerService orderAmount = new batchHandlerService();
        orderAmount.CountOrders(empls);
                        
    }

}