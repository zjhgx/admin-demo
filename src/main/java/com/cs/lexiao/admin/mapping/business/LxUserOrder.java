package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LxUserOrder generated by hbm2java
 */
@Entity
@Table(name="lx_user_order"
    ,catalog="lexiao"
)
public class LxUserOrder  implements java.io.Serializable {


     private Integer id;
     private Integer uid;
     private Integer mid;
     private String orderNo;
     private Integer amount;
     private Integer realAmount;
     private Integer discountAmount;
     private Integer couponId;
     private Byte status;
     private Integer expireTime;
     private String channel;
     private String outTicketId;
     private String callBackStr;
     private Integer ctime;
     private Integer mtime;

    public LxUserOrder() {
    }

    public LxUserOrder(Integer uid, Integer mid, String orderNo, Integer amount, Integer realAmount, Integer discountAmount, Integer couponId, Byte status, Integer expireTime, String channel, String outTicketId, String callBackStr, Integer ctime, Integer mtime) {
       this.uid = uid;
       this.mid = mid;
       this.orderNo = orderNo;
       this.amount = amount;
       this.realAmount = realAmount;
       this.discountAmount = discountAmount;
       this.couponId = couponId;
       this.status = status;
       this.expireTime = expireTime;
       this.channel = channel;
       this.outTicketId = outTicketId;
       this.callBackStr = callBackStr;
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

    
    @Column(name="uid")
    public Integer getUid() {
        return this.uid;
    }
    
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    
    @Column(name="mid")
    public Integer getMid() {
        return this.mid;
    }
    
    public void setMid(Integer mid) {
        this.mid = mid;
    }

    
    @Column(name="order_no", length=30)
    public String getOrderNo() {
        return this.orderNo;
    }
    
    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    
    @Column(name="amount")
    public Integer getAmount() {
        return this.amount;
    }
    
    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    
    @Column(name="real_amount")
    public Integer getRealAmount() {
        return this.realAmount;
    }
    
    public void setRealAmount(Integer realAmount) {
        this.realAmount = realAmount;
    }

    
    @Column(name="discount_amount")
    public Integer getDiscountAmount() {
        return this.discountAmount;
    }
    
    public void setDiscountAmount(Integer discountAmount) {
        this.discountAmount = discountAmount;
    }

    
    @Column(name="coupon_id")
    public Integer getCouponId() {
        return this.couponId;
    }
    
    public void setCouponId(Integer couponId) {
        this.couponId = couponId;
    }

    
    @Column(name="status")
    public Byte getStatus() {
        return this.status;
    }
    
    public void setStatus(Byte status) {
        this.status = status;
    }

    
    @Column(name="expire_time")
    public Integer getExpireTime() {
        return this.expireTime;
    }
    
    public void setExpireTime(Integer expireTime) {
        this.expireTime = expireTime;
    }

    
    @Column(name="channel", length=20)
    public String getChannel() {
        return this.channel;
    }
    
    public void setChannel(String channel) {
        this.channel = channel;
    }

    
    @Column(name="out_ticket_id", length=30)
    public String getOutTicketId() {
        return this.outTicketId;
    }
    
    public void setOutTicketId(String outTicketId) {
        this.outTicketId = outTicketId;
    }

    
    @Column(name="call_back_str", length=200)
    public String getCallBackStr() {
        return this.callBackStr;
    }
    
    public void setCallBackStr(String callBackStr) {
        this.callBackStr = callBackStr;
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

