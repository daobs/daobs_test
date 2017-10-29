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

import spring.model.team.TeamDAO;
import spring.model.team.TeamDTO;
import spring.utility.blog.Utility;

@Controller
public class TeamController {
	@Autowired
	private TeamDAO dao;
	
	@RequestMapping(value="/team/updateFile",method=RequestMethod.POST)
	public String updateFile(TeamDTO dto,String oldFile,HttpServletRequest request,Model model,String col,String word,String nowPage) {
		String upDir = request.getRealPath("/team/storage");
		int filesize = (int)dto.getFilenameMF().getSize();
		if(filesize > 0) {
			dto.setFilename(Utility.saveFileSpring30(dto.getFilenameMF(),upDir));
		}
		Map<Object,Object> map = new HashMap<Object, Object>();
		map.put("teamno", dto.getTeamno());
		map.put("filename", dto.getFilename());
		boolean flag = dao.updateFile(map);
		if(flag) {
			if(oldFile != null && !oldFile.equals("member.jpg"))
				Utility.deleteFile(upDir, oldFile);
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nowPage",nowPage);
			return "redirect:/team/list";
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="/team/updateFile",method=RequestMethod.GET)
	public String updateFile() {
		
		return "team/updateFileForm.tiles";
	}
	@RequestMapping(value="/team/delete")
	public String delete(int teamno,String oldFile,Model model,HttpServletRequest request,String col,String word,String nowPage) {
		String upDir = request.getRealPath("/team/storage");
		boolean flag = dao.delete(teamno);
		if(flag) {
			if(!oldFile.equals("member.jpg") && oldFile != null) {
				Utility.deleteFile(upDir, oldFile);
			}
		}
		
		model.addAttribute("col",col);
		model.addAttribute("word",word);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("flag",flag);
		return "team/deleteProc.tiles";
	}
	@RequestMapping(value="/team/update",method=RequestMethod.POST)
	public String update(TeamDTO dto,Model model,String col,String word,String nowPage) {
		boolean flag = dao.update(dto);
		if(flag) {
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nowPage",nowPage);
			return "redirect:/team/list";
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="/team/update",method=RequestMethod.GET)
	public String update(int teamno,Model model) {
		TeamDTO dto = dao.read(teamno);
		model.addAttribute("dto",dto);
		return "team/updateForm.tiles";
	}
	@RequestMapping(value="team/create",method=RequestMethod.POST)
	public String create(TeamDTO dto,HttpServletRequest request,Model model,String col,String word,String nowPage) {
		String upDir = request.getRealPath("/team/storage");
		int filesize = (int)dto.getFilenameMF().getSize();
		String fname = "member.jpg";
		if(filesize > 0) {
			fname = Utility.saveFileSpring30(dto.getFilenameMF(), upDir);
		}
		dto.setFilename(fname);
		boolean flag = dao.create(dto);
		if(flag) {
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nowPage",nowPage);
			return "redirect:/team/list";
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="/team/create",method=RequestMethod.GET)
	public String create() {
		
		return "team/createForm.tiles";
	}
	@RequestMapping("/team/read")
	public String read(int teamno,Model model) {
		TeamDTO dto = dao.read(teamno);
		model.addAttribute("dto",dto);
		return "team/read.tiles";
	}
	@RequestMapping("/team/list")
	public String list(HttpServletRequest request,Model model) { 
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if (col.equals("total")) {
			word = "";
		}
		//페이징관련
		int nowPage = 1;
		int recordPerPage = 3;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		//db에서 데이터 가져올 순번

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map<Object,Object> map = new HashMap<Object,Object>();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<TeamDTO> list = dao.list(map);
		int total = dao.total(map);
		String paging = Utility.paging2("list", total, nowPage, recordPerPage, col, word);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		return "team/list.tiles";
	}
}
