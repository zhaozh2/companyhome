/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mainpic.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.mainpic.entity.MainPic;
import com.thinkgem.jeesite.modules.mainpic.service.MainPicService;

/**
 * 首页内容维护Controller
 * @author zhaozh
 * @version 2017-07-27
 */
@Controller
@RequestMapping(value = "${adminPath}/mainpic/mainPic")
public class MainPicController extends BaseController {

	@Autowired
	private MainPicService mainPicService;
	
	@ModelAttribute
	public MainPic get(@RequestParam(required=false) String id) {
		MainPic entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = mainPicService.get(id);
		}
		if (entity == null){
			entity = new MainPic();
		}
		return entity;
	}
	
	@RequiresPermissions("mainpic:mainPic:view")
	@RequestMapping(value = {"list", ""})
	public String list(MainPic mainPic, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MainPic> page = mainPicService.findPage(new Page<MainPic>(request, response), mainPic); 
		model.addAttribute("page", page);
		return "modules/mainpic/mainPicList";
	}

	@RequiresPermissions("mainpic:mainPic:view")
	@RequestMapping(value = "form")
	public String form(MainPic mainPic, Model model) {
		model.addAttribute("mainPic", mainPic);
		return "modules/mainpic/mainPicForm";
	}

	@RequiresPermissions("mainpic:mainPic:edit")
	@RequestMapping(value = "save")
	public String save(MainPic mainPic, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, mainPic)){
			return form(mainPic, model);
		}
		mainPicService.save(mainPic);
		addMessage(redirectAttributes, "保存首页内容维护成功");
		return "redirect:"+Global.getAdminPath()+"/mainpic/mainPic/?repage";
	}
	
	@RequiresPermissions("mainpic:mainPic:edit")
	@RequestMapping(value = "delete")
	public String delete(MainPic mainPic, RedirectAttributes redirectAttributes) {
		mainPicService.delete(mainPic);
		addMessage(redirectAttributes, "删除首页内容维护成功");
		return "redirect:"+Global.getAdminPath()+"/mainpic/mainPic/?repage";
	}

}