package com.cs.lexiao.admin.basesystem.webUtil.tag;

import java.io.Writer;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.components.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cs.lexiao.admin.basesystem.dictionary.util.DictionaryUtil;
import com.opensymphony.xwork2.util.ValueStack;

/**
 * 
 * CodeName.java
 * 
 * @author shentuwy
 * @date 2012-9-3
 * 
 */
public class CodeName extends Component {

	private static final Logger	LOG	= LoggerFactory.getLogger(CodeName.class);

	public CodeName(ValueStack stack) {
		super(stack);
	}

	@Override
	public boolean start(Writer writer) {
		if (StringUtils.isNotBlank(codeKey) && StringUtils.isNotBlank(codeNo)) {
			try {
				Object value = findValue(codeNo);
				codeNo = value instanceof String ? (String) value : String
						.valueOf(value);
				String codeName = DictionaryUtil.getCodeNameByKey(codeKey,
						codeNo);
				if (StringUtils.isNotBlank(codeName)) {
					writer.write(codeName);
				}
			} catch (Exception ex) {
				LOG.error(ex.getMessage(), ex);
			}
		}
		return false;
	}

	/** 数据字典类型 */
	private String	codeKey;
	/** 数据字典编码 */
	private String	codeNo;

	public String getCodeKey() {
		return codeKey;
	}

	public void setCodeKey(String codeKey) {
		this.codeKey = codeKey;
	}

	public String getCodeNo() {
		return codeNo;
	}

	public void setCodeNo(String codeNo) {
		this.codeNo = codeNo;
	}

}
