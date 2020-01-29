@isTest
public class TestOrdersTrigger {
    @isTest static void testOrderTriggerInsert() 
    {           
        List<Order__c> orders = dataFactory.createEmployeeOrders(2,2);
        
        Test.startTest();
        insert orders;
        Test.stopTest();
    }
    
    @isTest static void testOrderTriggerUpdate() {
        List<Order__c> insertOrders = dataFactory.createEmployeeOrders(2,2);
        insert insertOrders;

        List<Order__c> o = [SELECT Id,Actual_Finish_Date__c FROM Order__c];
        List<Order__c>updOrders = new List<Order__c>();
        For(Order__c order: o){
            order.Actual_Finish_Date__c = Date.newInstance(2025, 1, 22);
            updOrders.add(order);
                    }
        update o;
        For(Order__c uo: o){
        System.AssertEquals(uo.Actual_Finish_Date__c , Date.newInstance(2025, 1, 22));
        }
    }            
}