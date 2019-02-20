package ${packageName}.rxjava;

import java.util.List;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import ${packageName}.utils.MyUtils;

/**
 * Created by ${USER} 
 * 获取返回数据为一个数组的观察者
 */

public abstract class BaseArrayObserver<T> implements Observer<BaseArrayEntity<T>> {


    @Override
    public void onSubscribe(Disposable d) {

    }

    @Override
    public void onNext(BaseArrayEntity<T> value) {
        if (value.isSuccess()) {
            onSuccess(value.getData());
        } else {
            onFail(value.getCode(), value.getMsg());
        }
    }

    @Override
    public void onError(Throwable e) {
        MyUtils.logInformation(e.toString());
        if (MyUtils.isTimeOut(e.toString())) {
            onError("链接超时~");
        } else if (MyUtils.isIllegalState(e.toString())) {
            onError("服务器异常~");
        } else {
            onError("网络异常~");
        }
    }

    @Override
    public void onComplete() {
    }

    public abstract void onSuccess(List<T> list);

    public abstract void onFail(int code, String msg);

    public abstract void onError(String msg);

}
