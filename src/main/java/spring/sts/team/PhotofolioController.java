package spring.sts.team;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.img.ImgDAO;
import spring.model.img.ImgDTO;
import spring.sts.utility.Utility;

@Controller
public class PhotofolioController {
	
	@Autowired
	private ImgDAO dao;
	@RequestMapping("/photofolio/list")
	public String list(HttpServletRequest request,Model model) {
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
		int recordPerPage = 9;//한페이지당 보여줄 레코드갯수
		 
		//DB에서 가져올 순번-----------------
		int sno = ((nowPage-1)*recordPerPage);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("col", col);
		map.put("sno",sno);
		map.put("classes", "photofolio");
		
		int total= dao.total(map);
		List<ImgDTO> list = dao.list(map);
		String paging = Utility.paging2("list", total, nowPage, recordPerPage, col, word);
	
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		return "photofolio/list.tiles";
	}
	
	@RequestMapping(value="/photofolio/read" ,method=RequestMethod.GET)
	public String read() {
		
		return "photofolio/read.tiles";
	}
	
	@RequestMapping(value="/photofolio/create" ,method=RequestMethod.GET)
	public String create() {
		
		return "photofolio/create.tiles";
	}

}
