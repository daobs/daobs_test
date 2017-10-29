package spring.sts.team;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class ExhibitController {
	@RequestMapping(value="/exhibit/list" ,method=RequestMethod.GET)
	public String read() {
		
		return "exhibit/list.tiles";
	}

}
