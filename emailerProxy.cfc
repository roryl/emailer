<!--- 
Author: Rory Laitila
Purpose: A proxy wrapper so that both the template and the send function are called --->
<cfcomponent>
	<cffunction name="init">
		<cfargument name="object" hint="The object that this will be a proxy to">
		<cfset this.object = arguments.object>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="onMissingMethod">
		<cfargument name="missingMethodName">
		<cfargument name="missingMethodArguments">
		<cfinvoke component="#this.object#" method="#arguments.missingMethodName#" returnvariable="variables.result" argumentcollection="#arguments.missingMethodArguments#">
		<cfset this.object.sendMail()>
		
	</cffunction>
</cfcomponent>