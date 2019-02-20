package ${packageName}.rxjava;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ${USER} 
 * 按restful设计规范定义的列表数据解析
 * 返回数据结构如下：
 * {
 *     code:200
 *     msg:"请求成功!"
 *     data：[T,T] T为传入的实体类
 * }
 * 可以根据实际情况修改
 */

public class BaseArrayEntity<T> implements Serializable {
    private int code;
    private String msg;
    private List<T> data;

    public boolean isSuccess() {
        return code == 200;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

}
