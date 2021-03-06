package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LxUserAuth generated by hbm2java
 */
@Entity
@Table(name="lx_user_auth"
    ,catalog="lexiao"
)
public class LxUserAuth  implements java.io.Serializable {


     private Integer id;
     private int uid;
     private int authId;
     private Integer ctime;
     private Integer mtime;

    public LxUserAuth() {
    }

	
    public LxUserAuth(int uid, int authId) {
        this.uid = uid;
        this.authId = authId;
    }
    public LxUserAuth(int uid, int authId, Integer ctime, Integer mtime) {
       this.uid = uid;
       this.authId = authId;
       this.ctime = ctime;
       this.mtime = mtime;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    
    @Column(name="uid", nullable=false)
    public int getUid() {
        return this.uid;
    }
    
    public void setUid(int uid) {
        this.uid = uid;
    }

    
    @Column(name="auth_id", nullable=false)
    public int getAuthId() {
        return this.authId;
    }
    
    public void setAuthId(int authId) {
        this.authId = authId;
    }

    
    @Column(name="ctime")
    public Integer getCtime() {
        return this.ctime;
    }
    
    public void setCtime(Integer ctime) {
        this.ctime = ctime;
    }

    
    @Column(name="mtime")
    public Integer getMtime() {
        return this.mtime;
    }
    
    public void setMtime(Integer mtime) {
        this.mtime = mtime;
    }




}


