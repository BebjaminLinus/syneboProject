public class BatchService {
    
    public void CountOrders(List<Employee__c> empls){
         
        Map<String, Integer> statusesAmount = new Map<String, Integer>();
        statusesAmount.put('Awaiting', 0);
        statusesAmount.put('In the process', 0);
        statusesAmount.put('Completed', 0);
        
         Map<ID, Map<String,Integer>> emplsStatuses = new Map<ID, Map<String,Integer>>();
        
        for(Employee__c empl : empls){
            emplsStatuses.put(empl.ID,statusesAmount.clone());        
        }
        
        List<Order__c> orders = [Select Employees__c, Status__c From Order__c Where Employees__c IN :emplsStatuses.keySet()];
        
        System.debug('Amount of orders' + orders.size());
        
        for(Order__c order: orders){
            Map<String, Integer> ordersAmnt = emplsStatuses.get(order.Employees__c);
            integer amount = 0;
            amount = ordersAmnt.get(order.Status__c);
            amount++;
            ordersAmnt.put(order.Status__c, amount);
            //emplsStatuses.put(order.Employees__c, ordersAmnt);           
        }
        system.debug(statusesAmount);
        
        for(Employee__c emp : empls){            
            
            Map<String, Integer> ordersAmnt = emplsStatuses.get(emp.Id);
            System.debug(ordersAmnt);
            
            emp.Orders_In_the_process__c = ordersAmnt.get('In the process');
            System.debug('Smotret suda' + emp.Orders_In_the_process__c);
            emp.Orders_Awaiting__c = ordersAmnt.get('Awaiting');
            emp.Orders_Completed__c = ordersAmnt.get('Completed'); 
    	}
        update empls;
    }


}