package ${packageName}.rxjava;

import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import ${packageName}.utils.MyUtils;

/**
 * Created by ${USER} 
 * 获取返回数据为一个对象的观察者
 */

public abstract class BaseObserver<T> implements Observer<BaseEntity<T>> {

    private int code;

    @Override
    public void onSubscribe(Disposable d) {
    }

    @Override
    public void onNext(BaseEntity<T> value) {
        if (value.isSuccess()) {
            T t = null;
            try {
                t = value.getData();
            } catch (Exception e) {
                e.printStackTrace();
            }
            onSuccess(t);
        } else {
            code = value.getCode();
            MyUtils.logInformation(value.getMsg());
            onFail(value.getCode(), value.getMsg());          
        }
    }

    @Override
    public void onError(Throwable e) {
        //根据你们的需求自行修改
        if (MyUtils.isTimeOut(e.toString())) {
            onError("链接超时~");
        } else if (MyUtils.isIllegalState(e.toString())) {
            onError("数据异常~");
        } else if (MyUtils.isNumberFormatException(e.toString())) {
            onError("数据解析出错~");
        } else {
            MyUtils.logInformation(code + e.toString());
            onError("网络异常~");
        }

    }

    @Override
    public void onComplete() {
    }


    public abstract void onSuccess(T t);

    public abstract void onFail(int code, String msg);

    public abstract void onError(String msg);
}
