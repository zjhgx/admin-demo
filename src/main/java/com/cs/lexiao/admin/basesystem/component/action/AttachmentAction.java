package com.cs.lexiao.admin.basesystem.component.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

//import com.upg.xhh.banner.core.IAttachService;
//import com.cs.lexiao.admin.mapping.business.FiAttach;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cs.lexiao.admin.basesystem.component.core.IAttachmentService;
import com.cs.lexiao.admin.factory.DynamicPropertyTransfer;
import com.cs.lexiao.admin.framework.base.BaseAction;
import com.cs.lexiao.admin.framework.base.SessionTool;
import com.cs.lexiao.admin.mapping.basesystem.other.Attachment;

import net.sf.json.JSONObject;

/**
 * 附件
 * 
 * @author shentuwy
 * @date 2012-6-29
 * 
 */
public class AttachmentAction extends BaseAction {

	private static final long	serialVersionUID	= 2718945693717757249L;

	private static Logger		log					= LoggerFactory.getLogger(AttachmentAction.class);

	private File				fileInput;

	private String				fileName;

	private String				contentType;

	private String				charset				= IAttachmentService.CHARSET_UTF8;

	private boolean				imgServer;

	private String				nowater;
	
	private String				fileTypeExt;
	
	private Attachment			attachment;

	private IAttachmentService	attachmentService;

//	private IAttachService attachService;
//	
//	private IFiAttachDao fiAttachDao;
    //  kindEditor中上传图片的file name
	private File imgFile;
	
//	public IFiAttachDao getFiAttachDao() {
//		return fiAttachDao;
//	}
//
//	public void setFiAttachDao(IFiAttachDao fiAttachDao) {
//		this.fiAttachDao = fiAttachDao;
//	}

	public void setFileInput(File fileInput) {
		this.fileInput = fileInput;
	}

	public void setFileInputFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileInputFileName() {
		return this.fileName;
	}

	public void setFileInputContentType(String contextType) {
		this.contentType = contextType;
	}

	public String getCharset() {
		return charset;
	}

	public void setCharset(String charset) {
		this.charset = charset;
	}

	public void setAttachmentService(IAttachmentService attachmentService) {
		this.attachmentService = attachmentService;
	}

	public Attachment getAttachment() {
		return attachment;
	}

	public void setAttachment(Attachment attachment) {
		this.attachment = attachment;
	}

	public void setImgServer(boolean imgServer) {
		this.imgServer = imgServer;
	}
	
	public String getNowater() {
		return nowater;
	}

	public void setNowater(String nowater) {
		this.nowater = nowater;
	}
	
	public String getFileTypeExt() {
		return fileTypeExt;
	}

	public void setFileTypeExt(String fileTypeExt) {
		this.fileTypeExt = fileTypeExt;
	}

//	public IAttachService getAttachService() {
//		return attachService;
//	}
//
//	public void setAttachService(IAttachService attachService) {
//		this.attachService = attachService;
//	}

	public IAttachmentService getAttachmentService() {
		return attachmentService;
	}


	// ================================================
	

	private static final String DOWNLOAD = "download";

	public String main() {
		return MAIN;
	}

	public String upload() {
		log.debug("imgServer:" + imgServer + ",doc:" + fileInput + ",fileName:" + fileName + ",contentType:"
				+ contentType);
		Attachment attachment = attachmentService.save(fileInput, fileName, imgServer, nowater, fileTypeExt);
		attachment = (Attachment) DynamicPropertyTransfer.dynamicAddProperty(attachment, "userName", SessionTool
				.getUserLogonInfo().getUserName());
		return setInputStreamData(attachment);
	}

	public String downLoad() {
		String attachId = getId();
		if (StringUtils.isNotBlank(attachId)) {
			Attachment attachment = attachmentService.getById(Long.valueOf(attachId));
			try {
				getHttpResponse().setContentType("application/json");
				getHttpResponse().setHeader("Access-Control-Allow-Origin", "*");
				InputStream in = null;
				fileName = URLEncoder.encode(attachment.getName(), IAttachmentService.CHARSET_UTF8);
				//( ) 括号没办法转义回来,所以遇到( )将不转义
				fileName = decodeBrackets(fileName);
				if ("2".equals(attachment.getUploadType())) {
					URL url = new URL("http://" + attachment.getDomain() + "/" + attachment.getAttachPath() + attachment.getSaveName());
					in = url.openStream();
				} else {
					in = new FileInputStream(attachmentService.getFullFilePath(attachment.getAttachPath(),
						attachment.getSaveName()));
				}
				setDataStream(in);
			} catch (Exception e) {
				log.error(e.getMessage(), e);
				throw new RuntimeException(e.getMessage());
			} finally {

			}
		}
		return DOWNLOAD;
	}

	public String downloadImgServerFile() {
		try {
			String imgPath="";
			if(attachment==null){
				String attachId = getId();
				if (StringUtils.isNotBlank(attachId)) {
//					FiAttach fiAttach=attachService.getFiAttachById(Long.parseLong(attachId));
//					imgPath="http://"+fiAttach.getImgserver()+fiAttach.getSaveapppath()+fiAttach.getSavename();
				}
			}else{
				fileName = URLEncoder.encode(attachment.getName(), IAttachmentService.CHARSET_UTF8);
				imgPath=attachmentService.getFullFilePath(attachment.getAttachPath(),attachment.getSaveName(),true);
			}
			URL url = new URL(imgPath);
			InputStream in = url.openStream();
			setDataStream(in);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new RuntimeException(e.getMessage());
		} finally {
			
		}
		return DOWNLOAD;
	}

	public void delete() {
		String attachId = getId();
		if (StringUtils.isNotBlank(attachId)) {
			attachmentService.delete(Long.valueOf(attachId));
		}
	}
	
	/**
	 * 根据attachId删除FiAttach中的记录.
	 */
	public void remove() {
		String attachId = getId();
		if (StringUtils.isNotBlank(attachId)) {
//			fiAttachDao.delete(Long.valueOf(attachId));
		}
	}

	public String getAttachments() {
		List<Attachment> attachList = new ArrayList<Attachment>();
		List<Long> attachIds = getIdList();
		if (attachIds != null && attachIds.size() > 0) {
			for (Long attId : attachIds) {
				Attachment attachment = attachmentService.getById(attId);
				if (attachment != null) {
					attachList.add(attachment);
				}
			}
		}
		return setInputStreamData(attachList);
	}
	//  kindeiditor上传图片
	public String kindEditorImgUpLoad(){
		 MultiPartRequestWrapper wrapper = (MultiPartRequestWrapper)getHttpRequest();  
         // 获得图片名字  
         String imgName = wrapper.getFileNames("imgFile")[0];  
         Attachment attachment = attachmentService.save(imgFile, imgName, true, "1", "1");
         System.out.println(attachment.getSaveName());
         try {
         BufferedImage sourceImg =ImageIO.read(new FileInputStream(imgFile));
 		JSONObject object = new JSONObject();
 		object.put("error", 0);
 		//object.put("width", sourceImg.getWidth()+"px");
 		//object.put("height", sourceImg.getHeight()+"px");
 		object.put("url", "http://"+attachment.getDomain()+attachment.getAttachPath()+"s700_"+attachment.getSaveName());
 			getHttpResponse().getWriter().println(object.toString());
 		} catch (IOException e) {
 			e.printStackTrace();
 		}
 		return null;
	}

	public File getImgFile() {
		return imgFile;
	}

	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}
	
	/**
	 * 遇到()括号的时候转义都有问题
	 * @string 转义后的字符
	 * @return
	 */
	private String decodeBrackets(String string){
		string = string.contains("%28") ? string.replaceAll("%28", "(") : string;
		string = string.contains("%29") ? string.replaceAll("%29", ")") : string;
		return string;
	}
}
