<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context="${packageName}.${activityClass}">

    <RelativeLayout
        android:id="@+id/rlt_account"
        android:layout_width="match_parent"
        android:layout_height="50dp"
        android:layout_marginTop="150dp">

        <TextView
            android:id="@+id/tv_account"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_centerVertical="true"
            android:layout_marginStart="30dp"
            android:text="账号" />

        <EditText
            android:id="@+id/edt_account"
            android:layout_width="300dp"
            android:layout_height="wrap_content"
            android:layout_centerVertical="true"
            android:layout_marginStart="15dp"
            android:maxLines="1"
            android:layout_toEndOf="@+id/tv_account"
            android:hint="请输入账号"
            android:text="18200389242" />
    </RelativeLayout>

    <RelativeLayout
        android:id="@+id/rlt_psw"
        android:layout_below="@+id/rlt_account"
        android:layout_width="match_parent"
        android:layout_height="50dp"
        android:layout_marginTop="10dp">

        <TextView
            android:id="@+id/tv_psw"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_centerVertical="true"
            android:layout_marginStart="30dp"
            android:layout_marginTop="10dp"
            android:text="密码" />

        <EditText
            android:id="@+id/edt_psw"
            android:layout_width="300dp"
            android:layout_height="wrap_content"
            android:layout_centerVertical="true"
            android:layout_marginStart="15dp"
            android:inputType="textPassword"
            android:maxLines="1"
            android:layout_toEndOf="@+id/tv_psw"
            android:hint="请输密码"
            android:text="666666" />
    </RelativeLayout>

    <Button
        android:id="@+id/btn_login"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_below="@+id/rlt_psw"
        android:layout_centerHorizontal="true"
        android:layout_marginTop="20dp"
        android:text="登录" />


</RelativeLayout>