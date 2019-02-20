package ${packageName}.model;

import io.reactivex.Observable;
import ${packageName}.bean.${componentName}Bean;
import ${packageName}.rxjava.BaseEntity;

public interface ${componentName}Model extends BaseModel {
    /**
     * 登录
     */
    Observable<BaseEntity<${componentName}Bean>> login(String account, String psw);


}
