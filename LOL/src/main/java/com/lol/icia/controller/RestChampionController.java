package com.lol.icia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lol.icia.dto.Champion;
import com.lol.icia.service.ChampionManager;

@RestController
public class RestChampionController {
	@Autowired
	public ChampionManager CM;
	
	@GetMapping("/getinfo")
	public List<Champion> main (String lane) {
		System.out.println("lane: "+lane);
		List<Champion> c_info = CM.get_champion_info(lane);
		return c_info;
	}
	
	@GetMapping("/getdetail")
	public Champion detail (String cn_id,String lane) {
		Champion c=CM.get_champion_detail_info(cn_id,lane);
		return c;
	}
}
