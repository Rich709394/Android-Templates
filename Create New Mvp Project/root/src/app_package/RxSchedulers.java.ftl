package ${packageName}.rxjava;

import com.trello.rxlifecycle2.LifecycleProvider;
import com.trello.rxlifecycle2.LifecycleTransformer;
import com.trello.rxlifecycle2.android.ActivityEvent;
import io.reactivex.ObservableTransformer;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.schedulers.Schedulers;

/**
 * Created by ${USER} 
 * 线程调度器
 */

public class RxSchedulers {

    /**
     * @param rxLifecycle
     * @param <T>Rxjava生命周期
     * @return
     */
    public static <T> LifecycleTransformer<T> lifecycle(LifecycleProvider<ActivityEvent> rxLifecycle) {
        return rxLifecycle.bindUntilEvent(ActivityEvent.DESTROY);
    }

    /**
     * @param <T>
     * @return 在子线程处理事务，在主线程处理观察事件
     */
    public static <T> ObservableTransformer<T, T> compose() {
        return observable -> observable
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    /**
     * @param <T>
     * @return 异步
     */
    public static <T> ObservableTransformer<T, T> composeIo() {
        return observable -> observable
                .subscribeOn(Schedulers.io())
                .observeOn(Schedulers.io());
    }
}
