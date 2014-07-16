<!--- Subject --->
<cfset variables.subject = "Thank you for joining #variables.data.domain#">

<!--- HTML Content --->
<cfsavecontent variable="variables.htmlcontent">
<cfoutput>
Hello,

Regards,
The #variables.data.domain# team.
</cfoutput>
</cfsavecontent>

<!--- Plain Content ---->
<cfset variables.plaincontent = new affiliates.core.utilities.stripHTML(variables.htmlcontent)>