package ${packageName}.retrofit;

import java.util.concurrent.TimeUnit;

import ${packageName}.utils.MyUtils;
import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by ${USER}
 * 单例获取Retrofit实例
 * 域名必须以 /  结尾
 */


public class RetrofitFactory {

    private static final long TIMEOUT = 15;
    private static final boolean IS_ONLINE = true;//是否为生产环境,用于切换生产环境或测试环境
    //基本接口域名
    private static String baseUrl = IS_ONLINE ? "https://nei.netease.com/api/apimock/b32b0a2d76fc996b245467a070225794/dev/" : "测试环境地址";
    //是否打印请求数据
    private static boolean LOG_HTTP = true;

    /**
     * @return 日志拦截器
     */
    private static HttpLoggingInterceptor setLog() {
        HttpLoggingInterceptor loggingInterceptor = new HttpLoggingInterceptor((message) -> {
            //打印retrofit日志
            if (LOG_HTTP) {
                MyUtils.logInformation(message);
            }
        });
        if (LOG_HTTP) {
            //显示日志
            loggingInterceptor.setLevel(HttpLoggingInterceptor.Level.BODY);
        } else {
            loggingInterceptor.setLevel(HttpLoggingInterceptor.Level.NONE);
        }
        return loggingInterceptor;
    }

    //设置超时时间15秒
    private static OkHttpClient httpClient = new OkHttpClient.Builder()
            .addInterceptor(setLog())//添加拦截器打印网络请求日志
            .connectTimeout(TIMEOUT, TimeUnit.SECONDS)
            .readTimeout(TIMEOUT, TimeUnit.SECONDS)
            .build();

    //设置Retrofit实例
    private static RetrofitApi retrofitApi = new Retrofit.Builder()
            .addConverterFactory(GsonConverterFactory.create())
            .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
            .client(httpClient)
            .baseUrl(baseUrl)
            .build()
            .create(RetrofitApi.class);


    /**
     * @return 获取Retrofit请求实例
     */
    public static RetrofitApi getInstance() {
        return retrofitApi;
    }


}
