package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LxBuserRelate generated by hbm2java
 */
@Entity
@Table(name="lx_buser_relate"
    ,catalog="lexiao"
)
public class LxBuserRelate  implements java.io.Serializable {


     private Integer id;
     private Integer sysUserId;
     private Integer uid;
     private String identity;
     private Integer ctime;

    public LxBuserRelate() {
    }

    public LxBuserRelate(Integer sysUserId, Integer uid, String identity, Integer ctime) {
       this.sysUserId = sysUserId;
       this.uid = uid;
       this.identity = identity;
       this.ctime = ctime;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    
    @Column(name="sys_user_id")
    public Integer getSysUserId() {
        return this.sysUserId;
    }
    
    public void setSysUserId(Integer sysUserId) {
        this.sysUserId = sysUserId;
    }

    
    @Column(name="uid")
    public Integer getUid() {
        return this.uid;
    }
    
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    
    @Column(name="identity", length=10)
    public String getIdentity() {
        return this.identity;
    }
    
    public void setIdentity(String identity) {
        this.identity = identity;
    }

    
    @Column(name="ctime")
    public Integer getCtime() {
        return this.ctime;
    }
    
    public void setCtime(Integer ctime) {
        this.ctime = ctime;
    }




}

