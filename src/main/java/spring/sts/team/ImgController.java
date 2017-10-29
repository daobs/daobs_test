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
public class ImgController {
	@Autowired
	private ImgDAO dao;
	
//	@RequestMapping(value="/img/updateFile",method=RequestMethod.POST)
//	public String updateFile(ImgDTO dto,String oldFile,HttpServletRequest request,Model model,String col,String word,String nowPage) {
//		String upDir = request.getRealPath("images/img/storage");
//		int filesize = (int)dto.getFilenameMF().getSize();
//		if(filesize > 0) {
//			dto.setNail_img(Utility.saveFileSpring30(dto.getFilenameMF(),upDir));
//		}
//		Map<Object,Object> map = new HashMap<Object, Object>();
//		map.put("imgno", dto.getImgno());
//		map.put("nail_img", dto.getNail_img());
//		boolean flag = dao.updateFile(map);
//		if(flag) {
//			if(oldFile != null && !oldFile.equals("default.jpg"))
//				Utility.deleteFile(upDir, oldFile);
//			model.addAttribute("col",col);
//			model.addAttribute("nowPage",nowPage);
//			String classes = dto.getClasses();
//			String url = "rediret:/"+classes+"/list";
//			return url;
//		}else {
//			return "error/error";
//		}
//	}
//	@RequestMapping(value="/img/updateFile",method=RequestMethod.GET)
//	public String updateFile() {
//		
//		return "img/updateFileForm.tiles";
//	}
	@RequestMapping(value="/img/delete")
	public String delete(int imgno,String oldFile,Model model,HttpServletRequest request,String col,String word,String nowPage) {
		String upDir = request.getRealPath("images/img/storage");
		boolean flag = dao.delete(imgno);
		if(flag) {
			if(!oldFile.equals("default.jpg") && oldFile != null) {
				Utility.deleteFile(upDir, oldFile);
			}
		}
		
		model.addAttribute("col",col);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("flag",flag);
		return "img/deleteProc.tiles";
	}
	@RequestMapping(value="/img/update",method=RequestMethod.POST)
	public String update(ImgDTO dto,Model model,String col,String word,String nowPage) {
		boolean flag = dao.update(dto);
		if(flag) {
			model.addAttribute("col",col);
			model.addAttribute("nowPage",nowPage);
			return "redirect:/img/list";
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="/img/update",method=RequestMethod.GET)
	public String update(int imgno,Model model) {
		ImgDTO dto = dao.read(imgno);
		model.addAttribute("dto",dto);
		return "img/updateForm.tiles";
	}
	
	
	@RequestMapping(value="img/create",method=RequestMethod.POST)
	public String create(ImgDTO dto,HttpServletRequest request,Model model,String col,String nowPage) {
		String upDir = request.getRealPath("images/img/storage");
		int filesize = (int)dto.getFilenameMF().getSize();
		String fname = "default.jpg";
		if(filesize > 0) {
			fname = Utility.saveFileSpring30(dto.getFilenameMF(), upDir);
			
		}
		dto.setNail_img(fname);
		boolean flag = dao.create(dto);
		if(flag) {
			model.addAttribute("col",col);
			model.addAttribute("nowPage",nowPage);
			return "redirect:/photofolio/list";
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="/img/create",method=RequestMethod.GET)
	public String create() {
		
		return "img/create.tiles";
	}

}
