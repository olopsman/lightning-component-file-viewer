({
	doInit : function (component, event, helper) {
		console.log(component.get("v.recordId"));

		var action = component.get("c.getFilesByRecordId");
        action.setParams({"recordId" : component.get("v.recordId")});
        action.setCallback(this, function(data) {
             console.log(data.getState());
         	  if (data.getState() === "SUCCESS") {
                  console.log(data.getReturnValue());
                  component.set("v.filesRecord", data.getReturnValue());
			  }
			  console.log(data.getError());
        });
		$A.enqueueAction(action);

	},	
	handleClick : function(component, event, helper) {
        console.log(event.getSource().get("v.name"));
		$A.get('e.lightning:openFiles').fire({
        	recordIds: [event.getSource().get("v.name")]
    	});


	}	

})