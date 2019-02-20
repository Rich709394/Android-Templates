package ${packageName}.presenter;
import ${packageName}.model.${componentName}Model;
import ${packageName}.view.${componentName}View;
public class ${componentName}Presenter extends BasePresenter<${componentName}Model,${componentName}View>{

    @Override
    protected void onViewDestroy() {     
        if (model != null) {
            model.stopRequest();
        }
    }
	
}