package com.example.controller;

import java.util.EnumSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.stereotype.Controller;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.DTO.Skill;
import com.example.DTO.Status;
import com.example.DTO.Trainee;
import com.example.Entity.TraineeEntity;
import com.example.Service.TraineeService;

@Controller
@EnableWebSecurity
public class TraineeController extends WebSecurityConfigurerAdapter implements WebMvcConfigurer {
	
	@Autowired
	private TraineeService traineeServiceImpl;
	
	@Override
    protected void configure(HttpSecurity http) throws Exception {
        	http
        		.csrf()
        			.disable()
        		.formLogin()
        			.and()
        		.authorizeRequests()
        			.anyRequest().authenticated();
    }
	
	@Override
    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("Reddy").password("{noop}reddy").roles("USER");
    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**").allowedMethods("*");
    }
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView welcome(@RequestParam(required = false) Integer pageId , @RequestParam(required = false) String keyword) {	
		
		if(pageId == null) {
			pageId = 0;
		}
		
		int pageNumber = pageId;
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNumber, pageSize);
		
		ModelAndView model = new ModelAndView();
		

		Set<Status> statuss = EnumSet.allOf(Status.class); 
		
		Set<Skill> skills = EnumSet.allOf(Skill.class);
		
		
		TraineeEntity trainee = new TraineeEntity();
		
		model.addObject("traineeVal", trainee);
		model.addObject("statusValue",statuss);
		model.addObject("skillValue",skills);
		
		model.addObject("trainees",traineeServiceImpl.findAll(pageable,keyword).getContent());
		
		if(keyword != null) {
			model.addObject("totalObjects", traineeServiceImpl.getSearchedTrainees(keyword).size());
		}
		else {
			model.addObject("totalObjects", traineeServiceImpl.getTrainees().size());
		}
		model.setViewName("welcome");
		
		return model;
	}
	
	@RequestMapping(value = "/v2", method = RequestMethod.GET)
	public ModelAndView welcome2() {
		ModelAndView model = new ModelAndView();
		
		Set<Skill> skills = EnumSet.allOf(Skill.class);
		model.addObject("skillValue",skills);
		
		model.setViewName("welcome2");
		return model;
	}
	
	@RequestMapping(value = "/findall" , method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Trainee> dataTableData() {
		List<Trainee> reqTrainee = traineeServiceImpl.getTrainees();
		return reqTrainee;
	}
	
	@RequestMapping(value="/checkEmail", method = RequestMethod.GET)
	@ResponseBody
	public String checkEmail(@RequestParam String email) {
		String match = "success";
		List<Trainee> reqTrainee = traineeServiceImpl.getTrainees();
		for(Trainee traine : reqTrainee) {
			if(traine.getEmail().equals(email)) {
				match = "failed";
				break;
			}
		}
		return match;
	}
	
	
	@RequestMapping(value="/update" , method = RequestMethod.PUT)
	@ResponseBody
	public String updateFunction(@RequestParam Integer id,@RequestParam Skill skill,@RequestParam Status status) {
		if(traineeServiceImpl.updateTrainee(id, skill, status) != null) {
			return "Updated Successfully";
		}
		return "Updation Failed";
	}

	
	@PostMapping("/addTraineeData")
	@ResponseBody
	public String insertData(@ModelAttribute TraineeEntity traineeEntity ){
		String reqId = traineeServiceImpl.addTrainee(traineeEntity);
		if(reqId != null) {
			if(reqId.equals("found")) {
				return "Email Id already exits";
			}
			return "Added Successfully"; 
		}
		return "Failed to add data";
	}
	
	@DeleteMapping(value = "/delete")
	@ResponseBody
	public String deleteFunction(@RequestParam Integer id) {
		Boolean val = traineeServiceImpl.deleteTrainee(id);
		if(val) {
			return "Deleted Successfully";
		}
		return "Failed to delete";
	}
}
