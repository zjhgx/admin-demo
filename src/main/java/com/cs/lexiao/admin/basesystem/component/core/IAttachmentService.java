package com.cs.lexiao.admin.basesystem.component.core;

import java.io.File;
import java.io.InputStream;
import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseService;
import com.cs.lexiao.admin.mapping.basesystem.other.Attachment;

/**
 * 附件服务
 * 
 * @author shentuwy
 * @date 2012-6-30
 * 
 */
public interface IAttachmentService extends IBaseService {

	public static final String	CHARSET_UTF8	= "UTF-8";

	public Attachment save(File file, String fileName);

	public Attachment save(InputStream in, String fileName, int bufferSize);

	public Attachment save(File file, String fileName, boolean imgServer, String nowater, String fileTypeExt);

	public void delete(Long id);

	public Attachment getById(Long id);

	public String getFullFilePath(String filePath, String fileName);

	public String getFullFilePath(String filePath, String fileName, boolean imgServer);

	public List<Attachment> getAttachListByIdList(List<Long> idList);

	public String compressAttachment(List<Long> idList);

	public String getTempDir();
	
	
	String createImageAndUpload(String prjId, String contractInfoId);
}
