package ${packageName}.implement;

import io.reactivex.Observable;
import ${packageName}.bean.${componentName}Bean;
import ${packageName}.model.${componentName}Model;
import ${packageName}.retrofit.RetrofitFactory;
import ${packageName}.rxjava.BaseEntity;

/**
 * Created by ${USER} .
 * 在这里只负责处理或获取数据，不直接与View交互
 */
public class ${componentName}ModelImple implements ${componentName}Model {
	
    @Override
    public Observable<BaseEntity<${componentName}Bean>> login(String account, String psw) {
        return  RetrofitFactory.getInstance().login(account,psw);
    }

}
