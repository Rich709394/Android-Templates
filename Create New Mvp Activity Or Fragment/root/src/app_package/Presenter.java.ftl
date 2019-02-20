package ${packageName}.presenter;
import ${packageName}.model.${componentName}Model;
import ${packageName}.view.${componentName}View;

/**
 *Created by ${USER} 
 */
public class ${componentName}Presenter extends BasePresenter<${componentName}Model,${componentName}View>{

	/**
     * 获取数据
     */
    public void getData(){

    }
	
    @Override
    protected void onViewDestroy() {     
        if (model != null) {
            model.stopRequest();
        }
    }
}