package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LxDistrict generated by hbm2java
 */
@Entity
@Table(name="lx_district"
    ,catalog="lexiao"
)
public class LxDistrict  implements java.io.Serializable {


     private String code;
     private String provinceCode;
     private String cityCode;
     private String name;
     private char status;

    public LxDistrict() {
    }

	
    public LxDistrict(String code, char status) {
        this.code = code;
        this.status = status;
    }
    public LxDistrict(String code, String provinceCode, String cityCode, String name, char status) {
       this.code = code;
       this.provinceCode = provinceCode;
       this.cityCode = cityCode;
       this.name = name;
       this.status = status;
    }
   
     @Id 

    
    @Column(name="code", unique=true, nullable=false, length=8)
    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }

    
    @Column(name="province_code", length=2)
    public String getProvinceCode() {
        return this.provinceCode;
    }
    
    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }

    
    @Column(name="city_code", length=4)
    public String getCityCode() {
        return this.cityCode;
    }
    
    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    
    @Column(name="name", length=64)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    
    @Column(name="status", nullable=false, length=1)
    public char getStatus() {
        return this.status;
    }
    
    public void setStatus(char status) {
        this.status = status;
    }




}


