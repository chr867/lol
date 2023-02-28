package com.lol.icia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lol.icia.dto.Champion;
import com.lol.icia.service.ChampionManager;

@Controller
public class HomeController {
	@Autowired
	public ChampionManager CM;
	
	@GetMapping("/")
	public String home() {
		return "Main";
	}
	
	@GetMapping("/detail")
	public ModelAndView details(int cid,String lane,RedirectAttributes attr) {
		System.out.println("cid: "+cid);
		System.out.println("lane: "+lane);
		Champion c=CM.get_champion_detail_info(cid,lane);
//		attr.addAttribute("cid",cid);
//		attr.addAttribute("lane",lane);
//		attr.addAttribute("champion",c);
		return new ModelAndView("detail").addObject("champion",c); 
	}
	
}
