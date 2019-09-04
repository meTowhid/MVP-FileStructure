<?xml version="1.0"?>
<globals>
    <#include "root://activities/common/common_globals.xml.ftl" />
    <global id="resOut" value="${resDir}" />
    <global id="srcOut" value="${srcDir}/${slashedPackageName(packageName)}" />
    

    <#if (parentActivityClass?has_content)>
        <#assign className = parentActivityClass?substring(parentActivityClass?last_index_of(".")+1) />
        <#if (className?ends_with("Activity"))>
            <#assign className = className?substring(0, className?length-8) />
        </#if>
    <#else>
        <#assign className = rootName />
    </#if>
    <global id="fileName" value="${className?cap_first}" />
    <global id="variableName" value="${className?uncap_first}" />
    <global id="fullPackage" value="${packageName}.${className?uncap_first}" />
</globals>