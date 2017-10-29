package spring.sts.blog;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;
import spring.utility.blog.Utility;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("admin/list")
	public String list(HttpServletRequest request) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if (col.equals("total")) {
			word = "";
		}

		// 페이징관련
		int nowPage = 1;
		int recordPerPage = 5;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		// DB에서 가져올 순번
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		int total = dao.total(map);
		List<MemberDTO> list = dao.list(map);

		String paging = Utility.paging2("list", total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		return "member/list.tiles";
	}
	@RequestMapping(value="member/updateFile",method=RequestMethod.POST)
	public String updateFile(HttpServletRequest request,String id,String oldFile,MultipartFile fnameMF,Model model) {
		String upDir = request.getRealPath("/member/storage");
		
		int size = (int)fnameMF.getSize();
		String fname = null;
		if(size>0){
			if(oldFile!= null && !oldFile.equals("member.jpg"))
				Utility.deleteFile(upDir, oldFile);
			fname = Utility.saveFileSpring30(fnameMF, upDir);
		}
		Map<String,String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("fname", fname);
		boolean flag = dao.updateFile(map);
		
		request.setAttribute("flag", flag);
		request.setAttribute("id", id);
		return "member/updateFileProc.tiles";
	}
	@RequestMapping(value="member/updateFile",method=RequestMethod.GET)
	public String updateFile() {
		
		return "member/updateFileForm.tiles";
	}
	
	@RequestMapping(value="member/updatePw",method=RequestMethod.POST)
	public String updatePw(String id, String passwd,Model model) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("passwd", passwd);
		boolean flag = dao.updatePw(map);
		
		model.addAttribute("flag",flag);
		return "member/updatePwProc.tiles";
	}
	@RequestMapping(value="member/updatePw",method=RequestMethod.GET)
	public String updatePw() {
		
		return "member/updatePwForm.tiles";
	}
	
	@RequestMapping("member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping(value="member/login",method=RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response,
			String bbsno,String nowPage,String nPage,String col,String word,String rflag,Model model) {
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("passwd", passwd);
		
		boolean flag = dao.loginCheck(map);
		String grade = null;//회원등급
		if(flag){//회원인경우
		grade = dao.getGrade(id);
		   request.getSession().setAttribute("id", id);
		   request.getSession().setAttribute("grade", grade);
		   
		   // ---------------------------------------------- 
		   // Cookie 저장, Checkbox는 선택하지 않으면 null 임 
		   // ---------------------------------------------- 
		   Cookie cookie = null; 
		      
		   String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 
		      
		   if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
		     cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
		     cookie.setMaxAge(120);               // 2 분 유지 
		     response.addCookie(cookie);          // 쿠키 기록 
		  
		     cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
		     cookie.setMaxAge(120);               // 2 분 유지 
		     response.addCookie(cookie);          // 쿠키 기록  
		        
		   }else{ 
		     cookie = new Cookie("c_id", "");     // 쿠키 삭제 
		     cookie.setMaxAge(0); 
		     response.addCookie(cookie); 
		        
		     cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
		     cookie.setMaxAge(0); 
		     response.addCookie(cookie); 
		   } 
		   // --------------------------------------------- 
		}else {
			return "../error/passwdError";
		}
		String url = "member/loginProc.tiles";
		request.setAttribute("flag", flag);
		if(rflag != null && !rflag.equals("")) {
			model.addAttribute("bbsno", bbsno);
			model.addAttribute("nowPage",nowPage );
			model.addAttribute("nPage", nPage);
			model.addAttribute("col",col );
			model.addAttribute("word",word );
			//request객체는 redirect를 했을때 저장된 객체의 값을 유지할 수 없으므로 model을 사용해줌
			url = "redirect:"+rflag;
		}
		return url;
	}
	@RequestMapping(value="member/login",method=RequestMethod.GET) 
	public String login(HttpServletRequest request) {
		String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
		String c_id_val = ""; // ID 값
		 
		Cookie[] cookies = request.getCookies(); 
		Cookie cookie=null; 
		 
		if (cookies != null){ 
		 for (int i = 0; i < cookies.length; i++) { 
		   cookie = cookies[i]; 
		 
		   if (cookie.getName().equals("c_id")){ 
		     c_id = cookie.getValue();     // Y 
		   }else if(cookie.getName().equals("c_id_val")){ 
		     c_id_val = cookie.getValue(); // user1... 
		   } 
		 } 
		} 
		
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);
		return "member/loginForm.tiles";
	}
	
	@RequestMapping(value="/member/delete" , method=RequestMethod.POST)
	public String delete(String id,String passwd,HttpServletRequest request) {
		String upDir = request.getRealPath("/member/storage");

		String oldfile = request.getParameter("oldfile");

		boolean flag = dao.delete(id);
		if (flag && !oldfile.equals("member.jpg")) {
			Utility.deleteFile(upDir, oldfile);
		}
		if(flag && !request.getSession().getAttribute("id").equals("admin")){
			request.getSession().invalidate();
		}

		request.setAttribute("flag", flag);
		return "member/deleteProc.tiles";
	}
	@RequestMapping(value="/member/delete" , method=RequestMethod.GET)
	public String delete(String id,String oldFile,HttpSession session,Model model) {
		if(id ==null){
			id = (String)session.getAttribute("id");
		}
		if(oldFile ==null){
			oldFile = dao.getFname(id);
		}
		model.addAttribute("oldFile", oldFile);
		model.addAttribute("id", id);
		return "member/deleteForm.tiles";
	}
	@RequestMapping(value="/member/update",method=RequestMethod.POST)
	public String update(MemberDTO dto,Model model) {
		model.addAttribute("flag",dao.update(dto));
		return "member/updateProc.tiles";
	}
	@RequestMapping(value="/member/update",method=RequestMethod.GET)
	public String update(String id,HttpSession session,Model model) {
		if(id==null)id=(String)
				session.getAttribute("id");
		MemberDTO dto = dao.read(id);
		model.addAttribute("dto", dto);
		return "member/updateForm.tiles";
	}
	@RequestMapping("/member/read")
	public String read(String id,HttpSession session,Model model) {
		if(id==null)
			id=(String)session.getAttribute("id");
		MemberDTO dto = dao.read(id);
		model.addAttribute("dto", dto);
		return "member/read.tiles";
	}
	@RequestMapping(value="/member/createProc",method=RequestMethod.POST)
	public String create(MemberDTO dto,HttpServletRequest request,Model model) {
		String upDir = request.getRealPath("/member/storage");
		
		String str = "";
		String url = "member/pcreateProc.tiles";
		
		if(dao.duplicateId(dto.getId())){
			str="중복된 아이디입니다. 아이디중복 확인을 하세요.";
			request.setAttribute("str", str);
		}else if(dao.duplicateEmail(dto.getEmail())){
			str="중복된 이메일입니다. 이메일중복 확인을 하세요";
			request.setAttribute("str", str);
		}else{
			int filesize = (int)dto.getFnameMF().getSize();
			String filename = "member.jpg";
			if(filesize > 0) {
				filename = Utility.saveFileSpring30(dto.getFnameMF(), upDir);
			}
			dto.setFname(filename);
			boolean flag = dao.create(dto);
			model.addAttribute("flag",flag);
			url = "member/createProc.tiles";
		}	
		return url;
	}
	@RequestMapping(value="/member/create",method=RequestMethod.POST)
	public String create() {
		
		return "member/createForm.tiles";
	}
	@RequestMapping("/member/agree")
	public String agree() {
		
		return "member/agreement.tiles";
	}
	@RequestMapping(value="/member/email_proc")
	public String emailCheck(String email,Model model) {
		model.addAttribute("flag",dao.duplicateEmail(email));
		return "member/email_proc";
	}
	@RequestMapping(value="/member/email_form")
	public String emailCheck() {
		
		return "/member/email_form";
	}
	
	@RequestMapping(value="/member/id_proc")
	public String idCheck(String id,Model model) {
		model.addAttribute("flag",dao.duplicateId(id));
		return "/member/id_proc";
	}
	@RequestMapping(value="/member/id_form")
	public String idCheck() {
		
		return "/member/id_form";
	}
}
