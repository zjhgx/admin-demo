package com.cs.lexiao.admin.framework.result;

/**
 * Created by xierongli on 17/5/17.
 */
public class Result<T> {

    private boolean success;
    private String message;
    private T data;

    public Result() {
        this(true);
    }

    public Result(boolean success) {
        this.success = true;
        this.success = success;
    }

    public boolean isSuccess() {
        return this.success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return this.data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
