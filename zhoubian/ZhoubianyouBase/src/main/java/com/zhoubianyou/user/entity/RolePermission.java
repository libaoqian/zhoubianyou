package com.zhoubianyou.user.entity;

import java.util.Date;

public class RolePermission extends RolePermissionKey {
    private Integer state;

    private Date createTime;

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}