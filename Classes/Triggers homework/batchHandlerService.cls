public class batchHandlerService {
    
    public void CountOrders(List<Employee__c> empls){
        
        for(Employee__c emp : empls){            
        		integer Aw = 0, InThPr = 0, Cmplt = 0;

        		for(integer i = 0; i < emp.Orders__r.size(); i++)
                {                                                                
                    if(emp.Orders__r[i].Status__c == 'Awaiting')
                    {
                        Aw++;
                    }
                    else if(emp.Orders__r[i].Status__c == 'In the process')
                    {
                        InThPr++;
                    }
                    else
                    {
                        Cmplt++;
                    }                   
                }
                emp.Orders_In_the_process__c = InThPr;
                emp.Orders_Awaiting__c = Aw;
                emp.Orders_Completed__c = Cmplt; 
    		}
        update empls;
    }

}