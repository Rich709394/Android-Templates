package ${packageName}.fragment;
import android.os.Bundle;
import butterknife.BindView;
import butterknife.OnClick;
import ${packageName}.adapter.${componentName}Adapter;
import ${packageName}.R;
import android.support.annotation.NonNull;
import ${packageName}.implement.${componentName}ModelImple;
import ${packageName}.model.${componentName}Model;
import ${packageName}.presenter.${componentName}Presenter;
import ${packageName}.view.${componentName}View;
import android.support.v7.widget.RecyclerView;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class ${componentName}Fragment extends BaseMvpFragment<${componentName}Model,${componentName}View,${componentName}Presenter> implements ${componentName}Adapter.${componentName}AdapterInterface,${componentName}View{


	@BindView(R.id.recyclerView)
	RecyclerView recyclerView;
	
	${componentName}Adapter ${lowerInputClass}Adapter;
	
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    private String mParam1;
    private String mParam2;


    public ${componentName}Fragment() {
        // Required empty public constructor
    }

   
    public static ${componentName}Fragment newInstance(String param1, String param2) {
        ${componentName}Fragment fragment = new ${componentName}Fragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }
    }

   
	
	
	 @Override
    View initRootView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_${lowerInputClass}, container, false);
    }

    @Override
    void init() {

    }

	
    /**
     * 释放内存
     */
    @Override
    public void onDetach() {
        super.onDetach();
    }

    @Override
    @NonNull
    public ${componentName}Model createModel() {
        return new ${componentName}ModelImple();
    }

    @Override
    @NonNull
    public ${componentName}View createView() {
        return this;
    }

    @Override
    @NonNull
    public ${componentName}Presenter createPresenter() {
        return new ${componentName}Presenter();
    }

    
	@Override
    public void clickItem() {
        
    }

    @Override
    public void setData() {

    }

    @Override
    public void back() {

    }
}