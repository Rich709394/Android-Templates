package ${packageName}.activity;

import android.os.Bundle;
import android.widget.EditText;
import butterknife.BindView;
import butterknife.OnClick;
import ${packageName}.R;
import ${packageName}.bean.${componentName}Bean;
import ${packageName}.implement.${componentName}ModelImple;
import ${packageName}.model.${componentName}Model;
import ${packageName}.presenter.${componentName}Presenter;
import ${packageName}.utils.MyUtils;
import ${packageName}.view.${componentName}View;

/**
 *Created by ${USER} 
 */
public class ${componentName}Activity extends BaseMvpActivity<${componentName}Model, ${componentName}View, ${componentName}Presenter> implements ${componentName}View {


    @BindView(R.id.edt_account)
    EditText edtAccount;
    @BindView(R.id.edt_psw)
    EditText edtPsw;


    @Override
    protected void initContentView(Bundle savedInstanceState) {
        setContentView(R.layout.${layoutName});
    }

    @Override
    public void init() {

    }


    @Override
    public ${componentName}Model createModel() {
        return new ${componentName}ModelImple();
    }

    @Override
    public ${componentName}View createView() {
        return this;
    }

    @Override
    public ${componentName}Presenter createPresenter() {
        return new ${componentName}Presenter();
    }


    @Override
    public String getAccount() {
        return edtAccount.getText().toString();
    }

    @Override
    public String getPassword() {
        return edtPsw.getText().toString();
    }

    @OnClick(R.id.btn_login)
    public void clickLoginBtn() {
        presenter.login(this);
    }

    @Override
    public void loginSuccess(${componentName}Bean t) {
        MyUtils.showToast(this, "登录成功!"+"token:"+t.getToken());
    }

    @Override
    public void loginFail(String msg) {
        MyUtils.showToast(this, msg);
    }


}
