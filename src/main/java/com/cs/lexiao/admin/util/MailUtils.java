/*
 * 源程序名称: MailUtils.java 
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: UPG业务服务平台(UBSP)
 * 模块名称：发送邮件工具类
 * 
 */

package com.cs.lexiao.admin.util;

import java.util.Date;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.apache.log4j.Logger;

import com.cs.lexiao.admin.basesystem.UcarsHelper;

public class MailUtils {
	private static Logger logger = Logger.getLogger(MailUtils.class);
	private static String charSet = "utf-8";
	private final static String OVERDUE_AUDIT_PASS_TEMPLET = "overdueAuditPassTemplet.html";
	private final static String OVERDUE_PRJ_LIST_TEMPLET = "overduePrjListTemplet.html";
	private final static String COMMON_OVERDUE_TEMPLET = "commonOverdueTemplet.html"; 
	private final static String UBSP_PRJ_CHANGE_TEMPLET = "ubspPrjChangeTemplet.html";
	private final static String EMAIL_SMTPSERVER = "mail.upg.cn";
	private final static String EMAIL_FROM = "xhhadmin@upg.cn";
	private final static String EMAIL_USER_NAME = "xhhadmin";
	private final static String EMAIL_USER_PASSWORD = "youyuhaha";
	
 	
	public static enum MailPriorityLevel{
		
		HIGHEST(1),HIGH(2),NORMAL(3),LOW(4),LOWEST(5);
		
		private int level = 3;
		
		private MailPriorityLevel(int level){
			this.level = level;
		}
		
		
		public int getLevel(){
			return level;
		}
		
	};
	

	public static void setCharSet(String charSet) {
		MailUtils.charSet = charSet;
	}

	public static boolean send(String smtpServer, String from, String username,
			String password, String address, String subject, String content) {
		return send(smtpServer, from, username, password, address, subject,
				content, null, null);
	}

	public static boolean send(String smtpServer, String from, String username,
			String password, String address, String subject, String content,
			String[] attachs) {
		return send(smtpServer, from, username, password, address, subject,
				content, attachs, null);
	}
	
	public static boolean send(String smtpServer, String from, String username,
			String password, String address, String subject, String content,
			String[] attachs, String mimeType,MailPriorityLevel level) {
		
		//shentuwy,去掉发邮件功能
		if (true) {
			return true;
		}
		
		if (mimeType == null) {
			mimeType = "text/plain; charset=" + charSet;
		} else {
			mimeType = mimeType + "; charset=" + charSet;
		}

		Properties props = new Properties();
		props.put("mail.smtp.host", smtpServer);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(props, new MyAuthenricator(
				username, password));
		String[] addrs = address.split(",");
		InternetAddress[] toAddess = new InternetAddress[addrs.length];
		for(int i=0;i<addrs.length;i++){
			try {
				toAddess[i] = new InternetAddress(addrs[i]);
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		MimeMessage message = new MimeMessage(session);
		try {
			if (level != null) {
				message.addHeader("X-Priority", String.valueOf(level.getLevel()));
			}
			message.setSentDate(new Date());
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, toAddess);
			message.setSubject(subject);

			if ((attachs != null) && (attachs.length != 0)) {
				MimeMultipart mimeMultipart = new MimeMultipart();
				MimeBodyPart mimeBodyPart = new MimeBodyPart();
				mimeBodyPart.setContent(content, mimeType);
				mimeMultipart.addBodyPart(mimeBodyPart);

				for (int i = 0; i < attachs.length; ++i) {
					MimeBodyPart attachMBP = new MimeBodyPart();
					String[] addressAndTitle = attachs[i].split(";");
					FileDataSource fds = new FileDataSource(addressAndTitle[0]);
					attachMBP.setDataHandler(new DataHandler(fds));
					attachMBP.setFileName(MimeUtility.encodeWord(
							addressAndTitle[1], charSet, null));
					mimeMultipart.addBodyPart(attachMBP);
				}
				message.setContent(mimeMultipart);
			} else {
				message.setContent(content, mimeType);
			}
			Transport.send(message);
		} catch (Exception e) {
			logger.error("Could not send mail", e);
			return false;
		}

		return true;
	}
	
	
	public static boolean send(String smtpServer, String from, String username,
			String password, String address, String subject, String content,
			String[] attachs, String mimeType) {
		return send(smtpServer, from, username, password, address, subject, content, attachs, mimeType, null);
	}

	static class MyAuthenricator extends Authenticator {
		String username = null;
		String password = "";

		public MyAuthenricator(String username, String password) {
			this.username = username;
			this.password = password;
		}

		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(username, password);
		}
	}

	public static void main(String[] args) {
		System.out.println(send(EMAIL_SMTPSERVER, EMAIL_FROM, EMAIL_USER_NAME,
				EMAIL_USER_PASSWORD, "renzhuolun@upg.cn,caixinning@upg.cn", "test", "欢迎您"));
	}

	public static void sendEmailToCustManager(String email,String subject, Map<String, Object> parameterMap) {
		String file = OVERDUE_AUDIT_PASS_TEMPLET;
		String content = UcarsHelper.getFreeMarkerTemplateEngine().generateContent(file, parameterMap);
		send(EMAIL_SMTPSERVER, EMAIL_FROM, EMAIL_USER_NAME,
				EMAIL_USER_PASSWORD,email,subject,content, null, "text/html");
	}
	/**
	 * 发送逾期风险提示邮件
	 * @author cxn
	 * @date 2015年5月27日 下午8:10:58
	 */
	public static void sendOverduePrjList(String email,String subject, Map<String, Object> parameterMap){
		String content = UcarsHelper.getFreeMarkerTemplateEngine().generateContent(OVERDUE_PRJ_LIST_TEMPLET, parameterMap);
		send(EMAIL_SMTPSERVER, EMAIL_FROM, EMAIL_USER_NAME,
				EMAIL_USER_PASSWORD,email,subject,content, null, "text/html");		
	}
	/**
	 * 通用邮件处理<br>
	 * parameterMap中的参数
	 * @author cxn
	 * @date 2015年6月1日 上午10:47:27
	 */
	public static void sendCommonOverdueEmail(String email,String subject, Map<String, Object> parameterMap){
		String content = UcarsHelper.getFreeMarkerTemplateEngine().generateContent(COMMON_OVERDUE_TEMPLET, parameterMap);
		send(EMAIL_SMTPSERVER, EMAIL_FROM, EMAIL_USER_NAME,
				EMAIL_USER_PASSWORD,email,subject,content, null, "text/html");		
	}

	
	 
		
		/**
		 * ubsp项目变更邮件通知
		 * @param email
		 * @param subject
		 * @param parameterMap
		 */
		public static void sendUbspPrjChangeEmail(String email,String subject, Map<String, Object> parameterMap) {
			String content = UcarsHelper.getFreeMarkerTemplateEngine().generateContent(UBSP_PRJ_CHANGE_TEMPLET, parameterMap);
			send("mail.upg.cn", "xhhadmin@upg.cn","xhhadmin","youyuhaha",email,subject,content, null, "text/html");
		}
	
	/**
	 * 工作流发送邮件
	 * @author renzhuolun
	 * @date 2015年9月6日 下午4:40:34
	 * @param email
	 * @param subject
	 * @param content
	 */
	public static void sendHtmlMail(String email, String subject, String content) {
		send(EMAIL_SMTPSERVER, EMAIL_FROM, EMAIL_USER_NAME,
				EMAIL_USER_PASSWORD,email,subject,content, null, "text/html");		
	}	 
	
	 
}
