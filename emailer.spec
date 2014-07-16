<cfscript>
spec = {
	class="emailer",
	mockObjects:[],
	factory:function(){
		emailer = new emailer();

		//Override the sendMAil function so that e-mails don't actually get sent. This allows us to test the function signatures
		//but not actually sending the e-mails
		/*emailer.overrideSend = function(){
			this.object.sendMail = function(){
				//Do nothing
			}
		}
		emailer.overrideSend();*/

		return emailer;
	},
	tests:{
		
	}
}
</cfscript>