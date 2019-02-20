<?xml version="1.0"?>
<recipe>
   
	
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
	<!--创建Adapter -->
	<instantiate from="root/src/app_package/Adapter.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/adapter/${componentName}Adapter.java" />
	<!--创建Adapter 布局文件 -->		 
    <instantiate from="root/res/layout/adapter_item.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${lowerInputClass}_adapter_item.xml" />
	<!--创建Adapter实体类 -->
	<instantiate from="root/src/app_package/Bean.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/bean/${componentName}Bean.java" />
			   
	
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
                   to="${escapeXmlAttribute(resOut)}/layout/fragment_${lowerInputClass}.xml" />
	<!-- 打开新建activity-->			 
    <open file="${escapeXmlAttribute(srcOut)}/${componentName}Fragment.java" />	   
	   
    </#if>
	
	
				   
	
	
</recipe>
