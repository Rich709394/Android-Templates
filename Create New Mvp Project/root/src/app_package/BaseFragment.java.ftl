package ${packageName}.fragment;

import ${packageName}.R;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import butterknife.ButterKnife;
import ${packageName}.BaseMvp;
import ${packageName}.model.BaseModel;
import ${packageName}.presenter.BasePresenter;
import ${packageName}.view.BaseView;

public abstract class BaseMvpFragment<M extends BaseModel, V extends BaseView, P extends BasePresenter> extends Fragment implements BaseMvp<M, V, P> {


    protected P presenter;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return initRootView(inflater, container, savedInstanceState);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ButterKnife.bind(this, view);
        init();
    }

    abstract View initRootView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState);

    abstract void init();

    @SuppressWarnings("unchecked")
    @Override
    public void onAttach(Context context) {
        super.onAttach(context);

        presenter = createPresenter();
        if (presenter != null) {
            presenter.registerModel(createModel());
            presenter.registerView(createView());
        }
    }

    /**
     * @param activity
     * @param cls      无参跳转
     */
    public void openActivity(Activity activity, Class cls) {
        Intent intent = new Intent(activity, cls);
        activity.startActivity(intent);
    }

    /**
     * @param activity
     * @param cls
     * @param bundle   带参跳转
     */
    public void openActivity(Activity activity, Class cls, Bundle bundle) {
        Intent intent = new Intent(activity, cls);
        intent.putExtras(bundle);
        activity.startActivity(intent);
    }

    public void openForResultActivity(Activity activity, Class cls, Bundle bundle) {
        Intent intent = new Intent(activity, cls);
        intent.putExtras(bundle);
        startActivityForResult(intent, 100);
    }


    @Override
    public void onDetach() {
        super.onDetach();
        if (presenter != null) {
            presenter.destroy();
        }
    }
}
