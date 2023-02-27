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
		List<Champion> c_info = CM.get_champion_info(lane);
		for(int i=0;i<c_info.size();i++) {
			if(c_info.get(i).getPick_rate()<=0.5) {
				c_info.remove(i);
			}
		}
		return c_info;
	}
	
	@GetMapping("/getdetail")
	public Champion detail (String cn_kr,String lane) {
		Champion c=CM.get_champion_detail_info(cn_kr,lane);
		return c;
	}
}
