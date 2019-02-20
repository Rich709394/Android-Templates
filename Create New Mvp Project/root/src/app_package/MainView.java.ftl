package ${packageName}.view;

import ${packageName}.bean.${componentName}Bean;

/**
 *Created by ${USER} 
 * 在这里定义布局上需要实现的工作
 * 如获取数据、显示数据等等
 */
public interface ${componentName}View extends BaseView {

    /**
     * 获取账号
     */
    String getAccount();

    /**
     * 获取密码
     */
    String getPassword();

    /**
     * 点击登陆按钮
     */
    void clickLoginBtn();

    /**
     * 登录成功
     */
    void loginSuccess(${componentName}Bean t);

    /**
     * 登录失败
     */
    void loginFail(String msg);
}
