//package com.cs.lexiao.admin.basesystem.component.core;
//
//import java.io.File;
//import java.io.FileOutputStream;
//import java.io.InputStream;
//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.HashSet;
//import java.util.List;
//import java.util.Properties;
//import java.util.Set;
//
//import javax.annotation.Resource;
//
//import net.sf.json.JSONObject;
//
//import org.apache.commons.io.FileUtils;
//import org.apache.commons.lang.StringUtils;
//import org.apache.http.HttpEntity;
//import org.apache.http.NameValuePair;
//import org.apache.http.client.entity.UrlEncodedFormEntity;
//import org.apache.http.client.methods.CloseableHttpResponse;
//import org.apache.http.client.methods.HttpPost;
//import org.apache.http.entity.mime.MultipartEntityBuilder;
//import org.apache.http.impl.client.CloseableHttpClient;
//import org.apache.http.impl.client.HttpClients;
//import org.apache.http.message.BasicNameValuePair;
//import org.apache.http.util.EntityUtils;
//import org.jdom.Document;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import com.google.gson.reflect.TypeToken;
//import com.cs.lexiao.admin.factory.DynamicPropertyTransfer;
//import com.cs.lexiao.admin.framework.annotation.Service;
//import com.cs.lexiao.admin.framework.base.BaseService;
//import com.cs.lexiao.admin.framework.base.SessionTool;
//import com.cs.lexiao.admin.mapping.basesystem.other.Attachment;
//import com.cs.lexiao.admin.mapping.basesystem.security.Buser;
//import com.cs.lexiao.admin.util.CompressUtil;
//import com.cs.lexiao.admin.util.JsonUtils;
//import com.cs.lexiao.admin.util.PropertyTransVo;
//import com.cs.lexiao.admin.util.SourceTemplate;
//import com.cs.lexiao.admin.util.StringUtil;
//import com.cs.lexiao.admin.util.XmlUtil;
//import com.cs.lexiao.admin.mapping.business.prj.FiAuditRecord;
//import com.cs.lexiao.admin.mapping.business.prj.FiCorpMaterial;
//import com.upg.xhh.prj.core.IFiAuditRecordDao;
//import com.upg.xhh.prj.core.IFiCorpMaterialDao;
//import com.upg.xhh.util.GsonUtil;
//import com.upg.xhh.util.HttpRequestUtil;
//import com.upg.xhh.util.UtilConstant;
//
///**
// * 附件服务实现
// * 
// * @author shentuwy
// * @date 2012-6-30
// * 
// */
//@Service
//public class AttachmentServiceImpl extends BaseService implements IAttachmentService {
//
//	private static Logger			log						= LoggerFactory.getLogger(AttachmentServiceImpl.class);
//	private static String			attachmentFilePath		= null;
//
//	private static String			compressTempDir			= null;
//	/**文件服务器地址*/
//	private static String			imgServerUrl			= null;
//	/**图片文件上传接口*/
//	private static String			imgServerUpload			= null;
//
//	private static String			imgServerMoveFile		= null;
//
//	private static String			imgServerRelativePath	= "/data/xhhadmin/";
//	/**媒体文件上传接口*/
//	private static String			mediaServerUpload		= null;
//
//	private static Set<String>		PICTURE_NAME_EXT		= new HashSet<String>();
//	
//	private static final DateFormat	DATE_YEAR_FORMAT		= new SimpleDateFormat("yyyy");
//	private static final DateFormat	DATE_MONTH_DAY_FORMAT	= new SimpleDateFormat("MMdd");
//	
//	
//	private static String			soundServerUpload		= null;
//	
//	private static String			fileServerUpload		= null;
//
//	@Autowired
//	private IAttachmentDao			attachmentDao;
//	@Resource
//	private IFiAuditRecordDao 	    fiAuditRecordDao;
//	@Resource
//	private IFiCorpMaterialDao      fiCorpMaterialDao;
//
//	
//	static {
//		init();
//	}
//
//	private static final void init() {
//		try {
//			
//			PICTURE_NAME_EXT.add("gif");
//			PICTURE_NAME_EXT.add("jpg");
//			PICTURE_NAME_EXT.add("png");
//			PICTURE_NAME_EXT.add("jpeg");
//			PICTURE_NAME_EXT.add("bmp");
//			
//			Document doc = XmlUtil.parseXmlDoc("attachment-config.xml");
//			attachmentFilePath = doc.getRootElement().getChild("filePath").getValue();
//			compressTempDir = doc.getRootElement().getChild("temp").getValue();
//			checkFilePath(attachmentFilePath);
//			checkFilePath(compressTempDir);
//			imgServerUrl = doc.getRootElement().getChild("imgServerUrl").getValue();
//			imgServerUpload = doc.getRootElement().getChild("imgServerUpload").getValue();
//			imgServerMoveFile = doc.getRootElement().getChild("imgServerMoveFile").getValue();
//			String relativePath = doc.getRootElement().getChild("imgServerRelativePath").getValue();
//			
//			mediaServerUpload = doc.getRootElement().getChild("mediaServerUpload").getValue();
//			soundServerUpload = doc.getRootElement().getChild("soundServerUpload").getValue();
//			fileServerUpload = doc.getRootElement().getChild("fileServerUpload").getValue();
//			
//			if (relativePath != null) {
//				imgServerRelativePath = relativePath;
//			}
//			log.info("attachment file path:" + attachmentFilePath + ",compressTempDir:" + compressTempDir);
//		} catch (Exception e) {
//			log.error(e.getMessage(), e);
//			throw new RuntimeException(e.getMessage(), e);
//		}
//	}
//
//	private static final void checkFilePath(String str) {
//		File file = new File(str);
//		if (!file.exists()) {
//			if (!file.mkdirs()) {
//				throw new RuntimeException(str + " can't created");
//			}
//		}
//		if (file.isFile()) {
//			throw new RuntimeException(str + " is not file,need to direction");
//		}
//		if (!file.canWrite()) {
//			throw new RuntimeException(str + " can't be writed");
//		}
//	}
//
//	private String xhhMoveImg(String arrFiles,String nowater) throws Exception {
//		String result = null;
//
//		CloseableHttpResponse response = null;
//		try {
//			// 移动
//			CloseableHttpClient httpClient = HttpClients.createDefault();
//			HttpPost httpPost = new HttpPost(imgServerUrl + imgServerMoveFile);
//			List<NameValuePair> nvp = new ArrayList<NameValuePair>();
////			nvp.add(new BasicNameValuePair("is_thumb", "1"));
//			nvp.add(new BasicNameValuePair("nowater", nowater));
//			nvp.add(new BasicNameValuePair("arr_files", arrFiles));
//			nvp.add(new BasicNameValuePair("type", "img"));
//			httpPost.setEntity(new UrlEncodedFormEntity(nvp, CHARSET_UTF8));
//
//			response = httpClient.execute(httpPost);
//			HttpEntity entity = response.getEntity();
//			result = EntityUtils.toString(entity, "UTF-8");
//
//			EntityUtils.consume(entity);
//
//		} finally {
//			if (response != null) {
//				response.close();
//			}
//
//		}
//
//		return result;
//	}
//
//	private String xhhUploadImg(File file, String fileTypeExt) throws Exception {
//
//		String result = null;
//		CloseableHttpResponse response = null;
//		try {
//
//			String filePath = generatorFilePath().replaceAll("\\\\", "/");
//			filePath = imgServerRelativePath + filePath + "/";
//
//			CloseableHttpClient httpClient = HttpClients.createDefault();
//			
//			String uploadUrl = fileServerUpload;
//			
//			if ("1".equals(fileTypeExt)) {
//				uploadUrl =imgServerUpload;
//			}
//			if ("3".equals(fileTypeExt)) {
//				uploadUrl =mediaServerUpload;
//			}
//			if ("4".equals(fileTypeExt)) {
//				uploadUrl =soundServerUpload;
//			}
//
//			HttpPost httpPost = new HttpPost(imgServerUrl + uploadUrl);
//
//			MultipartEntityBuilder builder = MultipartEntityBuilder.create();   
//			builder.addBinaryBody("file", file);
//			httpPost.setEntity(builder.build());
//
//			response = httpClient.execute(httpPost);
//			HttpEntity entity = response.getEntity();
//			result = EntityUtils.toString(entity, "UTF-8");
//			// Map imgMap = (Map) JsonUtils.string2Object(result,
//			// HashMap.class);
//			// if (!"1".equals("" + imgMap.get("boolen"))) {
//			// throw new
//			// RuntimeException(String.valueOf(imgMap.get("message")));
//			// }
//			EntityUtils.consume(entity);
//		} finally {
//			if (response != null) {
//				response.close();
//			}
//		}
//		return result;
//	}
//	public Attachment save(File file, String fileName, boolean imgServer, String nowater, String fileTypeExt) {
//		Attachment ret = save(file, fileName);;
//		String ext = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
//		String isSupported = "0";
////		StringBuilder type = new StringBuilder();
//		List<String> extList = generateExtList(fileTypeExt);
//		
//		if (UtilConstant.NUMBER_1.equals(fileTypeExt) && imgServer && extList.contains(ext)) { //只有图片才会上传到xxx图片服务器
//			isSupported = "1";
//			if (ret != null) {
//				try {
//					File tempFile = new File(getFullFilePath(ret.getAttachPath(), ret.getSaveName()));
//					String updateImgResult = xhhUploadImg(tempFile,fileTypeExt);
//					log.info(">>>>>>>>>>>>>>>>>>>>>>>updateImgResult的值为:"+updateImgResult+"<<<<<<<<<<<<<<<<<<<<");
//					JSONObject imgJO = JSONObject.fromObject(updateImgResult);
//					if (!UtilConstant.NUMBER_1.equals("" + imgJO.getString("boolen"))) {
//						log.error("fileName:" + fileName + ",上传到图片服务器失败，" + updateImgResult);
//						throw new RuntimeException(imgJO.getString("message"));
//					}
//					
//					String arrFiles = imgJO.getString("result");
//					String moveResult = xhhMoveImg(arrFiles,nowater); 
//					if (StringUtils.isBlank(moveResult)) {
//						log.error("fileName:" + fileName + ",移动图片服务调用失败，" + moveResult);
//						throw new RuntimeException("移动图片服务调用失败");
//					}
//					
//					JSONObject attachJO = JSONObject.fromObject(imgJO.getString("attach"));
//					String domain = attachJO.getString("imgserver");
//					
//					String[] moveFileArray = moveResult.split(":");
//					
//					String moveFile1 =  moveFileArray[1].replaceAll("\\\\|\"", "");
//					
//					int ind = moveFile1.lastIndexOf("/");
//					
//					String newFileName = moveFile1.substring(ind+1);
//					String filePath = moveFile1.substring(0,ind+1);
//
//					ret = new Attachment();
//					ret.setName(fileName);
//					ret.setSaveName(newFileName);
//					ret.setAttachPath(filePath);
//					ret.setAttachSize(file.length());
//					if (SessionTool.getUserLogonInfo() != null) {
//						ret.setCreator(SessionTool.getUserLogonInfo().getSysUserId());
//					}
//					ret.setXhhResult(moveResult.replaceAll("\\\\|\"", ""));
//					ret.setUploadType("2");
//					if (log.isDebugEnabled()) {
//						log.debug(JsonUtils.objectToJsonString(ret));
//					}
//					ret.setDomain(domain);
//					attachmentDao.save(ret);
//					ret = (Attachment) DynamicPropertyTransfer.dynamicAddProperty(ret, "isSupported","1");
//							
//				} catch (Exception e) {
//					log.error(e.getMessage(), e);
//					ret = null;
//				}
//			}
//		}else if(UtilConstant.NUMBER_3.equals(fileTypeExt)){
//			try {
//				File tempFile = new File(getFullFilePath(ret.getAttachPath(), ret.getSaveName()));
//				String updateFileResult = xhhUploadMedia(tempFile);
//				JSONObject jo = JSONObject.fromObject(updateFileResult);
//				log.info(">>>>>>>>>>>>>>>>>>>>>>>updateFileResult的值为:"+updateFileResult+"<<<<<<<<<<<<<<<<<<<<");
//				if (!"1".equals("" + jo.getString("boolen"))) {
//					log.error("fileName:" + fileName + ",上传到文件服务器失败，" + updateFileResult);
//					throw new RuntimeException(jo.getString("message"));
//				}
//				JSONObject attach = JSONObject.fromObject(jo.getString("attach"));
//
//				ret = new Attachment();
//				ret.setName(fileName);
//				ret.setSaveName(attach.getString("savename"));
//				ret.setAttachPath(attach.getString("saveapppath"));
//				ret.setAttachSize(file.length());
//				ret.setDomain(attach.getString("imgserver"));
//				ret.setXhhResult(attach.getString("id")+":"+attach.getString("saveapppath")+attach.getString("savename"));
//				if (SessionTool.getUserLogonInfo() != null) {
//					ret.setCreator(SessionTool.getUserLogonInfo().getSysUserId());
//				}
//				ret.setUploadType("2");
//				if (log.isDebugEnabled()) {
//					log.debug(JsonUtils.objectToJsonString(ret));
//				}
//				attachmentDao.save(ret);
//			} catch (Exception e) {
//				log.error(e.getMessage(), e);
//				ret = null;
//			}
//		}else if(UtilConstant.NUMBER_4.equals(fileTypeExt)){
//			try {
//				File tempFile = new File(getFullFilePath(ret.getAttachPath(), ret.getSaveName()));
//				String updateFileResult = xhhUploadFile(tempFile);
//				JSONObject jo = JSONObject.fromObject(updateFileResult);
//				log.info(">>>>>>>>>>>>>>>>>>>>>>>updateFileResult的值为:"+updateFileResult+"<<<<<<<<<<<<<<<<<<<<");
//				if (!"1".equals("" + jo.getString("boolen"))) {
//					log.error("fileName:" + fileName + ",上传到文件服务器失败，" + updateFileResult);
//					throw new RuntimeException(jo.getString("message"));
//				}
//				JSONObject attach = JSONObject.fromObject(jo.getString("attach"));
//
//				ret = new Attachment();
//				ret.setName(fileName);
//				ret.setSaveName(attach.getString("savename"));
//				ret.setAttachPath(attach.getString("saveapppath"));
//				ret.setAttachSize(file.length());
//				ret.setDomain(attach.getString("imgserver"));
//				ret.setXhhResult(attach.getString("id")+":"+attach.getString("saveapppath")+attach.getString("savename"));
//				if (SessionTool.getUserLogonInfo() != null) {
//					ret.setCreator(SessionTool.getUserLogonInfo().getSysUserId());
//				}
//				ret.setUploadType("2");
//				if (log.isDebugEnabled()) {
//					log.debug(JsonUtils.objectToJsonString(ret));
//				}
//				attachmentDao.save(ret);
//			} catch (Exception e) {
//				log.error(e.getMessage(), e);
//				ret = null;
//			}
//		}else{
//			if (UtilConstant.NUMBER_2.equals(fileTypeExt)) {
//				Properties phpServer = (Properties) SourceTemplate.getBean("phpServer");
//				String compressedType = phpServer.getProperty("compressedType");
//				List<String> extTypeList = stringToList(compressedType);
//				if (extTypeList.contains(ext)) {
//					ret = (Attachment) DynamicPropertyTransfer.dynamicAddProperty(ret, "isSupported","1");
//				}else {
//					ret = (Attachment) DynamicPropertyTransfer.dynamicAddProperty(ret, "isSupported","0");
//				}
//			}else {
//				ret = (Attachment) DynamicPropertyTransfer.dynamicAddProperty(ret, "isSupported","0");
//			}
//		}
//		return ret;
//	}
//
//	public Attachment save(File file, String fileName) {
//		Attachment ret = null;
//		if (file != null) {
//			try { 
//				String filePath = generatorFilePath();
//				createFilePath(filePath);
//				String newFileName = generatorFileName(fileName);
//				String fullFileName = getFullFilePath(filePath, newFileName);
//				while (isFileExist(fullFileName)) {
//					newFileName = generatorFileName(fileName);
//					fullFileName = getFullFilePath(filePath, newFileName);
//				}
//				FileUtils.copyFile(file, new File(fullFileName));
//				ret = new Attachment();
//				ret.setName(fileName);
//				ret.setSaveName(newFileName);
//				ret.setAttachPath(filePath);
//				ret.setAttachSize(file.length());
//				if (SessionTool.getUserLogonInfo() != null) {
//					ret.setCreator(SessionTool.getUserLogonInfo().getSysUserId());
//				}
//				ret.setUploadType("1");
//				if (log.isDebugEnabled()) {
//					log.debug(JsonUtils.objectToJsonString(ret));
//				}
//				attachmentDao.save(ret);
//			} catch (Exception e) {
//				log.error(e.getMessage(), e);
//			}
//		}
//		return ret;
//	}
//	
//	private String xhhUploadMedia(File file) throws Exception {
//		String result = null;
//		CloseableHttpResponse response = null;
//		try {
//
//			String filePath = generatorFilePath().replaceAll("\\\\", "/");
//			filePath = imgServerRelativePath + filePath + "/";
//
//			CloseableHttpClient httpClient = HttpClients.createDefault();
//
//			HttpPost httpPost = new HttpPost(imgServerUrl + mediaServerUpload);
//
//			MultipartEntityBuilder builder = MultipartEntityBuilder.create();   
//			builder.addBinaryBody("file", file);
//			httpPost.setEntity(builder.build());
//
//			response = httpClient.execute(httpPost);
//			HttpEntity entity = response.getEntity();
//			result = EntityUtils.toString(entity, "UTF-8");
//			EntityUtils.consume(entity);
//		} finally {
//			if (response != null) {
//				response.close();
//			}
//		}
//		return result;
//	}
//
//	private String xhhUploadFile(File file) throws Exception {
//		String result = null;
//		CloseableHttpResponse response = null;
//		try {
//
//			String filePath = generatorFilePath().replaceAll("\\\\", "/");
//			filePath = imgServerRelativePath + filePath + "/";
//
//			CloseableHttpClient httpClient = HttpClients.createDefault();
//
//			HttpPost httpPost = new HttpPost(imgServerUrl + fileServerUpload);
//
//			MultipartEntityBuilder builder = MultipartEntityBuilder.create();
//			builder.addBinaryBody("file", file);
//			httpPost.setEntity(builder.build());
//
//			response = httpClient.execute(httpPost);
//			HttpEntity entity = response.getEntity();
//			result = EntityUtils.toString(entity, "UTF-8");
//			EntityUtils.consume(entity);
//		} finally {
//			if (response != null) {
//				response.close();
//			}
//		}
//		return result;
//	}
//	private static final void createFilePath(String filePath) {
//		if (StringUtils.isNotBlank(filePath)) {
//			File file = new File(attachmentFilePath + File.separator + filePath);
//			if (!file.exists()) {
//				file.mkdirs();
//			}
//		}
//	}
//
//	private static final boolean isFileExist(String filePath) {
//		boolean ret = false;
//		if (StringUtils.isNotBlank(filePath)) {
//			File file = new File(filePath);
//			ret = file.exists();
//		}
//		return ret;
//	}
//
//	public String getFullFilePath(String filePath, String fileName) {
//		String ret = attachmentFilePath;
//		if (StringUtils.isNotBlank(filePath)) {
//			ret += File.separator + filePath;
//		}
//		if (StringUtils.isNotBlank(fileName)) {
//			ret += File.separator + fileName;
//		}
//		return ret;
//	}
//
//	public String getFullFilePath(String filePath, String fileName, boolean imgServer) {
//		String ret = null;
//		if (imgServer) {
//			ret = imgServerUrl;
//			if (StringUtils.isNotBlank(filePath)) {
//				ret += filePath;
//			}
//			if (StringUtils.isNotBlank(fileName)) {
//				ret += fileName;
//			}
//		} else {
//			ret = getFullFilePath(filePath, fileName);
//		}
//		return ret;
//	}
//
//	public void delete(Long id) {
//		if (id != null) {
//			Attachment attachment = getById(id);
//			if (attachment != null) {
//				attachmentDao.delete(attachment);
//				deleteAttachmentFile(getFullFilePath(attachment.getAttachPath(), attachment.getSaveName()));
//			}
//		}
//	}
//
//	public Attachment getById(Long id) {
//		Attachment ret = null;
//		if (id != null) {
//			ret = attachmentDao.get(id);
//		}
//		return ret;
//	}
//
//	private static final String getFileSuffix(String fileName) {
//		String suffix = "";
//		if (fileName.contains(".")) {
//			suffix = fileName.substring(fileName.lastIndexOf("."));
//		}
//		return suffix;
//	}
//
//	private static final String generatorFileName(String fileName) {
//		return "" + System.currentTimeMillis() + getFileSuffix(fileName);
//	}
//
//	private static final String generatorFilePath() {
//		Date now = new Date();
//		return DATE_YEAR_FORMAT.format(now) + File.separator + DATE_MONTH_DAY_FORMAT.format(now);
//	}
//
//	private static final void deleteAttachmentFile(String fileName) {
//		if (StringUtils.isNotBlank(fileName)) {
//			File file = new File(fileName);
//			if (file.exists() && file.isFile()) {
//				file.delete();
//			}
//		}
//	}
//
//	@Override
//	public List<Attachment> getAttachListByIdList(List<Long> idList) {
//		if (idList == null || idList.isEmpty()) {
//			return null;
//		}
//		List<Attachment> attachList = attachmentDao.getAttachListByIdList(idList);
//		List<PropertyTransVo> transVoList = new ArrayList<PropertyTransVo>();
//		transVoList = new ArrayList<PropertyTransVo>();
//		transVoList.add(new PropertyTransVo("creator", Buser.class, "userId", "userName", "creatorName"));
//		return (List<Attachment>) DynamicPropertyTransfer.transform(attachList, transVoList);
//	}
//
//	public String compressAttachment(List<Long> idList) {
//		String result = compressTempDir + System.currentTimeMillis() + ".zip";
//		List<Attachment> list = getAttachListByIdList(idList);
//		List<String> fileList = new ArrayList<String>();
//		List<String> nameList = new ArrayList<String>();
//		if (list != null && !list.isEmpty()) {
//			for (Attachment attachment : list) {
//				String fileName = getFullFilePath(attachment.getAttachPath(), attachment.getSaveName());
//				fileList.add(fileName);
//				nameList.add(attachment.getName());
//			}
//		}
//		CompressUtil.compress(fileList, nameList, result);
//		return result;
//	}
//
//	@Override
//	public String getTempDir() {
//		return compressTempDir;
//	}
//
//	@Override
//	public Attachment save(InputStream in, String fileName, int bufferSize) {
//		Attachment ret = null;
//		if (in != null) {
//			try {
//				String filePath = generatorFilePath();
//				createFilePath(filePath);
//				String newFileName = generatorFileName(fileName);
//				String fullFileName = getFullFilePath(filePath, newFileName);
//				while (isFileExist(fullFileName)) {
//					newFileName = generatorFileName(fileName);
//					fullFileName = getFullFilePath(filePath, newFileName);
//				}
//				// FileUtils.copyFile(file, new File(fullFileName));
//
//				File file = new File(fullFileName);
//
//				FileOutputStream fos = null;
//				try {
//					fos = new FileOutputStream(file);
//
//					byte[] buffer = new byte[bufferSize];
//					int length = 0;
//					while ((length = in.read(buffer)) > 0) {
//						fos.write(buffer, 0, length);
//					}
//					fos.flush();
//				} finally {
//					if (fos != null) {
//						fos.close();
//					}
//				}
//
//				ret = new Attachment();
//				ret.setName(fileName);
//				ret.setSaveName(newFileName);
//				ret.setAttachPath(filePath);
//				ret.setAttachSize(file.length());
//				if (SessionTool.getUserLogonInfo() != null) {
//					ret.setCreator(SessionTool.getUserLogonInfo().getSysUserId());
//				}
//				ret.setUploadType("1");
//				if (log.isDebugEnabled()) {
//					log.debug(JsonUtils.objectToJsonString(ret));
//				}
//				attachmentDao.save(ret);
//			} catch (Exception e) {
//				log.error(e.getMessage(), e);
//			}
//		}
//		return ret;
//	}
//	
//	public List<String>  generateExtList(String fileTypeExt) {
//		Properties phpServer = (Properties) SourceTemplate.getBean("phpServer");
//		String pictureType = phpServer.getProperty("pictureType");
//		String compressedType = phpServer.getProperty("compressedType");
//		String mediaType = phpServer.getProperty("mediaType");
//		String soundType = phpServer.getProperty("soundType");
//		String fileType = phpServer.getProperty("fileType");
//		String uploadType = phpServer.getProperty("uploadType");
//		
//		List<String> pictureTypeList = stringToList(pictureType);
//		List<String> compressedTypeList = stringToList(compressedType);
//		List<String> mediaTypeList = stringToList(mediaType);
//		List<String> soundTypeList = stringToList(soundType);
//		List<String> fileTypeList = stringToList(fileType);
//		List<String> uploadTypeList = stringToList(uploadType);
//		
//		List<String> extList = new ArrayList<String>();
//		char[] extArray = fileTypeExt.toCharArray();
//		
//		if (extArray.length > 1) {
//			extList = uploadTypeList;
//		}else {
//			if ("1".equals(fileTypeExt)) {
//				extList.addAll(pictureTypeList);
//			}
//			if ("2".equals(fileTypeExt)) {
//				extList.addAll(compressedTypeList);
//			}
//			if ("3".equals(fileTypeExt)) {
//				extList.addAll(mediaTypeList);
//			}
//			if ("4".equals(fileTypeExt)) {
//				extList.addAll(soundTypeList);
//			}
//			if ("5".equals(fileTypeExt)) {
//				extList.addAll(fileTypeList);
//			}
//		}
//		return extList;
//	}
//	
//	private List<String> stringToList(String prjTypes) {
//		if (StringUtil.isEmpty(prjTypes))
//			return new ArrayList<String>(0);
//		prjTypes = prjTypes.replace(',', ':');
//		String[] typeArr = prjTypes.split(":");
//		ArrayList<String> list = new ArrayList<String>(typeArr.length);
//		for (String str : typeArr) {
//			list.add(str);
//		}
//		return list;
//	}
//
//	
//	@Override
//	public String createImageAndUpload(String prjId, String contractInfoId){
//		Properties phpServer = (Properties) SourceTemplate.getBean("phpServer");
//		String host = phpServer.getProperty("java.crm.server");
//		String result = "{result:1}";
//		String nowater = "0";
//		try {
//			 String uploadResult = HttpRequestUtil.sendPost(host + "/assetsManage/ytApplyLoan_createImageAndUpload.jhtml",
//					"contractInfoId="+contractInfoId);
//			 
//			 log.info("host="+host);
//			 log.info("contractInfoId="+contractInfoId);
//			 log.info("uploadResult="+uploadResult);
//			 
//			 if(StringUtils.isEmpty(uploadResult) || "null".equals(uploadResult)){
//				 result = "{result:1,message:'crm返回字符为空'}";
//				 return result;
//			 }
//			 
//			 List<String> list = GsonUtil.fromJsonToObj(uploadResult,new TypeToken<List<String>>() {}.getType());
//			 
//			 for(int i=0;i<list.size();i=i+2){
//				String origName = list.get(i);
//				JSONObject updateImgResult = JSONObject.fromObject(list.get(i+1));
//				JSONObject imgJO = JSONObject.fromObject(updateImgResult);
//				JSONObject attachJO = JSONObject.fromObject(imgJO.getString("attach"));
//				
//				if (!UtilConstant.NUMBER_1.equals("" + imgJO.getString("boolen"))) {
//					log.error("fileName:" + origName + ",上传到图片服务器失败，" + updateImgResult);
//					throw new RuntimeException(imgJO.getString("message"));
//				}
//				
//				String arrFiles = imgJO.getString("result");
//				String moveResult = xhhMoveImg(arrFiles,nowater); 
//				if (StringUtils.isBlank(moveResult)) {
//					log.error("fileName:" + origName + ",移动图片服务调用失败，" + moveResult);
//					throw new RuntimeException("移动图片服务调用失败");
//				}
//				String domain = attachJO.getString("imgserver");
//				String attachSize = attachJO.getString("size");
//				String[] moveFileArray = moveResult.split(":");
//				
//				String moveFile1 =  moveFileArray[1].replaceAll("\\\\|\"", "");
//				int ind = moveFile1.lastIndexOf("/");
//				String newFileName = moveFile1.substring(ind+1);
//				String filePath = moveFile1.substring(0,ind+1);
//	
//				Attachment ret = new Attachment();
//				ret.setName(origName);
//				ret.setSaveName(newFileName);
//				ret.setAttachPath(filePath);
//				ret.setAttachSize(Long.valueOf(attachSize));
//				if (SessionTool.getUserLogonInfo() != null) {
//					ret.setCreator(SessionTool.getUserLogonInfo().getSysUserId());
//				}
//				ret.setXhhResult(moveResult.replaceAll("\\\\|\"", ""));
//				ret.setUploadType("2");
//				if (log.isDebugEnabled()) {
//					log.debug(JsonUtils.objectToJsonString(ret));
//				}
//				ret.setDomain(domain);
//				attachmentDao.save(ret);
//				
//				FiAuditRecord fiAuditRecord = new FiAuditRecord();
//				fiAuditRecord.setName(origName);
//				fiAuditRecord.setPrjId(Long.valueOf(prjId));
//				fiAuditRecord.setIsRequired((byte) 1);
//				fiAuditRecord.setDisplayOrder(i);
//				Long auditRecordId = fiAuditRecordDao.save(fiAuditRecord);
//				
//				FiCorpMaterial corpMaterial = new FiCorpMaterial();
//				corpMaterial.setName(origName);
//				corpMaterial.setAuditRecordId(auditRecordId);
//				corpMaterial.setPath(ret.getXhhResult());
//				corpMaterial.setRelatePath(ret.getAttachPath());
//				corpMaterial.setFileName(ret.getSaveName());
//				corpMaterial.setFileType("png");
//				fiCorpMaterialDao.save(corpMaterial);
//			 }
//		 
//		} catch (Exception e) {
//			log.error(e.getMessage(), e);
//			result = "{result:0,message:"+e.getMessage()+"}";
//		}
//		return result;
//	}
//}
