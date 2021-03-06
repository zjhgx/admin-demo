package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LxMerchantInfo generated by hbm2java
 */
@Entity
@Table(name="lx_merchant_info"
    ,catalog="lexiao"
)
public class LxMerchantInfo  implements java.io.Serializable {


     private Integer id;
     private Integer uid;
     private Integer accountUid;
     private Integer PMid;
     private String name;
     private String licences;
     private String person;
     private Integer tel;
     private Integer provice;
     private Integer city;
     private Integer area;
     private Integer proviceId;
     private Integer cityId;
     private Integer areaId;
     private String address;
     private String introduction;
     private String personTel;
     private String shopArea;
     private Integer assort;
     private Integer subAssort;
     private Integer staffNum;
     private Integer personIdImgFront;
     private Integer personIdImgBack;
     private Integer licenceImg;
     private Integer logo;
     private String images;
     private Integer successOrderNums;
     private Integer status;
     private Integer ctime;
     private Integer mtime;

    public LxMerchantInfo() {
    }

    public LxMerchantInfo(Integer uid, Integer accountUid, Integer PMid, String name, String licences, String person, Integer tel, Integer provice, Integer city, Integer area, Integer proviceId, Integer cityId, Integer areaId, String address, String introduction, String personTel, String shopArea, Integer assort, Integer subAssort, Integer staffNum, Integer personIdImgFront, Integer personIdImgBack, Integer licenceImg, Integer logo, String images, Integer successOrderNums, Integer status, Integer ctime, Integer mtime) {
       this.uid = uid;
       this.accountUid = accountUid;
       this.PMid = PMid;
       this.name = name;
       this.licences = licences;
       this.person = person;
       this.tel = tel;
       this.provice = provice;
       this.city = city;
       this.area = area;
       this.proviceId = proviceId;
       this.cityId = cityId;
       this.areaId = areaId;
       this.address = address;
       this.introduction = introduction;
       this.personTel = personTel;
       this.shopArea = shopArea;
       this.assort = assort;
       this.subAssort = subAssort;
       this.staffNum = staffNum;
       this.personIdImgFront = personIdImgFront;
       this.personIdImgBack = personIdImgBack;
       this.licenceImg = licenceImg;
       this.logo = logo;
       this.images = images;
       this.successOrderNums = successOrderNums;
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

    
    @Column(name="uid")
    public Integer getUid() {
        return this.uid;
    }
    
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    
    @Column(name="account_uid")
    public Integer getAccountUid() {
        return this.accountUid;
    }
    
    public void setAccountUid(Integer accountUid) {
        this.accountUid = accountUid;
    }

    
    @Column(name="p_mid")
    public Integer getPMid() {
        return this.PMid;
    }
    
    public void setPMid(Integer PMid) {
        this.PMid = PMid;
    }

    
    @Column(name="name", length=200)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    
    @Column(name="licences", length=50)
    public String getLicences() {
        return this.licences;
    }
    
    public void setLicences(String licences) {
        this.licences = licences;
    }

    
    @Column(name="person", length=20)
    public String getPerson() {
        return this.person;
    }
    
    public void setPerson(String person) {
        this.person = person;
    }

    
    @Column(name="tel")
    public Integer getTel() {
        return this.tel;
    }
    
    public void setTel(Integer tel) {
        this.tel = tel;
    }

    
    @Column(name="provice")
    public Integer getProvice() {
        return this.provice;
    }
    
    public void setProvice(Integer provice) {
        this.provice = provice;
    }

    
    @Column(name="city")
    public Integer getCity() {
        return this.city;
    }
    
    public void setCity(Integer city) {
        this.city = city;
    }

    
    @Column(name="area")
    public Integer getArea() {
        return this.area;
    }
    
    public void setArea(Integer area) {
        this.area = area;
    }

    
    @Column(name="provice_id")
    public Integer getProviceId() {
        return this.proviceId;
    }
    
    public void setProviceId(Integer proviceId) {
        this.proviceId = proviceId;
    }

    
    @Column(name="city_id")
    public Integer getCityId() {
        return this.cityId;
    }
    
    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    
    @Column(name="area_id")
    public Integer getAreaId() {
        return this.areaId;
    }
    
    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    
    @Column(name="address", length=200)
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }

    
    @Column(name="introduction", length=65535)
    public String getIntroduction() {
        return this.introduction;
    }
    
    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    
    @Column(name="person_tel", length=20)
    public String getPersonTel() {
        return this.personTel;
    }
    
    public void setPersonTel(String personTel) {
        this.personTel = personTel;
    }

    
    @Column(name="shop_area", length=20)
    public String getShopArea() {
        return this.shopArea;
    }
    
    public void setShopArea(String shopArea) {
        this.shopArea = shopArea;
    }

    
    @Column(name="assort")
    public Integer getAssort() {
        return this.assort;
    }
    
    public void setAssort(Integer assort) {
        this.assort = assort;
    }

    
    @Column(name="sub_assort")
    public Integer getSubAssort() {
        return this.subAssort;
    }
    
    public void setSubAssort(Integer subAssort) {
        this.subAssort = subAssort;
    }

    
    @Column(name="staff_num")
    public Integer getStaffNum() {
        return this.staffNum;
    }
    
    public void setStaffNum(Integer staffNum) {
        this.staffNum = staffNum;
    }

    
    @Column(name="person_id_img_front")
    public Integer getPersonIdImgFront() {
        return this.personIdImgFront;
    }
    
    public void setPersonIdImgFront(Integer personIdImgFront) {
        this.personIdImgFront = personIdImgFront;
    }

    
    @Column(name="person_id_img_back")
    public Integer getPersonIdImgBack() {
        return this.personIdImgBack;
    }
    
    public void setPersonIdImgBack(Integer personIdImgBack) {
        this.personIdImgBack = personIdImgBack;
    }

    
    @Column(name="licence_img")
    public Integer getLicenceImg() {
        return this.licenceImg;
    }
    
    public void setLicenceImg(Integer licenceImg) {
        this.licenceImg = licenceImg;
    }

    
    @Column(name="logo")
    public Integer getLogo() {
        return this.logo;
    }
    
    public void setLogo(Integer logo) {
        this.logo = logo;
    }

    
    @Column(name="images", length=50)
    public String getImages() {
        return this.images;
    }
    
    public void setImages(String images) {
        this.images = images;
    }

    
    @Column(name="success_order_nums")
    public Integer getSuccessOrderNums() {
        return this.successOrderNums;
    }
    
    public void setSuccessOrderNums(Integer successOrderNums) {
        this.successOrderNums = successOrderNums;
    }

    
    @Column(name="status")
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
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


