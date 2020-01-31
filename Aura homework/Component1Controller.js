({
	doInit: function(component, event, helper) {        
        var name = component.get("v.clientname");
        var action = component.get("c.getCLients");
        action.setParams({
            "Name":name
        });        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.clients", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });       
        $A.enqueueAction(action);		
	}
})