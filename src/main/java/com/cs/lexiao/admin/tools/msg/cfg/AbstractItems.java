
package com.cs.lexiao.admin.tools.msg.cfg;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.bind.annotation.XmlType;

import com.cs.lexiao.admin.tools.msg.cfg.fixlen.FixLenItems;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "abstractItemsType")
@XmlSeeAlso({
	FixLenItems.class
})
public class AbstractItems
    extends Basic
{

}
