package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LxPlatformShake generated by hbm2java
 */
@Entity
@Table(name="lx_platform_shake"
    ,catalog="lexiao"
)
public class LxPlatformShake  implements java.io.Serializable {


     private Integer id;
     private Integer platId;
     private BigDecimal perShakeCost;
     private BigDecimal shakeRate;
     private Integer ctime;
     private Integer mtime;

    public LxPlatformShake() {
    }

    public LxPlatformShake(Integer platId, BigDecimal perShakeCost, BigDecimal shakeRate, Integer ctime, Integer mtime) {
       this.platId = platId;
       this.perShakeCost = perShakeCost;
       this.shakeRate = shakeRate;
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

    
    @Column(name="plat_id")
    public Integer getPlatId() {
        return this.platId;
    }
    
    public void setPlatId(Integer platId) {
        this.platId = platId;
    }

    
    @Column(name="per_shake_cost", precision=20, scale=0)
    public BigDecimal getPerShakeCost() {
        return this.perShakeCost;
    }
    
    public void setPerShakeCost(BigDecimal perShakeCost) {
        this.perShakeCost = perShakeCost;
    }

    
    @Column(name="shake_rate", precision=20, scale=0)
    public BigDecimal getShakeRate() {
        return this.shakeRate;
    }
    
    public void setShakeRate(BigDecimal shakeRate) {
        this.shakeRate = shakeRate;
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


