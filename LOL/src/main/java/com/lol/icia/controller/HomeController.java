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
	public String details(int cid,RedirectAttributes attr) {
		System.out.println("cid: "+cid);
		Champion c=CM.get_champion_detail_info(cid);
		attr.addAttribute("cid",cid);
//		attr.addAttribute("lane",lane);
		attr.addAttribute("champion",c);
		return "detail"; 
	}
	
}
