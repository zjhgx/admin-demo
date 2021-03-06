package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * LxPlatformBanner generated by hbm2java
 */
@Entity
@Table(name="lx_platform_banner"
    ,catalog="lexiao"
)
public class LxPlatformBanner  implements java.io.Serializable {


     private Integer id;
     private int platId;
     private int imgId;
     private String title;
     private byte position;
     private String url;
     private Date startTime;
     private Date endTime;
     private int sort;
     private String remark;
     private Byte status;
     private Integer ctime;
     private Integer mtime;
     private Integer creator;
     private Integer modifier;

    public LxPlatformBanner() {
    }

	
    public LxPlatformBanner(int platId, int imgId, String title, byte position, String url, Date startTime, Date endTime, int sort, String remark) {
        this.platId = platId;
        this.imgId = imgId;
        this.title = title;
        this.position = position;
        this.url = url;
        this.startTime = startTime;
        this.endTime = endTime;
        this.sort = sort;
        this.remark = remark;
    }
    public LxPlatformBanner(int platId, int imgId, String title, byte position, String url, Date startTime, Date endTime, int sort, String remark, Byte status, Integer ctime, Integer mtime, Integer creator, Integer modifier) {
       this.platId = platId;
       this.imgId = imgId;
       this.title = title;
       this.position = position;
       this.url = url;
       this.startTime = startTime;
       this.endTime = endTime;
       this.sort = sort;
       this.remark = remark;
       this.status = status;
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

    
    @Column(name="plat_id", nullable=false)
    public int getPlatId() {
        return this.platId;
    }
    
    public void setPlatId(int platId) {
        this.platId = platId;
    }

    
    @Column(name="img_id", nullable=false)
    public int getImgId() {
        return this.imgId;
    }
    
    public void setImgId(int imgId) {
        this.imgId = imgId;
    }

    
    @Column(name="title", nullable=false, length=215)
    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }

    
    @Column(name="position", nullable=false)
    public byte getPosition() {
        return this.position;
    }
    
    public void setPosition(byte position) {
        this.position = position;
    }

    
    @Column(name="url", nullable=false, length=215)
    public String getUrl() {
        return this.url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="start_time", nullable=false, length=19)
    public Date getStartTime() {
        return this.startTime;
    }
    
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="end_time", nullable=false, length=19)
    public Date getEndTime() {
        return this.endTime;
    }
    
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    
    @Column(name="sort", nullable=false)
    public int getSort() {
        return this.sort;
    }
    
    public void setSort(int sort) {
        this.sort = sort;
    }

    
    @Column(name="remark", nullable=false, length=215)
    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
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


