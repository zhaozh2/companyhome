/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mainpic.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.mainpic.entity.MainPic;
import com.thinkgem.jeesite.modules.mainpic.dao.MainPicDao;

/**
 * 首页内容维护Service
 * @author zhaozh
 * @version 2017-07-27
 */
@Service
@Transactional(readOnly = true)
public class MainPicService extends CrudService<MainPicDao, MainPic> {

	public MainPic get(String id) {
		return super.get(id);
	}
	
	public List<MainPic> findList(MainPic mainPic) {
		return super.findList(mainPic);
	}
	
	public Page<MainPic> findPage(Page<MainPic> page, MainPic mainPic) {
		return super.findPage(page, mainPic);
	}
	
	@Transactional(readOnly = false)
	public void save(MainPic mainPic) {
		super.save(mainPic);
	}
	
	@Transactional(readOnly = false)
	public void delete(MainPic mainPic) {
		super.delete(mainPic);
	}
	
}