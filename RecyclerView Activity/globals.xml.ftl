<?xml version="1.0"?>
<globals>
    <#assign Collection=extractLetters(componentName)>
    <#assign collection_name=Collection?lower_case>
    <global id="hasNoActionBar" type="boolean" value="false" />
    <global id="parentActivityClass" value="" />
    <global id="simpleLayoutName" value="${layoutName}" />
    <global id="excludeMenu" type="boolean" value="true" />
    <global id="generateActivityTitle" type="boolean" value="false" />
	<global id="lowerInputClass" value="${Collection?lower_case}" />
    <#include "../common/common_globals.xml.ftl" />
</globals>
