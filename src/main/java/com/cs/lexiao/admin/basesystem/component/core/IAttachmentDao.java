package com.cs.lexiao.admin.basesystem.component.core;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.mapping.basesystem.other.Attachment;

public interface IAttachmentDao extends IBaseDAO<Attachment, Long> {
	List<Attachment> getAttachListByIdList(List<Long> idList);
}
