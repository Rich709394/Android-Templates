<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
	 <#if contentType=='Activity'>
         tools:context="${packageName}.activity.${activityClass}"
    <#else>
	    tools:context="${packageName}.fragment.${componentName}Fragment"
    </#if>
   >
	
 <android.support.v7.widget.RecyclerView
        android:id="@+id/recyclerView"
        android:layout_width="match_parent"
        android:layout_height="match_parent" />
   
</RelativeLayout>
