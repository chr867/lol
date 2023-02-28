package com.lol.icia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lol.icia.dto.Champion;
import com.lol.icia.dto.Champion_counter;
import com.lol.icia.service.ChampionManager;

@RestController
public class RestChampionController {
	@Autowired
	public ChampionManager CM;
	
	@GetMapping("/getcounter-up")
	public List<Champion_counter> counter_up(int cid,String lane) {
		List<Champion_counter> c=CM.get_counter_up(cid,lane);
		return c;
	}
	
	@GetMapping("/getcounter-down")
	public List<Champion_counter> counter_down(int cid,String lane) {
		System.out.println("counter 호출");
		List<Champion_counter> c=CM.get_counter_down(cid,lane);
		return c;
	}
	
	@GetMapping("/getinfo")
	public List<Champion> main (String lane) {
		System.out.println("lane: "+lane);
		List<Champion> c_info = CM.get_champion_info(lane);
		return c_info;
	}
	
	@GetMapping("/getinfo-winrate")
	public List<Champion> winrate (String lane) {
		System.out.println("lane: "+lane);
		List<Champion> c_info = CM.get_champion_info_winrate(lane);
		return c_info;
	}
	
	@GetMapping("/getinfo-kda")
	public List<Champion> kda (String lane) {
		System.out.println("lane: "+lane);
		List<Champion> c_info = CM.get_champion_info_kda(lane);
		return c_info;
	}
	
	
	
//	@GetMapping("/getdetail")
//	public Champion detail (int cid,String lane) {
//		Champion c=CM.get_champion_detail_info(cid,lane);
//		return c;
//	}
}
