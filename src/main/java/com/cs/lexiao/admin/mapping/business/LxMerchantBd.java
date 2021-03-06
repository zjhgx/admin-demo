package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LxMerchantBd generated by hbm2java
 */
@Entity
@Table(name="lx_merchant_bd"
    ,catalog="lexiao"
)
public class LxMerchantBd  implements java.io.Serializable {


     private Integer id;
     private int uid;
     private int mid;
     private Integer ctime;
     private Integer mtime;

    public LxMerchantBd() {
    }

	
    public LxMerchantBd(int uid, int mid) {
        this.uid = uid;
        this.mid = mid;
    }
    public LxMerchantBd(int uid, int mid, Integer ctime, Integer mtime) {
       this.uid = uid;
       this.mid = mid;
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

    
    @Column(name="mid", nullable=false)
    public int getMid() {
        return this.mid;
    }
    
    public void setMid(int mid) {
        this.mid = mid;
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


