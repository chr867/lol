package com.lol.icia.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lol.icia.dto.Champion;
import com.lol.icia.dto.Champion_counter;
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
	public ModelAndView details(int cid,String lane) {
		System.out.println("cid: "+cid);
		System.out.println("lane: "+lane);
		Champion c=CM.get_champion_detail_info(cid,lane);
		return new ModelAndView("detail").addObject("champion",c); 
	}
	
	@GetMapping(value =  "/counter", produces = "application/json;charset=UTF-8" )
	public @ResponseBody ModelAndView counter(int cid,String lane,int e_id) {
		Champion_counter c=CM.relative_record(cid,lane,e_id);
		Champion champion = CM.get_champion_detail_info(cid, lane);
		Champion enemy = CM.get_champion_detail_info(e_id, lane);
		int champion_total = CM.get_champion_total(champion.getCn_kr(),lane);
		int enemy_total = CM.get_enemy_total(enemy.getCn_kr(),lane);
		
		return new ModelAndView("counter").addObject("c",c)
				.addObject("champion",champion)
				.addObject("enemy",enemy)
				.addObject("champion_total",champion_total)
				.addObject("enemy_total",enemy_total);
	}
	
}
