package com.lol.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lol.icia.dao.LolDao;
import com.lol.icia.dto.Champion;

public class ChampionManager {
@Autowired
private LolDao LD;
	
	public List<Champion> get_champion_info(String lane) {
		List<Champion> c_info=LD.get_champion_info(lane);
		return c_info;
	}

	public Champion get_champion_detail_info(String cn_kr, String lane) {
		Champion c=LD.get_champion_detail_info(cn_kr,lane);
		return c;
	}

}
