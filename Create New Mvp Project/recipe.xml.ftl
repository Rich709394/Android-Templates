<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
    <!--合并AndroidManifest文件-->	
	<merge from="root/AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />		 
	<merge from="root/build.gradle.ftl"
             to="${escapeXmlAttribute(projectOut)}/build.gradle" />		
	<merge from="root/a.ftl"
             to="${escapeXmlAttribute(projectOut)}/build.gradle" />			 
	<merge from="root/b.ftl"
             to="${escapeXmlAttribute(projectOut)}/build.gradle" />		
	<!--合并string文件-->		
    <merge from="root/res/values/strings.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
	<copy from="root/res/anim" to="${escapeXmlAttribute(resOut)}/anim" />
	<!--创建Model基类-->
	<instantiate from="root/src/app_package/BaseModel.java.ftl" to="${escapeXmlAttribute(srcOut)}/model/BaseModel.java" />				   
	<!--创建Model -->
	<instantiate from="root/src/app_package/MainModel.java.ftl" to="${escapeXmlAttribute(srcOut)}/model/${componentName}Model.java" />
	<!--创建Model实现类 -->
    <instantiate from="root/src/app_package/MainModelImple.java.ftl" to="${escapeXmlAttribute(srcOut)}/implement/${componentName}ModelImple.java" />
	<!--创建View基类 -->
	<instantiate from="root/src/app_package/BaseView.java.ftl" to="${escapeXmlAttribute(srcOut)}/view/BaseView.java" />
	<!--创建View -->
	<instantiate from="root/src/app_package/MainView.java.ftl" to="${escapeXmlAttribute(srcOut)}/view/${componentName}View.java" />
	<!--创建Presenter基类 -->
	<instantiate from="root/src/app_package/BasePresenter.java.ftl" to="${escapeXmlAttribute(srcOut)}/presenter/BasePresenter.java" />
	<!--创建Presenter -->
	<instantiate from="root/src/app_package/MainPresenter.java.ftl" to="${escapeXmlAttribute(srcOut)}/presenter/${componentName}Presenter.java" />
	<!--创建Bean -->
	<instantiate from="root/src/app_package/Bean.java.ftl" to="${escapeXmlAttribute(srcOut)}/bean/${componentName}Bean.java" />
	<!--创建ModelImple -->
	<instantiate from="root/src/app_package/MainModelImple.java.ftl" to="${escapeXmlAttribute(srcOut)}/implement/${componentName}ModelImple.java" />			 
	<!--创建Retrofit -->
	<instantiate from="root/src/app_package/RetrofitApi.java.ftl" to="${escapeXmlAttribute(srcOut)}/retrofit/RetrofitApi.java" /> 
	<!--创建RetrofitFactory -->
	<instantiate from="root/src/app_package/RetrofitFactory.java.ftl" to="${escapeXmlAttribute(srcOut)}/retrofit/RetrofitFactory.java" /> 		 
	<!--创建Rxjava -->
	<instantiate from="root/src/app_package/BaseArrayEntity.java.ftl" to="${escapeXmlAttribute(srcOut)}/rxjava/BaseArrayEntity.java" /> 			 
	<instantiate from="root/src/app_package/BaseArrayObserver.java.ftl" to="${escapeXmlAttribute(srcOut)}/rxjava/BaseArrayObserver.java" /> 					 
	<instantiate from="root/src/app_package/BaseEntity.java.ftl"  to="${escapeXmlAttribute(srcOut)}/rxjava/BaseEntity.java" /> 	
	<instantiate from="root/src/app_package/BaseObserver.java.ftl" to="${escapeXmlAttribute(srcOut)}/rxjava/BaseObserver.java" /> 			 
	<instantiate from="root/src/app_package/MyObserver.java.ftl"  to="${escapeXmlAttribute(srcOut)}/rxjava/MyObserver.java" />
	<instantiate from="root/src/app_package/RxSchedulers.java.ftl" to="${escapeXmlAttribute(srcOut)}/rxjava/RxSchedulers.java" />		
	<!--创建Utils -->
	<instantiate from="root/src/app_package/MyUtils.java.ftl" to="${escapeXmlAttribute(srcOut)}/utils/MyUtils.java" /> 		
    <!--创建BaseMvp -->
	<instantiate from="root/src/app_package/BaseMvp.java.ftl"  to="${escapeXmlAttribute(srcOut)}/BaseMvp.java" /> 		 
	<!--创建Activity基类--> 
    <instantiate from="root/src/app_package/BaseActivity.java.ftl" to="${escapeXmlAttribute(srcOut)}/activity/BaseMvpActivity.java" />	
    <!--创建Fragment基类--> 
    <instantiate from="root/src/app_package/BaseFragment.java.ftl" to="${escapeXmlAttribute(srcOut)}/fragment/BaseMvpFragment.java" />	
    <!--创建Activity --> 
    <instantiate from="root/src/app_package/MainActivity.java.ftl" to="${escapeXmlAttribute(srcOut)}/activity/${componentName}Activity.java" />		 
	<!--创建Activity 布局文件 -->		 
    <instantiate from="root/res/layout/activity_main.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	<!-- 打开新建activity-->			 
    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />	   
    
</recipe>
