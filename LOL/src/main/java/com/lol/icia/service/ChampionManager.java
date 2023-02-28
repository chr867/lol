package com.lol.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lol.icia.dao.LolDao;
import com.lol.icia.dto.Champion;

@Service
public class ChampionManager {
@Autowired
private LolDao LD;
	
	public List<Champion> get_champion_info(String lane) {
		List<Champion> c_info=LD.get_champion_info(lane);
		return c_info;
	}

	public Champion get_champion_detail_info(int cid,String lane) {
		Champion c=LD.get_champion_detail_info(cid,lane);
		return c;
	}

	public List<Champion> get_champion_info_winrate(String lane) {
		List<Champion> c_info=LD.get_champion_info_winrate(lane);
		return c_info;
	}

	public List<Champion> get_champion_info_kda(String lane) {
		List<Champion> c_info=LD.get_champion_info_kda(lane);
		return c_info;
	}

}
