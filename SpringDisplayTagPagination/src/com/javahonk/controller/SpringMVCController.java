package com.javahonk.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SpringMVCController {

    @RequestMapping(value = "/paginationDisplayTag.web", method = 
            RequestMethod.GET)
    public String printWelcome(@ModelAttribute("person") 
    Person person,BindingResult result, ModelMap model, 
    HttpServletRequest request,
            HttpServletResponse response) {

	List<Person> personsList = new ArrayList<Person>();
        for (int i = 0; i < 223; i++) {
            Person person2 = new Person();
            person2.setName("JohnLandy"+i);
            person2.setPosition("System Architect"+i);
            person2.setSalary("$320,800");
            person2.setLocation("NY"+(i-1));
            person2.setPhone("999999999");
            personsList.add(person2);  
	}
        
        person.setPersonList(personsList);
        return "paginationDisplayTag";

    }

 
}