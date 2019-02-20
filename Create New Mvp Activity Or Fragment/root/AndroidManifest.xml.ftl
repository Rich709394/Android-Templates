<#import "../../common/shared_manifest_macros.ftl" as manifestMacros>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="${packageName}">
    <uses-permission android:name="android.permission.INTERNET" />
    <application>
        <activity android:name=".activity.${activityClass}"
            <#if isNewProject>
            android:label="@string/app_name"
            </#if>
            android:configChanges="orientation|keyboardHidden|screenSize"
            android:theme="@style/AppTheme"
            <#if buildApi gte 16 && parentActivityClass != "">android:parentActivityName="${parentActivityClass}"</#if>>
            <#if parentActivityClass != "">
            <meta-data android:name="android.support.PARENT_ACTIVITY"
                android:value="${parentActivityClass}" />
            </#if>
            <@manifestMacros.commonActivityBody />
        </activity>
    </application>

</manifest>
