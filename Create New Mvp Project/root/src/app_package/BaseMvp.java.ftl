package ${packageName};

import ${packageName}.model.BaseModel;
import ${packageName}.presenter.BasePresenter;
import ${packageName}.view.BaseView;

public interface BaseMvp<M extends BaseModel, V extends BaseView, P extends BasePresenter> {
    M createModel();

    V createView();

    P createPresenter();
}
