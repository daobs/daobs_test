package com.spring.seed.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.seed.service.SeedService;
import com.spring.seed.utility.Utility;
import com.spring.seed.vo.SeedVO;


@Controller
public class SeedController {
	
	@Autowired
	SeedService service;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() throws Exception {

		return "home";
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
	
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, Model model) throws Exception {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if(col.equals("total")){
			word = "";
		}
		//페이지관련-----------------------
		int nowPage = 1;//현재 보고있는 페이지
		if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;//한페이지당 보여줄 레코드갯수
		
		 
		//DB에서 가져올 순번-----------------
		int sno = ((nowPage-1)*recordPerPage);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("col", col);
		map.put("word", word);
		map.put("sno",sno);
		

		int total= service.total(map);
		List<SeedVO> list = service.list(map);
		
		String paging = Utility.paging2("list", total, nowPage, recordPerPage, col, word);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		return "list";
	}
}
