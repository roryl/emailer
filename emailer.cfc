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
			//Set default mail settings
			if(NOT structKeyExists(application,"settings") OR NOT structKeyExists(application.settings,"mail"))
			{
				application.settings.mail = {};
				application.settings.mail.from = "";
				
				application.settings.mail.to = "";
				application.settings.mail.usetls = false; //Gmail uses TLS
				application.settings.mail.server = "";
				application.settings.mail.username = "";
				application.settings.mail.password = "";
				application.settings.mail.port = "";
			}


			variables.server = application.settings.mail.server;
			variables.useTLS = application.settings.mail.usetls;
			variables.username = application.settings.mail.username;
			variables.password = application.settings.mail.password;
			variables.port = application.settings.mail.port;
			variables.data = {};
			variables.data.domain = cgi.server_name;
			variables.from = "contact@" & variables.data.domain;
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