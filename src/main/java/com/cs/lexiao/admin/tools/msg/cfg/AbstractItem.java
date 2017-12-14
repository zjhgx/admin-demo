
package com.cs.lexiao.admin.tools.msg.cfg;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.bind.annotation.XmlType;

import com.cs.lexiao.admin.tools.msg.cfg.fixlen.FixLenItem;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "abstractItemType")
@XmlSeeAlso({
    FixLenItem.class
})
public abstract class AbstractItem
    extends Basic
{


}
