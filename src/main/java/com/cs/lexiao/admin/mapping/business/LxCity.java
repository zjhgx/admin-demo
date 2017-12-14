package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LxCity generated by hbm2java
 */
@Entity
@Table(name="lx_city"
    ,catalog="lexiao"
)
public class LxCity  implements java.io.Serializable {


     private String code;
     private String provinceCode;
     private String name;
     private String searchKey;
     private char status;

    public LxCity() {
    }

	
    public LxCity(String code, String provinceCode, String name, char status) {
        this.code = code;
        this.provinceCode = provinceCode;
        this.name = name;
        this.status = status;
    }
    public LxCity(String code, String provinceCode, String name, String searchKey, char status) {
       this.code = code;
       this.provinceCode = provinceCode;
       this.name = name;
       this.searchKey = searchKey;
       this.status = status;
    }
   
     @Id 

    
    @Column(name="code", unique=true, nullable=false, length=4)
    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }

    
    @Column(name="province_code", nullable=false, length=2)
    public String getProvinceCode() {
        return this.provinceCode;
    }
    
    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }

    
    @Column(name="name", nullable=false, length=32)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    
    @Column(name="search_key", length=60)
    public String getSearchKey() {
        return this.searchKey;
    }
    
    public void setSearchKey(String searchKey) {
        this.searchKey = searchKey;
    }

    
    @Column(name="status", nullable=false, length=1)
    public char getStatus() {
        return this.status;
    }
    
    public void setStatus(char status) {
        this.status = status;
    }




}


