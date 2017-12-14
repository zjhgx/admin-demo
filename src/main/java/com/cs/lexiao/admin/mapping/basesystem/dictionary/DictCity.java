package com.cs.lexiao.admin.mapping.basesystem.dictionary;

/**
 * DictArea entity. @author MyEclipse Persistence Tools
 */

public class DictCity implements java.io.Serializable {

	/**    
	 * serialVersionUID:TODO（用一句话描述这个变量表示什么）    
	 *    
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 1L;
	// Fields

	private Long id;
	private Long pid;
	private String code;
	private String tempPcode;
	private String nameCn;
	private String nameEn;
	private byte displayOrder;
	private Integer status;
	private Integer level;
	private String privinceArea;
	private String shortName;

	// Constructors

	/** default constructor */
	public DictCity() {
	}

	

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getPid() {
		return this.pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTempPcode() {
		return this.tempPcode;
	}

	public void setTempPcode(String tempPcode) {
		this.tempPcode = tempPcode;
	}

	public String getNameCn() {
		return this.nameCn;
	}

	public void setNameCn(String nameCn) {
		this.nameCn = nameCn;
	}

	public String getNameEn() {
		return this.nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}



	/**    
	 * displayOrder    
	 *    
	 * @return  the displayOrder    
	 * @since   CodingExample Ver(编码范例查看) 1.0    
	 */
	
	public byte getDisplayOrder() {
		return displayOrder;
	}



	/**    
	 * @param displayOrder the displayOrder to set    
	 */
	public void setDisplayOrder(byte displayOrder) {
		this.displayOrder = displayOrder;
	}



	/**    
	 * status    
	 *    
	 * @return  the status    
	 * @since   CodingExample Ver(编码范例查看) 1.0    
	 */
	
	public Integer getStatus() {
		return status;
	}



	/**    
	 * @param status the status to set    
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}



	/**    
	 * level    
	 *    
	 * @return  the level    
	 * @since   CodingExample Ver(编码范例查看) 1.0    
	 */
	
	public Integer getLevel() {
		return level;
	}



	/**    
	 * @param level the level to set    
	 */
	public void setLevel(Integer level) {
		this.level = level;
	}



	/**    
	 * privinceArea    
	 *    
	 * @return  the privinceArea    
	 * @since   CodingExample Ver(编码范例查看) 1.0    
	 */
	
	public String getPrivinceArea() {
		return privinceArea;
	}



	/**    
	 * @param privinceArea the privinceArea to set    
	 */
	public void setPrivinceArea(String privinceArea) {
		this.privinceArea = privinceArea;
	}



	/**    
	 * shortName    
	 *    
	 * @return  the shortName    
	 * @since   CodingExample Ver(编码范例查看) 1.0    
	 */
	
	public String getShortName() {
		return shortName;
	}



	/**    
	 * @param shortName the shortName to set    
	 */
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	
	
}