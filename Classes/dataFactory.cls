@isTest
public class dataFactory {
    public static List<Order__c> createEmployeeOrders(Integer numEmpl, Integer numOrdEmpl){
        Client__c megaClient = new Client__c(Name = 'Leroy Jenkins',
                                             Phone_Number__c = 8553535,
                                             Birth_Date__c = Date.newInstance(2001, 1, 1) );
        
        insert megaClient;    
        
        List<Employee__c> testEmployees = new List<Employee__c>();        
        for(Integer i = 0; i < numEmpl; i++)
        {
            Employee__c empl = new Employee__c(Name= 'Test Employee ' + i, Email_Address__c = 'email@test.com',
                                               Phone_Number__c	= 0202021,Position__c = 'Laundress');
            testEmployees.add(empl);
        }
        
        insert testEmployees;
        
        List<Order__c> testOrders = new List<Order__c>();            
        for(Integer j=0; j<numEmpl; j++){
            
            Employee__c emp = testEmployees[j];
            
            for(integer k =0; k<numOrdEmpl; k++)
            {
                testOrders.add(new Order__c( Start_Date__c = Date.newInstance(2020, 1, 22), 
                                             Expected_Finish_Date__c = Date.newInstance(2020, 1, 23),
                                             Price__c = 45, Status__c = 'In the process', Client__c = megaClient.Id, Employees__c = emp.Id));
            }
         }                   
        
        return testOrders; 
        
    }

}