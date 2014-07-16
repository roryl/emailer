<!---
Author: Rory Laitila
Purpose: These settings will be included by emailer.cfc. They are abstracted out into this file
for simplicity
--->
<cfscript>
	variables.server = "";
	variables.useTLS = true;
	variables.username = "";
	variables.password ="";
	variables.port = "";
	variables.data = "";
	variables.data.domain = cgi.server_name;
	variables.from = "contact@" & variables.data.domain;
</cfscript>