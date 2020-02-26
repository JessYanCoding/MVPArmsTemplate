<manifest xmlns:android="http://schemas.android.com/apk/res/android"
	package="${packageName}">

    <application>
        <#if isNewModule>
	    <activity android:name="${ativityPackageName}.${activityClass}">
	        <intent-filter>
	            <action android:name="android.intent.action.MAIN" />
	            <category android:name="android.intent.category.LAUNCHER" />
	        </intent-filter>
	    </activity>
	<#else>
	    <activity android:name="${ativityPackageName}.${activityClass}"/>
	</#if>  
    </application>
</manifest>
