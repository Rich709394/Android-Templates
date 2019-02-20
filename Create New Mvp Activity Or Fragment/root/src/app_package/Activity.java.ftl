package ${packageName}.activity;
import android.os.Bundle;
import ${packageName}.R;
import ${packageName}.implement.${componentName}ModelImple;
import ${packageName}.model.${componentName}Model;
import ${packageName}.presenter.${componentName}Presenter;
import ${packageName}.view.${componentName}View;

/**
 *Created by ${USER} 
 */
public class ${activityClass} extends BaseMvpActivity<${componentName}Model,${componentName}View,${componentName}Presenter> implements ${componentName}View {

   
	 @Override
    protected void initContentView(Bundle savedInstanceState) {
        setContentView(R.layout.${layoutName});
    }

    @Override
    public void init() {
		presenter.getData();
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
    public void setData() {

    }

    @Override
    public void back() {
        finish();
    }
}