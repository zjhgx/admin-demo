package com.cs.lexiao.admin.constant;

/**
 * 数据字典key常量类 
 *
 */
public class CodeKeyConstant {

	//
	public static final String	YES_NO						= "A000";

	/** 车贷项目状态 */
	public static final String	XHH_CAR_LOAN_STATUS			= "CAR0001";
	/** 票据项目状态 */
	public static final String	XHH_BILL_AUDIT_STATUS			= "BILL0001";

	/** 附件下载状态 */
	public static final String	XHH_CAR_LOAN_ATTACH_STATUS	= "CAR0002";

	/** 贷款期限单位 */
	public static final String	XHH_TIME_LIMIT_UNIT			= "E002";
	/** 保本类型 */
	public static final String	XHH_SAFEGUARDS				= "E006";
	/** 还款方式 */
	public static final String	XHH_REPAY_WAY				= "E004";
	/** 支付方式 */
	public static final String	XHH_PAY_WAY					= "E024";
	/** 项目系列 */
	public static final String	XHH_PRJ_SERIES				= "E007";
	/** 项目类型 */
	public static final String	XHH_PRJ_TYPE				= "E005";
	/** 投标类型*/
	public static final String XHH_PRJ_BSN                  = "E07001";
	/** 项目状态 */
	public static final String	XHH_FI_PRJ_BID_STATUS		= "E102";
	/** 投资递增金额*/
	public static final String  XHH_FI_STEP_BID_AMOUNT		= "P001";
	/** 出错平台类型 */
	public static final String	XHH_PRJ_ERROR_PLATFORM_TYPE = "E130";
	/**出错平台处理状态 */
	public static final String  XHH_PRJ_ERROR_PROJECT_TYPE  = "E131";
	/** 利率类型 */
	public static final String	XHH_RATE_TYPE				= "E003";
	/** 借款人类型 */
	public static final String	XHH_BORROWER_TYPE			= "E011";
	/** FiPrj审核状态 */
	public static final String	XHH_FI_PRJ_AUDIT_STATUS		= "E008";
	/** 分账状态 */
	public static final String	XHH_TRANSFER_PENDING_ACCOUNT_STATUS		= "E171";
	/** 消息类型 */
	public static final String	XHH_MESSAGE_TYPE			= "E010";
	/** 合同类型 */
	public static final String	XHH_PROTOCOL_TYPE			= "E012";
	/** 机构类型 */
	public static final String  XHH_GUARANTOR_TYPE          ="E044";
	/** 企业注册状态 */
	public static final String	XHH_ORG_REGISTER_STATUS    	= "E103";
	/** 申请人身份*/
	public static final String	XHH_ORG_REGISTER_PROPOSER   = "E105";
	/**手续费支付方式*/
	public static final String  XHH_REPAY_TYPE            	="E104";  
    /** 企业直融申请 */
    public static final String  XHH_FINANCE_STATUS          ="FIN0001";
    /** 发表条件 */
    public static final String  XHH_PROJECT_SPLIT_TYPE      = "E106";
    /** 业务类型  */
    public static final String  XHH_BUSI_TYPE               = "E107";
	/** 业务子类型 */
    public static final String  XHH_SUB_BUSI_TYPE               = "E114";
    /** 项目支付类型CODE */
    public static final String  PAY_TYPE_CODE_KEY           = "E109";
    /** 项目还款计划状态 */
    public static final String  REPAY_PLAN_STATUS           = "E136";
    /**提醒设置的发送类型*/
    public static final String  XHH_MESSAGE_SEND_TYPE      ="E148";

    /** 电子签章-合同业务对象类型 */
    public static final String XHH_CONTRACT_BUSINESS_TYPE		= "E143";
    /** 变现状态 */
    public static final String XHH_PRJ_FAST_CASH_STATUS          ="E111";
    /** 银行类型 */
    public static final String XHH_PRJ_SUB_BANK             ="E009";
    /** 充值类型 */
    public static final String XHH_RECHARGE_TYPE             ="E112";
    /** 充值状态 */
    public static final String XHH_RECHARGE_STATUS             ="E110";
    /** 提现状态 */
    public static final String XHH_CASHOUT_STATUS             ="E113";
    /** 项目还款计划类型 */
    public static final String  REPAY_PLAN_TYPE           = "E141";

	/**银行**/
	public static final String PAY_TYPE_CODE_YINGHANG    ="E009";
	public static final String CASHOUT_CHANNEL_CODE_KEYE112    ="E112";
	
	/**自动提现渠道*/
	public static final String CASHOUT_CHANNEL_CODE_ACASH001    ="ACASH001";
	/**提现渠道*/
	public static final String CASHOUT_CHANNEL_CODE_KEYE001    ="E001";
	/**提现状态CodeKey*/
	public static final String CASHOUT_STATUS_CODE_KEY    ="E113";
	/**保理项目初始化证据列表*/
	public static final String FACTOR_AUDIT_RECORD_CODE = "E021";    
    //融资端H端
    /** 客户类型 */
	public static final String  YRZ_REGISTER_USERTYPE    ="YRZ002";
	/** 注册人类型 */
	public static final String  YRZ_REGISTER_ROLETYPE    ="YRZ003";
	/** 企业来源类型 */
	public static final String  YRZ_CORP_SOURCE    ="YRZ004";
	/** 用户类型 */
	public static final String  YRZ_INVEST_TYPE    ="YRZ005";
	/** 融资用户信用状态 */
	public static final String  XHH_BORROWER_CREDIT_STATUS    ="E019";
	/** 融资用户信用状态 */
	public static final String  XHH_SEX    ="A001";
	/** 融资用户学历 */
	public static final String  XHH_EDUCATION    ="A003";
	/** 融资用户企业规模 */
	public static final String  XHH_CORP_SCALE    ="A137";
	/** 婚姻状况 */
	public static final String  XHH_MARITAL_STATUS    ="A002";
	//放款申请
	/** 业务类型 */
	public static final String  XHH_BUSINESS_TYPE    ="E132";
	/** 放款申请状态 */
	public static final String  XHH_LOAN_APPLY_STATUS    ="E145";
	/** 付款方式 */
	public static final String  XHH_LOAN_PAY_TYPE    ="E146";
	/** ubsp接口通知表状态 */
	public static final String  XHH_LOAN_UBSP_STATUS    ="E147";
	/** 最终业务类型(所有类型以此为准)*/
	public static final String  XHH_FINAL_BUSINESS_TYPE="E132";
	/**ubsp项目类型与xxx项目类型映射关系*/
	public static final String UBSP_TO_XHH_BUSINESS_TYPE="UBSP0001";
	/**收款银行类型***/
	public static final String XHH_BANK_TYPE = "E009";
	/** 短信发送状态*/
	public static final String  XHH_SHORTMESSAGE_STATUS    ="M001";
	/** ubsp项目变更类型*/
	public static final String XHH_UBSP_CHANGE_TYPE = "E151";
	/**放款银行类型***/
	public static final String XHH_LOAN_BANK_TYPE = "FK001"; 
	/**强制修改密码列表***/
	public static final String CHANGE_PWD_LIST = "PWD001";
	/**公司评级**/
	public static final String XHH_GUARANTOR_PINGJI = "E045";
	/** 金融产品重构后业务类型 */
	public static final String XHH_PRJ_BUSINESS_TYPE = "FRB001";
	/** ubsp业务类型*/
	public static final String XHH_UBSP_BUSINESS_TYPE = "E152";
	/** 信用状况类型*/
	public static final String XHH_CREDIT_STATUS = "E020";
	 /** 项目订单还款计划类型 */
    public static final String  PRJ_ORDER_REPAY_PLAN_TYPE =  "E156";
	/** 融资申请企业公示材料类型 */
	public static final String FINANCE_MATERIAL_CORP 	= "E047";
	 /** 融资申请个人公示材料类型 */
	 public static final String FINANCE_MATERIAL_PERSON 	= "E048";
	 
	/** 企业保证人公司材料 */ 
	public static final String GUARANTOR_MATERIAL_CORP = "E050";
	/** 个人保证人公司材料 */
	public static final String GUARANTOR_MATERIAL_PERSON = "E051";
	 


	/** 客服常见问题和答案 */
	public static final String XHH_QUESTION_ANSWER 	= "E160";
	
	public static final String CHARGEBACK_STATUS = "E161"; 
	
	/** 企业性质 */
	public static final String ENTERPRISE_NATURE = "EP001";
	/** 工作性质 */
	public static final String JOB_NATURE = "PR001";
	/** 基金类别 */
	public static final String FUND_TYPE = "C0101";
	
	 /**存合同的缓存名称**/
    public static final String MATERIAL_PATH_RELATION_CONTRACT = "materialPathRelationContract";
    
    /** 筛选合同列表排序方式*/
    public static final String XHH_CONTRACT_ORDER_TYPE = "E164";
    
    /** 特殊标标名后缀 */
    public static final String XHH_PRJ_NAME_SUFFIX = "E166";
    
    /** E商贷借款公示材料强制更新时间点  */
    public static final String XHH_PRJ_D4_UPDATE = "D41";
    /** 净代宝借款公示材料强制更新时间点 */
    public static final String XHH_PRJ_D5_UPDATE = "D51";
    
    /** 放款状态编码 */
    public static final String XHH_PRJ_PAY_STATUS = "E167";
    /** 代还款状态编码 */
    public static final String XHH_PRJ_REPAY_STATUS = "E168";
    		
    
    /** 平台管理费方式 */
    public static final String XHH_PRJ_PLATFORM_RATE_WAY = "E170";
}
