package com.cs.lexiao.admin.mapping.business;
// Generated Dec 14, 2017 6:24:57 PM by Hibernate Tools 3.2.4.GA


import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * LxCodeKeyId generated by hbm2java
 */
@Embeddable
public class LxCodeKeyId  implements java.io.Serializable {


     private String codeKey;
     private String keyName;
     private String langType;
     private boolean isNew;

    public LxCodeKeyId() {
    }

	
    public LxCodeKeyId(boolean isNew) {
        this.isNew = isNew;
    }
    public LxCodeKeyId(String codeKey, String keyName, String langType, boolean isNew) {
       this.codeKey = codeKey;
       this.keyName = keyName;
       this.langType = langType;
       this.isNew = isNew;
    }
   


    @Column(name="code_key", unique=true, length=10)
    public String getCodeKey() {
        return this.codeKey;
    }
    
    public void setCodeKey(String codeKey) {
        this.codeKey = codeKey;
    }


    @Column(name="key_name", length=100)
    public String getKeyName() {
        return this.keyName;
    }
    
    public void setKeyName(String keyName) {
        this.keyName = keyName;
    }


    @Column(name="lang_type", length=10)
    public String getLangType() {
        return this.langType;
    }
    
    public void setLangType(String langType) {
        this.langType = langType;
    }


    @Column(name="is_new", nullable=false)
    public boolean isIsNew() {
        return this.isNew;
    }
    
    public void setIsNew(boolean isNew) {
        this.isNew = isNew;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof LxCodeKeyId) ) return false;
		 LxCodeKeyId castOther = ( LxCodeKeyId ) other; 
         
		 return ( (this.getCodeKey()==castOther.getCodeKey()) || ( this.getCodeKey()!=null && castOther.getCodeKey()!=null && this.getCodeKey().equals(castOther.getCodeKey()) ) )
 && ( (this.getKeyName()==castOther.getKeyName()) || ( this.getKeyName()!=null && castOther.getKeyName()!=null && this.getKeyName().equals(castOther.getKeyName()) ) )
 && ( (this.getLangType()==castOther.getLangType()) || ( this.getLangType()!=null && castOther.getLangType()!=null && this.getLangType().equals(castOther.getLangType()) ) )
 && (this.isIsNew()==castOther.isIsNew());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getCodeKey() == null ? 0 : this.getCodeKey().hashCode() );
         result = 37 * result + ( getKeyName() == null ? 0 : this.getKeyName().hashCode() );
         result = 37 * result + ( getLangType() == null ? 0 : this.getLangType().hashCode() );
         result = 37 * result + (this.isIsNew()?1:0);
         return result;
   }   


}


