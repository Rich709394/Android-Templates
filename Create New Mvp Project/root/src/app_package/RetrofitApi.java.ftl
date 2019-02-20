package ${packageName}.retrofit;

import io.reactivex.Observable;
import ${packageName}.bean.${componentName}Bean;
import ${packageName}.rxjava.BaseEntity;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.POST;

/**
 * Created by ${USER} 
 */
public interface RetrofitApi {

    /**
     * 登录接口
     * restful接口设计规范数据格式 如果你家的返回数据不规范就自己写哈BaseEntity或者BaseArrayEntity的解析类
     * {"code":200,
     * "msg":"请求成功",
     * "data":{"id":"KepsSJwFWWannHU5KjPzXS","mobile":"18200389242","email":"531555525@qq.com","nickName":"牛索芙特","keys":{"secretKey":"TLMVz23g3-3KYBSlNkJQpaS-jmm5V7wnFecOkBzg","accessKey":"3xRI2Z840-J8_tX9c501vdjkTdz1HeWpj6ll-Rqw"}}}
     */
    //注意:返回的data如果是对面需要 Observable<BaseEntity<bean>>,如果是数据则需要Observable<BaseArrayEntity<bean>>
    @FormUrlEncoded
    @POST("login")
    Observable<BaseEntity<${componentName}Bean>> login(@Field("username") String username, @Field("password") String password);

}
