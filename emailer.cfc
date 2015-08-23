<cfimport path="utilities.queryString.queryString">
<cfimport path="utilities.properCase">
<cfimport path="utilities.stripHTML">
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
	
	<cffunction name="init" returnType="emailer">
		<cfargument name="server" required="true">
		<cfargument name="useTLS" default="true">
		<cfargument name="password" required="true">
		<cfargument name="port" default="25">
		<cfargument name="username" required="true">
		<cfargument name="templateLocation" default="templates" hint="mapping to the directory containing the templates">
		<cfscript>
			
			variables.server = arguments.server;
			variables.useTLS = arguments.useTLS;
			variables.password = arguments.password;
			variables.port = arguments.port;
			variables.username = arguments.username;			
			variables.templateLocation = arguments.templateLocation;
			variables.data = {};
			//var proxy = new emailerProxy(this);
		</cfscript>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="setData">
		<cfargument name="data" required="true" type="struct">
		<cfset structAppend(variables.data,arguments.data,true)>
	</cffunction>

	<cffunction name="stripHTML">
		<cfargument name="html">
		<cfreturn new stripHTML(arguments.html)>
	</cffunction>
	
	<cffunction name="sendMail" access="public">
		<cfargument name="from">
		<cfargument name="to">		
		<cfargument name="template">
		<cfargument name="subject">
		<cfargument name="data" default={}>

		<cfscript>
			structAppend(variables.data,arguments.data,true);
		</cfscript>

		<cfinclude template="#variables.templateLocation#/#arguments.template#.cfm">		

		<cfmail from="#arguments.from#"
							to="#arguments.to#"
							usetls="#variables.usetls#"
							username="#variables.username#"
							password="#variables.password#"
							server="#variables.server#"
							port="#variables.port#"
							subject="#arguments.subject#">
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