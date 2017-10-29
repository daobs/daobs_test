package spring.sts.team;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class RequestController {
	
	@RequestMapping(value="/request/create" ,method=RequestMethod.GET)
	public String create() {
		
		return "request/create.tiles";
	}

}
