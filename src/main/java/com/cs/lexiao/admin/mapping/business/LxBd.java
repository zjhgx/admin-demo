package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * LxBd generated by hbm2java
 */
@Entity
@Table(name="lx_bd"
    ,catalog="lexiao"
    , uniqueConstraints = @UniqueConstraint(columnNames="uid") 
)
public class LxBd  implements java.io.Serializable {


     private Integer id;
     private int uid;
     private String name;
     private String mobile;
     private String identityId;
     private String cardId;
     private String cardOfDeposit;
     private byte positionLevel;
     private Integer parentId;
     private String area;
     private byte status;
     private int mtime;
     private int ctime;

    public LxBd() {
    }

	
    public LxBd(int uid, String name, String mobile, String cardId, String cardOfDeposit, byte positionLevel, String area, byte status, int mtime, int ctime) {
        this.uid = uid;
        this.name = name;
        this.mobile = mobile;
        this.cardId = cardId;
        this.cardOfDeposit = cardOfDeposit;
        this.positionLevel = positionLevel;
        this.area = area;
        this.status = status;
        this.mtime = mtime;
        this.ctime = ctime;
    }
    public LxBd(int uid, String name, String mobile, String identityId, String cardId, String cardOfDeposit, byte positionLevel, Integer parentId, String area, byte status, int mtime, int ctime) {
       this.uid = uid;
       this.name = name;
       this.mobile = mobile;
       this.identityId = identityId;
       this.cardId = cardId;
       this.cardOfDeposit = cardOfDeposit;
       this.positionLevel = positionLevel;
       this.parentId = parentId;
       this.area = area;
       this.status = status;
       this.mtime = mtime;
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

    
    @Column(name="uid", unique=true, nullable=false)
    public int getUid() {
        return this.uid;
    }
    
    public void setUid(int uid) {
        this.uid = uid;
    }

    
    @Column(name="name", nullable=false, length=32)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    
    @Column(name="mobile", nullable=false, length=32)
    public String getMobile() {
        return this.mobile;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    
    @Column(name="identity_id", length=256)
    public String getIdentityId() {
        return this.identityId;
    }
    
    public void setIdentityId(String identityId) {
        this.identityId = identityId;
    }

    
    @Column(name="card_id", nullable=false, length=64)
    public String getCardId() {
        return this.cardId;
    }
    
    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    
    @Column(name="card_of_deposit", nullable=false, length=64)
    public String getCardOfDeposit() {
        return this.cardOfDeposit;
    }
    
    public void setCardOfDeposit(String cardOfDeposit) {
        this.cardOfDeposit = cardOfDeposit;
    }

    
    @Column(name="position_level", nullable=false)
    public byte getPositionLevel() {
        return this.positionLevel;
    }
    
    public void setPositionLevel(byte positionLevel) {
        this.positionLevel = positionLevel;
    }

    
    @Column(name="parent_id")
    public Integer getParentId() {
        return this.parentId;
    }
    
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    
    @Column(name="area", nullable=false, length=256)
    public String getArea() {
        return this.area;
    }
    
    public void setArea(String area) {
        this.area = area;
    }

    
    @Column(name="status", nullable=false)
    public byte getStatus() {
        return this.status;
    }
    
    public void setStatus(byte status) {
        this.status = status;
    }

    
    @Column(name="mtime", nullable=false)
    public int getMtime() {
        return this.mtime;
    }
    
    public void setMtime(int mtime) {
        this.mtime = mtime;
    }

    
    @Column(name="ctime", nullable=false)
    public int getCtime() {
        return this.ctime;
    }
    
    public void setCtime(int ctime) {
        this.ctime = ctime;
    }




}

