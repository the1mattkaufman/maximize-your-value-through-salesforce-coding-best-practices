({
	doInit : function(component, event, helper) {
        console.info('v8:00pm');
        var action1 = component.get("c.getFirstName");
        action1.setCallback(this, function(response) {
            var state = response.getState();
            console.info('Query1 just returned');
        	component.set("v.firstName",response.getReturnValue());
        });
        $A.enqueueAction(action1);

        var action2 = component.get("c.getLastName");
        action2.setCallback(this, function(response) {
            var state = response.getState();
            console.info('Query2 just returned');
        	component.set("v.lastName",response.getReturnValue());
        });
        $A.enqueueAction(action2);

        var action3 = component.get("c.getEmail");
        action3.setCallback(this, function(response) {
            var state = response.getState();
            console.info('Query3 just returned');
        	component.set("v.email",response.getReturnValue());
        });
        $A.enqueueAction(action3);
    }
})