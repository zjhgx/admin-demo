package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LxUserBankCard generated by hbm2java
 */
@Entity
@Table(name="lx_user_bank_card"
    ,catalog="lexiao"
)
public class LxUserBankCard  implements java.io.Serializable {


     private Integer id;
     private int mid;
     private String name;
     private String cardNo;
     private String province;
     private String city;
     private String bankName;
     private String subBankName;
     private Byte isActive;
     private Integer ctime;
     private Integer mtime;
     private Integer creator;
     private Integer modifier;

    public LxUserBankCard() {
    }

	
    public LxUserBankCard(int mid, String name, String cardNo, String province, String city, String bankName, String subBankName) {
        this.mid = mid;
        this.name = name;
        this.cardNo = cardNo;
        this.province = province;
        this.city = city;
        this.bankName = bankName;
        this.subBankName = subBankName;
    }
    public LxUserBankCard(int mid, String name, String cardNo, String province, String city, String bankName, String subBankName, Byte isActive, Integer ctime, Integer mtime, Integer creator, Integer modifier) {
       this.mid = mid;
       this.name = name;
       this.cardNo = cardNo;
       this.province = province;
       this.city = city;
       this.bankName = bankName;
       this.subBankName = subBankName;
       this.isActive = isActive;
       this.ctime = ctime;
       this.mtime = mtime;
       this.creator = creator;
       this.modifier = modifier;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    
    @Column(name="mid", nullable=false)
    public int getMid() {
        return this.mid;
    }
    
    public void setMid(int mid) {
        this.mid = mid;
    }

    
    @Column(name="name", nullable=false, length=20)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    
    @Column(name="card_no", nullable=false, length=30)
    public String getCardNo() {
        return this.cardNo;
    }
    
    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    
    @Column(name="province", nullable=false, length=215)
    public String getProvince() {
        return this.province;
    }
    
    public void setProvince(String province) {
        this.province = province;
    }

    
    @Column(name="city", nullable=false, length=215)
    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }

    
    @Column(name="bank_name", nullable=false, length=125)
    public String getBankName() {
        return this.bankName;
    }
    
    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    
    @Column(name="sub_bank_name", nullable=false, length=125)
    public String getSubBankName() {
        return this.subBankName;
    }
    
    public void setSubBankName(String subBankName) {
        this.subBankName = subBankName;
    }

    
    @Column(name="is_active")
    public Byte getIsActive() {
        return this.isActive;
    }
    
    public void setIsActive(Byte isActive) {
        this.isActive = isActive;
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

    
    @Column(name="modifier")
    public Integer getModifier() {
        return this.modifier;
    }
    
    public void setModifier(Integer modifier) {
        this.modifier = modifier;
    }




}

