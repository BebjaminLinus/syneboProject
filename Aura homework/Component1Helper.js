({
	helperMethod : function(component, event, helper) {
        component.set("v.mycolumns", [
            {label: 'Client Name', fieldName: 'linkName', type: 'url', typeAttributes: { label: { fieldName: 'Name' }, target: '_blank'}},
                {label: 'Birth Date', fieldName: 'Birth_Date__c', type: 'date'},
                {label: 'Phone Number', fieldName: 'Phone_Number__c', type: 'number'},
                {label: 'Email Address', fieldName: 'Email_Address__c', type: 'email'}
            ]);
        var name = component.get("v.clientname");
        var action = component.get("c.getCLients");
        action.setParams({
            "Name":name
        });        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var records = response.getReturnValue();
                records.forEach(function(record){
                    record.linkName = '/'+record.Id;
                });
                component.set("v.clients", records);
            }
            else {
                console.log("Failed with state: " + state);
            }
        });       
        $A.enqueueAction(action);		
	}
})