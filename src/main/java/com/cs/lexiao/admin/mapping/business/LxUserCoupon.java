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
 * LxUserCoupon generated by hbm2java
 */
@Entity
@Table(name="lx_user_coupon"
    ,catalog="lexiao"
)
public class LxUserCoupon  implements java.io.Serializable {


     private Integer id;
     private Integer couponTempId;
     private Integer mid;
     private Integer platId;
     private Integer uid;
     private Integer receiveTime;
     private BigDecimal discountAmount;
     private BigDecimal needAmount;
     private Byte scope;
     private String needWeek;
     private Integer needTimeStart;
     private Integer needTimeEnd;
     private Integer offTime;
     private String useRule;
     private Integer usedTime;
     private Integer orderId;
     private Byte status;
     private Integer ctime;
     private Integer mtime;

    public LxUserCoupon() {
    }

    public LxUserCoupon(Integer couponTempId, Integer mid, Integer platId, Integer uid, Integer receiveTime, BigDecimal discountAmount, BigDecimal needAmount, Byte scope, String needWeek, Integer needTimeStart, Integer needTimeEnd, Integer offTime, String useRule, Integer usedTime, Integer orderId, Byte status, Integer ctime, Integer mtime) {
       this.couponTempId = couponTempId;
       this.mid = mid;
       this.platId = platId;
       this.uid = uid;
       this.receiveTime = receiveTime;
       this.discountAmount = discountAmount;
       this.needAmount = needAmount;
       this.scope = scope;
       this.needWeek = needWeek;
       this.needTimeStart = needTimeStart;
       this.needTimeEnd = needTimeEnd;
       this.offTime = offTime;
       this.useRule = useRule;
       this.usedTime = usedTime;
       this.orderId = orderId;
       this.status = status;
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

    
    @Column(name="coupon_temp_id")
    public Integer getCouponTempId() {
        return this.couponTempId;
    }
    
    public void setCouponTempId(Integer couponTempId) {
        this.couponTempId = couponTempId;
    }

    
    @Column(name="mid")
    public Integer getMid() {
        return this.mid;
    }
    
    public void setMid(Integer mid) {
        this.mid = mid;
    }

    
    @Column(name="plat_id")
    public Integer getPlatId() {
        return this.platId;
    }
    
    public void setPlatId(Integer platId) {
        this.platId = platId;
    }

    
    @Column(name="uid")
    public Integer getUid() {
        return this.uid;
    }
    
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    
    @Column(name="receive_time")
    public Integer getReceiveTime() {
        return this.receiveTime;
    }
    
    public void setReceiveTime(Integer receiveTime) {
        this.receiveTime = receiveTime;
    }

    
    @Column(name="discount_amount", precision=20, scale=0)
    public BigDecimal getDiscountAmount() {
        return this.discountAmount;
    }
    
    public void setDiscountAmount(BigDecimal discountAmount) {
        this.discountAmount = discountAmount;
    }

    
    @Column(name="need_amount", precision=20, scale=0)
    public BigDecimal getNeedAmount() {
        return this.needAmount;
    }
    
    public void setNeedAmount(BigDecimal needAmount) {
        this.needAmount = needAmount;
    }

    
    @Column(name="scope")
    public Byte getScope() {
        return this.scope;
    }
    
    public void setScope(Byte scope) {
        this.scope = scope;
    }

    
    @Column(name="need_week")
    public String getNeedWeek() {
        return this.needWeek;
    }
    
    public void setNeedWeek(String needWeek) {
        this.needWeek = needWeek;
    }

    
    @Column(name="need_time_start")
    public Integer getNeedTimeStart() {
        return this.needTimeStart;
    }
    
    public void setNeedTimeStart(Integer needTimeStart) {
        this.needTimeStart = needTimeStart;
    }

    
    @Column(name="need_time_end")
    public Integer getNeedTimeEnd() {
        return this.needTimeEnd;
    }
    
    public void setNeedTimeEnd(Integer needTimeEnd) {
        this.needTimeEnd = needTimeEnd;
    }

    
    @Column(name="off_time")
    public Integer getOffTime() {
        return this.offTime;
    }
    
    public void setOffTime(Integer offTime) {
        this.offTime = offTime;
    }

    
    @Column(name="use_rule", length=65535)
    public String getUseRule() {
        return this.useRule;
    }
    
    public void setUseRule(String useRule) {
        this.useRule = useRule;
    }

    
    @Column(name="used_time")
    public Integer getUsedTime() {
        return this.usedTime;
    }
    
    public void setUsedTime(Integer usedTime) {
        this.usedTime = usedTime;
    }

    
    @Column(name="order_id")
    public Integer getOrderId() {
        return this.orderId;
    }
    
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    
    @Column(name="status")
    public Byte getStatus() {
        return this.status;
    }
    
    public void setStatus(Byte status) {
        this.status = status;
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


