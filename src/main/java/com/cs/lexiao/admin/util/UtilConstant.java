package com.cs.lexiao.admin.util;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 常用基本数据状态定义
 * @author renzhuolun
 * @date 2014年7月24日 下午3:23:59
 * @version <b>1.0.0</b>
 */
public final class UtilConstant {
	public static final String YES_NO = "A000";			//是否
	public static final String XXH_CUSTOMER_SEX = "A001";//客户性别
	public static final String XXH_CUSTOMER_MARITAL = "A002";//婚姻状况
	public static final String XXH_CUSTOMER_UIDTYPE = "F0001";//客户类型（企业、个人）
//	public static final String XXH_CUSTOMER_MINO = "F0003";//接入点
	public static final String XXH_CUSTOMER_INFOSOURCE = "F0008";//信息来源
	public static final String XXH_SYS_TYPE = "F0009";	//权限的系统类型
	public static final String XXH_FUN_TYPE = "F0010";	//权限的功能类型
	public static final String XXH_PROTOCOL_TYPE = "F0011"; //协议类型
	public static final String XXH_BANNER_POSITION = "E022"; //Banner位置
	public static final String XXH_INMESSAGE_TYPE = "F0014"; //站内信的类型
	public static final String XXH_ANNOUNCE_ISIMPORTANT = "F0015"; //公告管理：公告是否为重要。
	public static final String XXH_ANNOUNCE_ISRECOMMEND = "F0016"; //公告管理：公告是否为推荐。
	public static final String XXH_CUSTOMER_REGCLIENT = "F0017"; //注册客户端
	public static final String XXH_COMPUTETYPE = "E036";//计算类型
	public static final String XXH_COMPUTEMEMO = "E037";//计算类型标注
	public static final String XXH_PAYMOMENT = "E038";//缴费时机
	public static final String XXH_PAYOBJECT = "E039";//缴费对象
	/**电子签章是否打开查询条件Key*/
	public static final String XXH_ISSIGN_KEY = "sign_config";//电子签章是否打开查询条件Key
	/**电子签章是否打开查询条件list*/
	public static final String XXH_ISSIGN_LIST = "signature";//电子签章是否打开查询条件list
	/**电子签章是否打开 查询数据库获得json对象的key值*/
	public static final String XXH_ISSIGN_JSON_KEY = "switch";//电子签章是否打开查数据库json对象的key值
	
	public static final String XHH_PRJ_TYPE = "E132";//项目类型
	public static final String XHH_REPAY_TYPE = "E004";//还款方式
	public static final String XHH_ACTIVITY_STATUS = "A011";//活动状态
	public static final String XHH_STATUS = "A010";//活动启用状态
	public static final String XHH_FULL_SCALE_REMIND_MOBILE = "D001"; //快满标 短信提醒电话
	public static final String XHH_NOTIC_URL = "D002"; //公告管理URL生成
	
	//常用数字字符串
	public static final String NUMBER_0 = "0";
	public static final String NUMBER_1 = "1";
	public static final String NUMBER_2 = "2";
	public static final String NUMBER_3 = "3";
	public static final String NUMBER_4 = "4";
	public static final String NUMBER_5 = "5";
	public static final String NUMBER_6 = "6";
	public static final String NUMBER_7 = "7";
	public static final String NUMBER_8 = "8";
	public static final String NUMBER_9 = "9";
	/**逾期风险提醒邮件*/
	public static final String EMAIL_ODR = "ODR";
	/**逾期代偿成功提醒邮件*/
	public static final String EMAIL_ODP = "ODP";
	/**银行*/
	public static final String XHH_BANK_TYPE = "E009";
	/**逾期申请方式*/
	public static final String XHH_OVERDUE_TYPE = "E133";
	/**逾期审核状态*/
	public static final String XHH_OVERDUE_STATUS = "E134";
	/**邮件类型*/
	public static final String XHH_EMAIL_TYPE = "E135";
	/**项目逾期提醒邮件*/
	public static final String EMAIL_ODEDR = "ODEDR";
	/**充值类型*/
	public static final String XHH_PAY_TYPE = "E112";
	/**渠道状态*/
	public static final String XHH_CHANNEL_STATUS = "E142";
	/**短信类型*/
	public static final String XHH_SMS_CONFIG = "E144";
	/**用户冻结原因*/
	public static final String XHH_USER_FREEEZE_REASON = "E155"; 
	
	public static final Byte LOAN_FLOW_STATUS_1 = 1;//待审核
	public static final Byte LOAN_FLOW_STATUS_2 = 2;//审核中
	public static final Byte LOAN_FLOW_STATUS_3 = 3;//已支付
	public static final Byte LOAN_FLOW_STATUS_4 = 4;//作废
	public static final String LOAN_APPLY_FLOW = "P0002";//放款审批流程
	public static final String NOTICE_USER_OPER_TYPE = "2";// 为2是通知放款完成

	public static final String XHH_RATE_TYPE = "E003";/**利率类型*/
	
	public static final String XHH_USE_NO = "E137";/**是否可用*/
	
	public static final String XHH_REWARD_ACTION = "E138";/**奖励活动节点*/

	public static final String XHH_ACTION_PROJECT = "E139";/**用户项目*/
	
	public static final String XHH_REWARD_MONEY_TYPE = "E140";/**红包奖励金额类型*/
	
	/*****************队列状态*********************/
	  /**待插入队列*/
    public static final String QUE_STATUS_INSERTING = "1";
    /**待处理队列*/
    public static final String QUE_STATUS_PENDING = "2";
    /**队列成功*/
    public static final String QUE_STATUS_SUCCESS = "3";
    /**队列失败*/
    public static final String QUE_STATUS_FAILED = "4";
    /**最多执行次数*/
    public static final Integer MAX_PROCESS_TIME = 3;
    
    
    /***************奖励金额***********************/
    
    public static final Map<Integer,BigDecimal> REWARD_AMOUNT_LIST =new HashMap<Integer,BigDecimal>();
    public static final BigDecimal COMMON_MONEY = new BigDecimal(2000);
    public static final BigDecimal ORG_MONEY= new BigDecimal(3000);
    static{
    	REWARD_AMOUNT_LIST.put(0,COMMON_MONEY);
    	REWARD_AMOUNT_LIST.put(1,ORG_MONEY);
    }
    
    /**通过摇一摇分享形式获取*/
    public static final Integer BONUS_FROM_TYPE_YAOYIYAO = 1; 
    /**通过摇一摇分享形式id(由于一个用户只有一条记录，在摇一摇红包中)*/
    public static final Integer  BONUS_FROM_ID_YAOYIYAO = 0; 
    /**红包有效时间 */
    public static final Date  BONUS_END_DATE = DateTimeUtil.getStringToDate("2015-10-01 23:59:59"); 
    
    
    /**市场红包*/
    public static final Integer OBJ_TYPE_SHAKE = 1; //日志类型 摇一摇
    public static final Integer OBJ_TYPE_INVEST = 2; // 投资类型
    
    /**摇一摇**/     
    public static final Integer ACTIVITY_TYPE_YAOYIYAO = 1; 
    /** 注册红包*/
    public static final Integer ACTIVITY_TYPE_REG_HONGBAO = 2; 
    /**yq付红包*/
    public static final Integer ACTIVITY_TYPE_IS_QFX = 3;

    /**页码*/
    public static final Integer PAGE_SIZE = 10;
    
    /**记录的类型*/
    public static final Integer TYPE_INCOME = 1;//收入
    public static final Integer TYPE_CONSUME = 2;//支出
    
    
    //状态，一般是根据时间的有效期跑批量update的
    public static final Integer STATUS_DISENABLE = 0;//禁用
    public static final Integer STATUS_ACTIVE = 1;//激活
    public static final Integer STATUS_INVALID = 2;//失效 
    public static final Integer STATUS_TMP = 3;//临时记录
    
    /***短信、站内信、推送的mtype的值*/
    public static final Integer PUSH_MTYPE = 134; 
    /***注册自动触发*/
    public static final Integer HOOK_TYPE_REG = 1; 
    /**运营平台触发*/
    public static final Integer HOOK_TYPE_YUNXING = 2; 
    /**常见问题类型*/
    public static final String XXH_HELPQUESTION_TYPE = "E014";
    
    //消息推送 KEY
    public static final String KEY_HOT_ACTIVITY = "INVEST.HOT_ACTIVITY";
    //小喇叭 系统公告
    public static final String KEY_NOTICE = "INVEST.NOTICE";
    //媒体报道
    public static final String KEY_DISCOVERY_REPORT = "DISCOVERY.INVESTOR_RELATIONS.REPORT";
    //平台公告
    public static final String KEY_DISCOVERY_NOTICE = "DISCOVERY.INVESTOR_RELATIONS.NOTICE";
    //最新动态
    public static final String KEY_DISCOVERY_INFORMATION = "DISCOVERY.INVESTOR_RELATIONS.INFORMATION";
    //系统通知
    public static final String KEY_DISCOVERY_SYSNOTICE = "DISCOVERY.INVESTOR_RELATIONS.SYSNOTIFY";
    
    
    /** 借款状态*/
	public static final String UWC_TENANT_AUDIT_STATUS = "C006";
	
	public static final String UWC_TENANT_AUDIT_STATUS_1="1";//待审核
	public static final String UWC_TENANT_AUDIT_STATUS_2="2";//审核失败
	public static final String UWC_TENANT_AUDIT_STATUS_3="3";//审核成功
	public static final String UWC_TENANT_AUDIT_STATUS_4 = "4";//募集中
	public static final String UWC_TENANT_AUDIT_STATUS_5 = "5";//正常还款中
	public static final String UWC_TENANT_AUDIT_STATUS_6 = "6";//逾期
	public static final String UWC_TENANT_AUDIT_STATUS_7 = "7";//已结束
	
	/** 借款来源平台：*/
	public static final String UWC_TENANT = "C007";
	
	public static final String UWC_TENANT_YUNTAO="yuntao";//云淘
	public static final String UWC_TENANT_WAP="wap";//微信wap端
	public static final String UWC_TENANT_DK="dk";//代扣端
	
	/** 代扣repayInfo表状态配置字典项*/
	public static final String UWC_TENANT_REPAY_STATUS = "E161";
	
	public static final String UWC_TENANT_REPAY_STATUS_0 = "0";//未开始
	public static final String UWC_TENANT_REPAY_STATUS_1 = "1";//正常还款中
	public static final String UWC_TENANT_REPAY_STATUS_2 = "2";//已结束
	public static final String UWC_TENANT_REPAY_STATUS_3 = "3";//逾期
	
	/** 银行卡类型*/
	public static final String BORROWER_BANKCARD_TYPE = "C008";
	
	public static final String BORROWER_BANKCARD_TYPE_1="DEBITCARD";//借记卡
	public static final String BORROWER_BANKCARD_TYPE_2="CREDITCARD";//信用卡
	
	/** 借款平台还款方式*/
	public static final String UWC_TENANT_REPAYTYPE = "E004";
	/**借款产品类型*/	
	public static final String UWC_TENANT_PRODUCT_TYPE = "E005";
	
	
	public static final String UWC_TENANT_REPAYTYPE_1= "permonth";// 每月等额本息 ,按月还款
	
	//扣款短信
	public static final String PAY_SUCCESS_COMPLETE = "您在投融家的借款{1}在{2}成功还款{3}元，本期还款已还清。";
	public static final String PAY_SUCCESS_UNCOMPLETE = "您在投融家的借款{1}在{2}成功还款{3}元。";

	public static final String PAY_SUCCESS_PART = "您在投融家的借款{1}在{2}成功还款{3}元，实际应还{4}元,剩余{5}元未还。今日未还清将按天对未还本金计算罚息";
	
	public static final String PAY_FAIL = "您在投融家的借款{1}在{2}成功还款0.00元,实际应还{3}元，剩余{3}元未还。今日未还清将按天对未还本金计算罚息。";
	//扣款提醒短信
	public static final String REPAY_NOTIFY = "您在投融家的借款{1}第{2}期需还{3}元，还款日为{4}，请提前将资金转入绑定银行卡中。注：到期未还将按天计算罚息。";

	public static final String REPAY_RECORD_STATUS = "E162"; 
	
	public static final String REPAY_RECORD_STATUS_1 = "1";//下单成功
	public static final String REPAY_RECORD_STATUS_2 = "2";//下单失败
	public static final String REPAY_RECORD_STATUS_3 = "3";//支付成功
	public static final String REPAY_RECORD_STATUS_4 = "4";//支付失败
	public static final String REPAY_RECORD_STATUS_5 = "5";//收到回复
	//借款类型
	public static final String CONTRACT_BORROW = "1";
	public static final String FINANCING_BORROW = "0";
	
	//代扣业务用到的字典项配置由此结束
    
	//预期代偿登记  审核状态
	public static final String OVERDUE_AUDIT_STATUS = "E163";
	public static final String OVERDUE_AUDIT_STATUS_WAIT = "0"; //待审核
	public static final String OVERDUE_AUDIT_STATUS_PASS = "1"; //审核通过
	public static final String OVERDUE_AUDIT_STATUS_FAIL = "2"; //审核不通过
}
