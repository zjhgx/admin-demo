package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LxUserCouponTakeLog generated by hbm2java
 */
@Entity
@Table(name="lx_user_coupon_take_log"
    ,catalog="lexiao"
)
public class LxUserCouponTakeLog  implements java.io.Serializable {


     private Integer id;
     private Integer uid;
     private Integer conpouId;
     private Integer platId;
     private Integer MId;
     private Integer ctime;

    public LxUserCouponTakeLog() {
    }

    public LxUserCouponTakeLog(Integer uid, Integer conpouId, Integer platId, Integer MId, Integer ctime) {
       this.uid = uid;
       this.conpouId = conpouId;
       this.platId = platId;
       this.MId = MId;
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

    
    @Column(name="uid")
    public Integer getUid() {
        return this.uid;
    }
    
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    
    @Column(name="conpou_id")
    public Integer getConpouId() {
        return this.conpouId;
    }
    
    public void setConpouId(Integer conpouId) {
        this.conpouId = conpouId;
    }

    
    @Column(name="plat_id")
    public Integer getPlatId() {
        return this.platId;
    }
    
    public void setPlatId(Integer platId) {
        this.platId = platId;
    }

    
    @Column(name="m_id")
    public Integer getMId() {
        return this.MId;
    }
    
    public void setMId(Integer MId) {
        this.MId = MId;
    }

    
    @Column(name="ctime")
    public Integer getCtime() {
        return this.ctime;
    }
    
    public void setCtime(Integer ctime) {
        this.ctime = ctime;
    }




}

