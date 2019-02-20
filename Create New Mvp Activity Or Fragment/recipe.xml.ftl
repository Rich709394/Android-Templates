<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
   <@kt.addAllKotlinDependencies />
	<!--
			  <copy from="root/res/drawable"
            to="${escapeXmlAttribute(resOut)}/drawable" />
              <merge from="root/res/values/dimens.xml"
             to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />
             <merge from="root/res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
			 -->
	<!--创建Model -->
	<instantiate from="root/src/app_package/Model.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/model/${componentName}Model.java" />
	<!--创建Model实现类 -->
    <instantiate from="root/src/app_package/ModelImple.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/implement/${componentName}ModelImple.java" />
	<!--创建View -->
	<instantiate from="root/src/app_package/View.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/view/${componentName}View.java" />
	<!--创建Presenter -->
	<instantiate from="root/src/app_package/Presenter.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/presenter/${componentName}Presenter.java" />
	
	
	 <#if contentType=='Activity'>
	 <merge from="root/AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
    <!--创建Activity --> 
    <instantiate from="root/src/app_package/Activity.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/activity/${activityClass}.java" />		 
	<!--创建Activity 布局文件 -->		 
    <instantiate from="root/res/layout/activity_layout.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	<!-- 打开新建activity-->			 
    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />	   
    <#else>
	
    <!--创建Fragment --> 
    <instantiate from="root/src/app_package/Fragment.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/fragment/${componentName}Fragment.java" />		 
	<!--创建Fragment 布局文件 -->		 
    <instantiate from="root/res/layout/activity_layout.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	<!-- 打开新建activity-->			 
    <open file="${escapeXmlAttribute(srcOut)}/${componentName}Fragment.java" />	   
	   
    </#if>
</recipe>
