package spring.sts.blog;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import spring.model.image.ImageDAO;
import spring.model.image.ImageDTO;
import spring.utility.blog.Utility;


@Controller
public class ImageController {
	@Autowired
	private ImageDAO dao;
	
	@RequestMapping(value="image/delete",method=RequestMethod.POST)
	public String delete(HttpServletRequest request,int imageno,String passwd,String oldFile,String col,String word,String nowPage) {
		String upDir = request.getRealPath("/image/storage");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("imageno", imageno);
		map.put("passwd", passwd);
		
		boolean pflag = dao.passwdCheck(map);
		
		boolean flag = false;
		if(pflag){
			flag=dao.delete(imageno);
		}else {
			return "error/passwdError.tiles";
		}
		
		if (flag) {
			if(oldFile != null && !oldFile.equals("default.png"))
				Utility.deleteFile(upDir, oldFile);
			request.setAttribute("col",col);
			request.setAttribute("word",word);
			request.setAttribute("nowPage",nowPage);
			return "redirect:/image/list";
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="image/delete",method=RequestMethod.GET)
	public String delete(int imageno,Model model) {
		boolean flag = dao.getRefnum(imageno);
		
		model.addAttribute("flag",flag);
		return "image/deleteForm.tiles";
	}
	@RequestMapping(value="image/reply",method=RequestMethod.POST)
	public String reply(HttpServletRequest request,ImageDTO dto,String col,String word,String nowPage) {
		String upDir = request.getRealPath("/image/storage");
		
		int size = (int)dto.getFnameMF().getSize();
		if(size > 0){
			dto.setFname(Utility.saveFileSpring30(dto.getFnameMF(), upDir));
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("grpno",dto.getGrpno());
		map.put("ansnum",dto.getAnsnum());
		dao.upAnsnum(map);
		boolean flag = dao.replyCreate(dto);
		if(flag) {
			request.setAttribute("col",col);
			request.setAttribute("word",word);
			request.setAttribute("nowPage",nowPage);
			return "redirect:/image/list";
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="image/reply",method=RequestMethod.GET)
	public String reply(int imageno,Model model) {
		ImageDTO dto = dao.replyRead(imageno);
		
		model.addAttribute("dto", dto);
		return "image/replyForm.tiles";
	}
	@RequestMapping(value="image/updateFile",method=RequestMethod.POST)
	public String updateFile(HttpServletRequest request,ImageDTO dto,String oldFile,String col,String word,String nowPage) {
		String upDir = request.getRealPath("/image/storage");
		int size = (int)dto.getFnameMF().getSize();
		String filename = null;
		if(size>0){
			if(oldFile!=null && !oldFile.equals("default.png"))
				Utility.deleteFile(upDir, oldFile);
			filename = Utility.saveFileSpring30(dto.getFnameMF(), upDir);
		}

		Map<String,Object> map= new HashMap<String,Object>();
		map.put("imageno",dto.getImageno());
		map.put("fname",filename);
		boolean flag= dao.updateFile(map);
		
		if(flag) {
			request.setAttribute("col",col);
			request.setAttribute("word",word);
			request.setAttribute("nowPage",nowPage);
			return "redirect:/image/read?imageno="+dto.getImageno();
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="image/updateFile",method=RequestMethod.GET)
	public String updateFile() {
		
		return "image/updateFileForm.tiles";
	}
	@RequestMapping(value="image/update",method=RequestMethod.POST)
	public String update(ImageDTO dto,Model model,String col,String word,String nowPage) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("imageno", dto.getImageno());
		map.put("passwd", dto.getPasswd());
		
		boolean pflag = dao.passwdCheck(map);
		
		boolean flag = false;
		if(!pflag) {
			return "error/passwdError.tiles";
		}else {
			flag = dao.update(dto);
		}
		if(flag) {
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nowPage",nowPage);
			return "redirect:/image/list";
		}else {
			return "error/error";
		}
		
	}
	@RequestMapping(value="image/update",method=RequestMethod.GET)
	public String update(int imageno,Model model) {
		ImageDTO dto = dao.read(imageno);
		
		model.addAttribute("dto", dto);
		return "image/updateForm.tiles";
	}
	@RequestMapping(value="image/read")
	public String read(int imageno,Model model) {
		ImageDTO dto = dao.read(imageno);
		Map<String,String> map = dao.readImg(imageno);
		
		String[] arrNo = {String.valueOf(map.get("PRE_IMGNO2")),String.valueOf(map.get("PRE_IMGNO1")),String.valueOf(map.get("IMAGENO")),
				String.valueOf(map.get("NEX_IMGNO1")),String.valueOf(map.get("NEX_IMGNO2"))};
		String[] arrFname = {map.get("PRE_FILE2"),map.get("PRE_FILE1"),map.get("FNAME"),
				map.get("NEX_FILE1"),map.get("NEX_FILE2")};
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("arrNo", arrNo);
		model.addAttribute("filename", arrFname);
		return "image/read.tiles";
	}
	@RequestMapping("image/list")
	public String list(HttpServletRequest request) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
			//갯파라미터로 콜이랑워드를 object로 가져와서 지정해준걸로 변환해
			if (col.equals("total"))
			word = "";
			
		int nowPage = 1;
		if(request.getParameter("nowPage") != null){  //갯파라미터로 일단 나우페이지를 어떤형식이든 가져와 
			nowPage = Integer.parseInt(request.getParameter("nowPage")); //그리고 널값이 아니면 여기서 이제 인티저로형변환해
		}
		int recordPerPage = 3;
		int sno = ((nowPage-1)*recordPerPage) +1;
		int eno = nowPage * recordPerPage;
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("col", col); //문자열이든뭐든 일단 오브젝트로가져와서 선정햊ㅁ~
		map.put("word",word);
		map.put("sno",sno);
		map.put("eno", eno);
		List<ImageDTO> list = dao.list(map);
		int total = dao.total(map); 
		String paging = Utility.paging2("list", total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		return "image/list.tiles";
	}
	@RequestMapping(value="/image/create",method=RequestMethod.POST)
	public String create(HttpServletRequest request,ImageDTO dto) {
		String upDir = request.getRealPath("/image/storage");
		
		int size = (int)dto.getFnameMF().getSize();
		if(size > 0){
			dto.setFname(Utility.saveFileSpring30(dto.getFnameMF(), upDir));
		}
		boolean flag= dao.create(dto);
		if(flag) {
			return "redirect:/image/list";
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="/image/create",method=RequestMethod.GET)
	public String create() {
		
		return "image/createForm.tiles";
	}
}
