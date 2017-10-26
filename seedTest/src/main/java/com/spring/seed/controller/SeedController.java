package com.spring.seed.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.seed.service.SeedService;
import com.spring.seed.vo.SeedVO;


@Controller
public class SeedController {
	
	@Autowired
	SeedService service;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() throws Exception {

		return "list";
	}
	
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create() {
		return "create";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(SeedVO vo) throws Exception {
		boolean flag = service.create(vo);
		if(flag) {
			return "redirect:/";
		}else {
			
			return "create";
		}
	}
}
