package ${packageName}.utils;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.IBinder;
import android.util.Log;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.Toast;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *  Created by ${USER} 
 */

public class MyUtils {

    //打印日志开关，生产环境要设置为false
    private static boolean isLog = true;

    /**
     * 打印方法
     *
     * @param msg 打印信息
     */
    public static void logInformation(String msg) {
        if (isLog) {
            if (msg == null) {
                msg = "空";
            }
            Log.d("Rich", msg);
        }
    }

    /**
     * @param msg 打印错误信息
     */
    public static void logErroInformation(String msg) {
        if (isLog) {
            if (msg == null) {
                msg = "空";
            }
            Log.e("Rich", msg);
        }
    }


    /**
     * 重写Toast
     */
    private static Toast toast;

    @SuppressLint("ShowToast")
    public static void showToast(Context context, String s) {
        if (toast == null) {
            toast = Toast.makeText(context, "", Toast.LENGTH_LONG);
        }
        toast.setText(s);
        toast.show();

    }

    /**
     * 记录当前activity
     * 用于一次清空多个activity
     */
    private static List<Activity> activityList = new ArrayList<>();

    public static void addActivity(Activity activity) {
        activityList.add(activity);
    }

    /**
     * 清除列表中的Activity
     */
    public static void clearActivity() {
        for (Activity a : activityList) {
            if (a != null) {
                a.finish();
            }
        }
        activityList.clear();
    }


    /**
     * 隐藏当前小键盘
     */
    public static void hideInput(Activity activity) {
        if (activity.getCurrentFocus() != null) {
            InputMethodManager inputMethodManager = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
            IBinder iBinder = activity.getCurrentFocus().getWindowToken();
            inputMethodManager.hideSoftInputFromWindow(iBinder, InputMethodManager.HIDE_NOT_ALWAYS);
            inputMethodManager.hideSoftInputFromWindow(iBinder, 0);
        }
    }

    /**
     * EditText获取焦点并显示软键盘
     */
    public static void showSoftInputFromWindow(Activity activity, EditText editText) {
        editText.setFocusable(true);
        editText.setFocusableInTouchMode(true);
        editText.requestFocus();
        InputMethodManager imm = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
        imm.showSoftInput(editText, 0);
    }

    /**
     * 判断网络是否可用
     */
    public static boolean isNetworkAvailable(Context context) {
        ConnectivityManager cm = (ConnectivityManager) context.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = cm.getActiveNetworkInfo();
        return networkInfo != null && networkInfo.isAvailable();
    }

    /**
     * @param
     * @param Exception 判断是否连接超时
     */
    public static boolean isTimeOut(String Exception) {
        return Exception.contains("SocketTimeoutException");
    }

    /**
     * @param
     * @param Exception 判断是转换类型出错
     */
    public static boolean isIllegalState(String Exception) {
        return Exception.contains("IllegalStateException");
    }

    public static boolean isNumberFormatException(String Exception) {
        return Exception.contains("NumberFormatException");
    }


    /**
     * 手机号验证
     *
     * @param phone
     * @return 验证通过返回true
     */
    public static boolean isMobile(String phone) {
        try {
            MyUtils.logInformation("验证手机号");
            if (phone != null && phone.length() == 11) {
                Pattern p;
                Matcher m;
                boolean b;
                p = Pattern.compile("^[1][3,4,5,6,7,8,9][0-9]{9}$"); // 验证手机号
                m = p.matcher(phone);
                b = m.matches();
                return b;
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 电话号码验证
     *
     * @param str
     * @return 验证通过返回true
     */
    public static boolean isPhone(String str) {
        if (str != null && str.length() > 6) {
            Pattern p1, p2;
            Matcher m;
            boolean b;
            p1 = Pattern.compile("^[0][1-9]{2,3}-[0-9]{5,10}$");  // 验证带区号的
            p2 = Pattern.compile("^[1-9]{1}[0-9]{5,8}$");         // 验证没有区号的
            if (str.length() > 9) {
                m = p1.matcher(str);
                b = m.matches();
            } else {
                m = p2.matcher(str);
                b = m.matches();
            }
            return b;
        } else {
            return false;
        }

    }

    /**
     * 验证邮箱
     */

    public static boolean isEmail(String email) {
        if (email.contains("@")) {
            try {
                MyUtils.logInformation("验证邮箱");
                Pattern p;
                Matcher m;
                boolean b;
                p = Pattern.compile("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$");
                m = p.matcher(email);
                b = m.matches();
                return b;
            } catch (Exception e) {
                return false;
            }
        } else {
            return false;
        }
    }


    /**
     * 获取版本号
     *
     * @param context 上下文
     * @return 版本号
     */
    public static int getVersionCode(Context context) {
        //获取包管理器
        PackageManager pm = context.getPackageManager();
        //获取包信息
        try {
            PackageInfo packageInfo = pm.getPackageInfo(context.getPackageName(), 0);
            //返回版本号
            return packageInfo.versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        return 1;
    }


}
