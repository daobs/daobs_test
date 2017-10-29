package spring.sts.team;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Student_artController {
	
	@RequestMapping("/student_art/list")
	public ModelAndView list() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("student_art/list.tiles");
		return mav;
	}
	
	@RequestMapping("/student_art/read")
	public ModelAndView read() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("student_art/read.tiles");
		return mav;
	}
	
	@RequestMapping(value="/student_art/create", method=RequestMethod.GET)
	public ModelAndView create() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("student_art/createForm.tiles");
		return mav;
	}
}
