package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LxAttach generated by hbm2java
 */
@Entity
@Table(name="lx_attach"
    ,catalog="lexiao"
)
public class LxAttach  implements java.io.Serializable {


     private Integer id;
     private String attachType;
     private Integer uid;
     private Integer uploadTime;
     private String name;
     private String type;
     private String size;
     private String extension;
     private String hash;
     private Boolean private_;
     private Boolean isDel;
     private String savepath;
     private String savename;
     private Byte savedomain;
     private String origName;
     private Boolean noTemp;
     private String saveapppath;
     private String imgserver;
     private String pdfpathfile;
     private String desc;
     private Byte isInoursite;
     private Integer ctime;

    public LxAttach() {
    }

	
    public LxAttach(String attachType) {
        this.attachType = attachType;
    }
    public LxAttach(String attachType, Integer uid, Integer uploadTime, String name, String type, String size, String extension, String hash, Boolean private_, Boolean isDel, String savepath, String savename, Byte savedomain, String origName, Boolean noTemp, String saveapppath, String imgserver, String pdfpathfile, String desc, Byte isInoursite, Integer ctime) {
       this.attachType = attachType;
       this.uid = uid;
       this.uploadTime = uploadTime;
       this.name = name;
       this.type = type;
       this.size = size;
       this.extension = extension;
       this.hash = hash;
       this.private_ = private_;
       this.isDel = isDel;
       this.savepath = savepath;
       this.savename = savename;
       this.savedomain = savedomain;
       this.origName = origName;
       this.noTemp = noTemp;
       this.saveapppath = saveapppath;
       this.imgserver = imgserver;
       this.pdfpathfile = pdfpathfile;
       this.desc = desc;
       this.isInoursite = isInoursite;
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

    
    @Column(name="attach_type", nullable=false, length=50)
    public String getAttachType() {
        return this.attachType;
    }
    
    public void setAttachType(String attachType) {
        this.attachType = attachType;
    }

    
    @Column(name="uid")
    public Integer getUid() {
        return this.uid;
    }
    
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    
    @Column(name="uploadTime")
    public Integer getUploadTime() {
        return this.uploadTime;
    }
    
    public void setUploadTime(Integer uploadTime) {
        this.uploadTime = uploadTime;
    }

    
    @Column(name="name")
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    
    @Column(name="type")
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }

    
    @Column(name="size", length=20)
    public String getSize() {
        return this.size;
    }
    
    public void setSize(String size) {
        this.size = size;
    }

    
    @Column(name="extension", length=20)
    public String getExtension() {
        return this.extension;
    }
    
    public void setExtension(String extension) {
        this.extension = extension;
    }

    
    @Column(name="hash", length=32)
    public String getHash() {
        return this.hash;
    }
    
    public void setHash(String hash) {
        this.hash = hash;
    }

    
    @Column(name="private")
    public Boolean getPrivate_() {
        return this.private_;
    }
    
    public void setPrivate_(Boolean private_) {
        this.private_ = private_;
    }

    
    @Column(name="isDel")
    public Boolean getIsDel() {
        return this.isDel;
    }
    
    public void setIsDel(Boolean isDel) {
        this.isDel = isDel;
    }

    
    @Column(name="savepath")
    public String getSavepath() {
        return this.savepath;
    }
    
    public void setSavepath(String savepath) {
        this.savepath = savepath;
    }

    
    @Column(name="savename")
    public String getSavename() {
        return this.savename;
    }
    
    public void setSavename(String savename) {
        this.savename = savename;
    }

    
    @Column(name="savedomain")
    public Byte getSavedomain() {
        return this.savedomain;
    }
    
    public void setSavedomain(Byte savedomain) {
        this.savedomain = savedomain;
    }

    
    @Column(name="origName")
    public String getOrigName() {
        return this.origName;
    }
    
    public void setOrigName(String origName) {
        this.origName = origName;
    }

    
    @Column(name="noTemp")
    public Boolean getNoTemp() {
        return this.noTemp;
    }
    
    public void setNoTemp(Boolean noTemp) {
        this.noTemp = noTemp;
    }

    
    @Column(name="saveapppath")
    public String getSaveapppath() {
        return this.saveapppath;
    }
    
    public void setSaveapppath(String saveapppath) {
        this.saveapppath = saveapppath;
    }

    
    @Column(name="imgserver")
    public String getImgserver() {
        return this.imgserver;
    }
    
    public void setImgserver(String imgserver) {
        this.imgserver = imgserver;
    }

    
    @Column(name="pdfpathfile")
    public String getPdfpathfile() {
        return this.pdfpathfile;
    }
    
    public void setPdfpathfile(String pdfpathfile) {
        this.pdfpathfile = pdfpathfile;
    }

    
    @Column(name="desc")
    public String getDesc() {
        return this.desc;
    }
    
    public void setDesc(String desc) {
        this.desc = desc;
    }

    
    @Column(name="is_inoursite")
    public Byte getIsInoursite() {
        return this.isInoursite;
    }
    
    public void setIsInoursite(Byte isInoursite) {
        this.isInoursite = isInoursite;
    }

    
    @Column(name="ctime")
    public Integer getCtime() {
        return this.ctime;
    }
    
    public void setCtime(Integer ctime) {
        this.ctime = ctime;
    }




}


