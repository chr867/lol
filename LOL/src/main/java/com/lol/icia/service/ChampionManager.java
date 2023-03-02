package com.lol.icia.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lol.icia.dao.LolDao;
import com.lol.icia.dto.Champion;
import com.lol.icia.dto.Champion_counter;

@Service
public class ChampionManager {
@Autowired
private LolDao LD;
	
	public List<Champion> get_champion_info(String lane) {
		List<Champion> c_info=LD.get_champion_info(lane);
		return c_info;
	}

//	public Champion get_champion_detail_info(int cid,String lane) {
//		Champion c=LD.get_champion_detail_info(cid,lane);
//		return c;
//	}
	
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

	public List<Champion_counter> get_counter_up(int cid, String lane) {
		List<Champion_counter> c=LD.get_counter_up(cid,lane);
		return c;
	}

	public List<Champion_counter> get_counter_down(int cid, String lane) {
		List<Champion_counter> c=LD.get_counter_down(cid,lane);
		return c;
	}

	public Champion_counter relative_record(int cid, String lane, int e_id) {
		Champion_counter c=LD.get_relative_record(cid,lane,e_id);
		return c;
	}

	public int get_champion_total(String rc_name1, String lane) {
		int total=LD.get_champion_total(rc_name1,lane);
		return total;
	}

	public int get_enemy_total(String rc_name1, String lane) {
		int total=LD.get_enemy_total(rc_name1,lane);
		return total;
	}

}
