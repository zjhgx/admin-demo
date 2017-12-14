package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LxRechargeApply generated by hbm2java
 */
@Entity
@Table(name="lx_recharge_apply"
    ,catalog="lexiao"
)
public class LxRechargeApply  implements java.io.Serializable {


     private Integer id;
     private Integer ctime;
     private Integer mtime;
     private Integer creator;
     private Integer uid;
     private String rechargeNo;
     private String bankCode;
     private String bankName;
     private String accountNo;
     private String accountName;
     private Integer applyAmount;
     private Integer actualAmount;
     private Boolean status;
     private Integer auditor;
     private Integer auditTime;
     private Boolean auditStatus;
     private String remark;

    public LxRechargeApply() {
    }

    public LxRechargeApply(Integer ctime, Integer mtime, Integer creator, Integer uid, String rechargeNo, String bankCode, String bankName, String accountNo, String accountName, Integer applyAmount, Integer actualAmount, Boolean status, Integer auditor, Integer auditTime, Boolean auditStatus, String remark) {
       this.ctime = ctime;
       this.mtime = mtime;
       this.creator = creator;
       this.uid = uid;
       this.rechargeNo = rechargeNo;
       this.bankCode = bankCode;
       this.bankName = bankName;
       this.accountNo = accountNo;
       this.accountName = accountName;
       this.applyAmount = applyAmount;
       this.actualAmount = actualAmount;
       this.status = status;
       this.auditor = auditor;
       this.auditTime = auditTime;
       this.auditStatus = auditStatus;
       this.remark = remark;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
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

    
    @Column(name="creator")
    public Integer getCreator() {
        return this.creator;
    }
    
    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    
    @Column(name="uid")
    public Integer getUid() {
        return this.uid;
    }
    
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    
    @Column(name="recharge_no", length=30)
    public String getRechargeNo() {
        return this.rechargeNo;
    }
    
    public void setRechargeNo(String rechargeNo) {
        this.rechargeNo = rechargeNo;
    }

    
    @Column(name="bank_code", length=10)
    public String getBankCode() {
        return this.bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }

    
    @Column(name="bank_name", length=50)
    public String getBankName() {
        return this.bankName;
    }
    
    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    
    @Column(name="account_no", length=30)
    public String getAccountNo() {
        return this.accountNo;
    }
    
    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    
    @Column(name="account_name", length=30)
    public String getAccountName() {
        return this.accountName;
    }
    
    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    
    @Column(name="apply_amount")
    public Integer getApplyAmount() {
        return this.applyAmount;
    }
    
    public void setApplyAmount(Integer applyAmount) {
        this.applyAmount = applyAmount;
    }

    
    @Column(name="actual_amount")
    public Integer getActualAmount() {
        return this.actualAmount;
    }
    
    public void setActualAmount(Integer actualAmount) {
        this.actualAmount = actualAmount;
    }

    
    @Column(name="status")
    public Boolean getStatus() {
        return this.status;
    }
    
    public void setStatus(Boolean status) {
        this.status = status;
    }

    
    @Column(name="auditor")
    public Integer getAuditor() {
        return this.auditor;
    }
    
    public void setAuditor(Integer auditor) {
        this.auditor = auditor;
    }

    
    @Column(name="audit_time")
    public Integer getAuditTime() {
        return this.auditTime;
    }
    
    public void setAuditTime(Integer auditTime) {
        this.auditTime = auditTime;
    }

    
    @Column(name="audit_status")
    public Boolean getAuditStatus() {
        return this.auditStatus;
    }
    
    public void setAuditStatus(Boolean auditStatus) {
        this.auditStatus = auditStatus;
    }

    
    @Column(name="remark", length=1000)
    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }




}


