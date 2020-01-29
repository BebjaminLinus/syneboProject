@isTest
public class testOrdersBatch {
    @testSetup 
    static void setup() {
        List<Order__c> orders = dataFactory.createEmployeeOrders(2,2);
        insert orders;
        //System.debug(orders);            
    }
    
    static testmethod void test() {        
        Test.startTest();
        ordersBatchClass obc = new ordersBatchClass();
        Id batchId = Database.executeBatch(obc);
        Test.stopTest();
        
        List<Employee__c> empls = [SELECT ID, Orders_In_the_process__c FROM Employee__c];
        for(Employee__c empl : empls){            
            System.assertEquals(2, empl.Orders_In_the_process__c);
        }
        
    }
}