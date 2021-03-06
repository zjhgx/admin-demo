package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * LxUserLoginLogId generated by hbm2java
 */
@Embeddable
public class LxUserLoginLogId  implements java.io.Serializable {


     private int id;
     private int uid;
     private String sorcePlatfrom;
     private int lat;
     private int lon;
     private int ctime;
     private int ip;

    public LxUserLoginLogId() {
    }

    public LxUserLoginLogId(int id, int uid, String sorcePlatfrom, int lat, int lon, int ctime, int ip) {
       this.id = id;
       this.uid = uid;
       this.sorcePlatfrom = sorcePlatfrom;
       this.lat = lat;
       this.lon = lon;
       this.ctime = ctime;
       this.ip = ip;
    }
   


    @Column(name="id", nullable=false)
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }


    @Column(name="uid", nullable=false)
    public int getUid() {
        return this.uid;
    }
    
    public void setUid(int uid) {
        this.uid = uid;
    }


    @Column(name="sorce_platfrom", nullable=false, length=20)
    public String getSorcePlatfrom() {
        return this.sorcePlatfrom;
    }
    
    public void setSorcePlatfrom(String sorcePlatfrom) {
        this.sorcePlatfrom = sorcePlatfrom;
    }


    @Column(name="lat", nullable=false)
    public int getLat() {
        return this.lat;
    }
    
    public void setLat(int lat) {
        this.lat = lat;
    }


    @Column(name="lon", nullable=false)
    public int getLon() {
        return this.lon;
    }
    
    public void setLon(int lon) {
        this.lon = lon;
    }


    @Column(name="ctime", nullable=false)
    public int getCtime() {
        return this.ctime;
    }
    
    public void setCtime(int ctime) {
        this.ctime = ctime;
    }


    @Column(name="ip", nullable=false)
    public int getIp() {
        return this.ip;
    }
    
    public void setIp(int ip) {
        this.ip = ip;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof LxUserLoginLogId) ) return false;
		 LxUserLoginLogId castOther = ( LxUserLoginLogId ) other; 
         
		 return (this.getId()==castOther.getId())
 && (this.getUid()==castOther.getUid())
 && ( (this.getSorcePlatfrom()==castOther.getSorcePlatfrom()) || ( this.getSorcePlatfrom()!=null && castOther.getSorcePlatfrom()!=null && this.getSorcePlatfrom().equals(castOther.getSorcePlatfrom()) ) )
 && (this.getLat()==castOther.getLat())
 && (this.getLon()==castOther.getLon())
 && (this.getCtime()==castOther.getCtime())
 && (this.getIp()==castOther.getIp());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getId();
         result = 37 * result + this.getUid();
         result = 37 * result + ( getSorcePlatfrom() == null ? 0 : this.getSorcePlatfrom().hashCode() );
         result = 37 * result + this.getLat();
         result = 37 * result + this.getLon();
         result = 37 * result + this.getCtime();
         result = 37 * result + this.getIp();
         return result;
   }   


}


