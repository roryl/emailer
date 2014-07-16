<cfimport path="utilities.queryString.queryString">
<cfimport path="utilities.properCase">
<cfcomponent accessors="true">
	<cfproperty name="from">
	<cfproperty name="to">
	<cfproperty name="server">
	<cfproperty name="useTLS">
	<cfproperty name="password">
	<cfproperty name="port">
	<cfproperty name="submit">
	<cfproperty name="template">
	<cfproperty name="data">
	<cfproperty name="username">
	
	<cffunction name="init" returnType="emailerProxy">
		<cfscript>
			//Include the basic SMTP server settings
			include template="settings";
			var proxy = new emailerProxy(this);
		</cfscript>
		<cfreturn proxy>
	</cffunction>
	
	<cffunction name="setData">
		<cfargument name="data" required="true" type="struct">
		<cfset structAppend(variables.data,arguments.data,true)>
	</cffunction>
	
	<cffunction name="sendMail" access="public">
		<cfinclude template="templates/#variables.template#.cfm">
		<cfmail from="#variables.from#"
							to="#variables.to#"
							usetls="#variables.usetls#"
							username="#variables.username#"
							password="#variables.password#"
							server="#variables.server#"
							port="#variables.port#"
							subject="#variables.subject#">
							<cfmailpart type="text/plain">#variables.plaincontent#</cfmailpart>
							<cfmailpart type="text/html">#variables.htmlcontent#</cfmailpart>
							</cfmail>
	</cffunction>
	
	<cffunction name="send">
		<!--- The mailer will call the function with the name of the template. In this way custom code can be written if setup needs to happen
		before the template is called --->
		<cfinvoke method="#variables.template#" component="#this#" returnVariable="result">		
	</cffunction>

</cfcomponent>