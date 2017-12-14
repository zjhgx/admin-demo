package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LxRole generated by hbm2java
 */
@Entity
@Table(name="lx_role"
    ,catalog="lexiao"
)
public class LxRole  implements java.io.Serializable {


     private Integer id;
     private String roleName;
     private String authIds;
     private Integer ctime;
     private Integer mtime;

    public LxRole() {
    }

	
    public LxRole(String roleName, String authIds) {
        this.roleName = roleName;
        this.authIds = authIds;
    }
    public LxRole(String roleName, String authIds, Integer ctime, Integer mtime) {
       this.roleName = roleName;
       this.authIds = authIds;
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

    
    @Column(name="role_name", nullable=false, length=20)
    public String getRoleName() {
        return this.roleName;
    }
    
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    
    @Column(name="auth_ids", nullable=false, length=200)
    public String getAuthIds() {
        return this.authIds;
    }
    
    public void setAuthIds(String authIds) {
        this.authIds = authIds;
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


