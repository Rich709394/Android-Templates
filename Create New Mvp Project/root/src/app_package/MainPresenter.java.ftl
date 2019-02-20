package ${packageName}.presenter;

import com.trello.rxlifecycle2.LifecycleProvider;
import com.trello.rxlifecycle2.android.ActivityEvent;
import io.reactivex.Observable;
import io.reactivex.disposables.Disposable;
import ${packageName}.bean.${componentName}Bean;
import ${packageName}.model.${componentName}Model;
import ${packageName}.rxjava.BaseEntity;
import ${packageName}.rxjava.BaseObserver;
import ${packageName}.rxjava.RxSchedulers;
import ${packageName}.view.${componentName}View;

/**
 * Created by ${USER} 
 * model需要通过presenter才可以跟View交互
 * presenter：从model获取数据然后通知View,或者从view中获取数据传递给model
 */
public class ${componentName}Presenter extends BasePresenter<${componentName}Model,${componentName}View> {

    //用于取消请求
    private Disposable loginDisposable;

    /**
     * 示范:在presenter中从view获取参数传递给model,presenter从model获取数据通知view
     * 单一职责、结构清晰互不干扰，达到了很大程度的解耦
	 *LifecycleProvider<ActivityEvent> rxLifecycle 自动管理RxJava线程的生命周期，自动销毁
     */
    public void login(LifecycleProvider<ActivityEvent> rxLifecycle) {
        Observable<BaseEntity<${componentName}Bean>> observable = model.login(getView().getAccount(), getView().getPassword());
        //注意:如果RxLoginBean为对象定义new BaseObserver<RxLoginBean>()，如果为数组则需要定义new BaseArrayObserver<RxLoginBean>()
        observable.compose(RxSchedulers.compose()).compose(RxSchedulers.lifecycle(rxLifecycle)).subscribe(new BaseObserver<${componentName}Bean>() {
                    @Override
                    public void onSubscribe(Disposable d) {
                        super.onSubscribe(d);
                        loginDisposable = d;
                    }

                    @Override
                    public void onSuccess(${componentName}Bean bean) {
                        getView().loginSuccess(bean);
                    }

                    @Override
                    public void onFail(int code, String msg) {
                        getView().loginFail(msg);
                    }

                    @Override
                    public void onError(String msg) {
                        getView().loginFail(msg);
                    }
                });
    }

    @Override
    protected void onViewDestroy() {
        //销毁Activity时的操作，取消所有请求,回收清空所有资源
        if (loginDisposable != null) {
            loginDisposable.dispose();
            loginDisposable=null;
        }
    }
}
