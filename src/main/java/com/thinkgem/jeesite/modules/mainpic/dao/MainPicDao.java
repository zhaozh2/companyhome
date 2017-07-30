/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mainpic.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.mainpic.entity.MainPic;

/**
 * 首页内容维护DAO接口
 * @author zhaozh
 * @version 2017-07-27
 */
@MyBatisDao
public interface MainPicDao extends CrudDao<MainPic> {
	
}