package spring.sts.blog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.memo.MemoDAO;
import spring.model.memo.MemoDTO;
import spring.model.memo.MemoService;
import spring.utility.blog.Utility;

@Controller
public class MemoController {
	@Autowired
	private MemoDAO dao;
	@Autowired
	private MemoService service;
	
	@RequestMapping(value="/memo/delete",method=RequestMethod.POST)
	public String delete(int memono,Model model,String col,String word,String nowPage) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("col", col);
		map.put("word", word);
		int total= dao.total(map);
		int totalPage = (int)(Math.ceil((double)total/5));
		int nowPage2 = Integer.parseInt(nowPage);
		if(nowPage2!=1 && nowPage2==totalPage && total%5==1) {
			nowPage2 = nowPage2-1;
		}
		boolean flag = dao.delete(memono);
		if(flag) {
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nowPage",nowPage2);
			return "redirect:/memo/list";
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="/memo/delete",method=RequestMethod.GET)
	public String delete(int memono,Model model) {
		boolean flag = dao.getRefnum(memono);
		model.addAttribute("flag",flag);
		return "memo/deleteForm.tiles";
	}
	@RequestMapping(value="/memo/reply", method=RequestMethod.POST)
	public String reply(MemoDTO dto,String col,String word,String nowPage,Model model){
		boolean flag = service.reply(dto);
		if(flag) {
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nowPage",nowPage);
			return "redirect:/memo/list";
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="/memo/reply", method=RequestMethod.GET)
	public String reply(int memono,Model model) {
		
		MemoDTO dto = dao.replyRead(memono);
		model.addAttribute("dto",dto);
		return "memo/replyForm.tiles";
	}
	@RequestMapping(value="/memo/update",method=RequestMethod.POST)
	public String update(MemoDTO dto,String col,String word,String nowPage,Model model) {
		boolean flag = dao.update(dto);
		if(flag) {
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nowPage",nowPage);
			return "redirect:/memo/list";
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="/memo/update",method=RequestMethod.GET)
	public String update(int memono,Model model) {
		MemoDTO dto = dao.read(memono);
		
		model.addAttribute("dto",dto);
		return "memo/updateForm.tiles";
	}
	@RequestMapping("/memo/read")
	public String read(int memono,Model model) {
		dao.upViewcnt(memono);
		
		MemoDTO dto = dao.read(memono);
		dto.setContent(dto.getContent().replaceAll("/r/n", "<br>"));
		model.addAttribute("dto",dto);
		return "memo/read.tiles";
	}
	@RequestMapping(value="/memo/create" , method=RequestMethod.POST)
	public String create(MemoDTO dto) {
		boolean flag = dao.create(dto);
		if(flag) {
			return "redirect:/memo/list";
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="/memo/create" , method=RequestMethod.GET)
	public String create(){
		
		return "memo/createForm.tiles";
	}
	@RequestMapping("/memo/list")
	public String list(HttpServletRequest request,Model model) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if(col.equals("total")){
			word = "";
		}
	//------------페이징관련
		
		int nowPage = 1; //현재페이지
		int recordPerPage =5; //페이지에 보여질 레코드갯수
		
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage")); //numberformatexception
		}
		
		//db에서 데이터를가져올 순번
		
		int sno = ((nowPage-1)*recordPerPage) +1;
		int eno = nowPage * recordPerPage;

		Map<Object,Object> map = new HashMap<Object,Object>();
		
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		int total = dao.total(map);
		List<MemoDTO> list = dao.list(map);
		String paging = Utility.paging2("list", total, nowPage, recordPerPage, col, word);
		//request저장
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		return "memo/list.tiles";
	}
	
}
