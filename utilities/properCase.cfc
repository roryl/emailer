<!--- http://cflib.org/udf/CapFirst--->
<cfcomponent>
 <cffunction name="init" returntype="string" output="false">
    <cfargument name="str" type="string" required="true" />
    
    <cfset var newstr = "" />
    <cfset var word = "" />
    <cfset var separator = "" />
    
    <cfloop index="word" list="#arguments.str#" delimiters=" ">
        <cfset newstr = newstr & separator & UCase(left(word,1)) />
        <cfif len(word) gt 1>
            <cfset newstr = newstr & lcase(right(word,len(word)-1))/>
        </cfif>
        <cfset separator = " " />
    </cfloop>

    <cfreturn newstr />
</cffunction>
</cfcomponent>