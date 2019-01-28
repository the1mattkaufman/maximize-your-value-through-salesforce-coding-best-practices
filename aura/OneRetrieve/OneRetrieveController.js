({
	doInit : function(component, event, helper) {
        console.info('v9:00am');
        var action1 = component.get("c.getMe");
        action1.setCallback(this, function(response) {
            var state = response.getState();
            var res = response.getReturnValue()
            console.info('Query1 just returned');
            console.info(res);
        	component.set("v.me",res);
        });
        $A.enqueueAction(action1);
    }
})