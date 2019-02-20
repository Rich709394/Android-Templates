package ${packageName}.activity;
import android.os.Bundle;
import ${packageName}.adapter.${componentName}Adapter;
import android.support.v7.widget.RecyclerView;
import butterknife.BindView;
import ${packageName}.implement.${componentName}ModelImple;
import ${packageName}.model.${componentName}Model;
import ${packageName}.presenter.${componentName}Presenter;
import ${packageName}.view.${componentName}View;
import ${packageName}.R;

public class ${activityClass} extends BaseMvpActivity<${componentName}Model,${componentName}View,${componentName}Presenter> implements ${componentName}Adapter.${componentName}AdapterInterface,${componentName}View{


	@BindView(R.id.recyclerView)
	RecyclerView recyclerView;
	
	${componentName}Adapter ${lowerInputClass}Adapter;
	

	@Override
    protected void initContentView(Bundle savedInstanceState) {
        setContentView(R.layout.${layoutName});
    }

    @Override
    public void init() {

    }
	 @Override
    public void clickItem() {

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