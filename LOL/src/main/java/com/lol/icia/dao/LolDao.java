package com.lol.icia.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.lol.icia.dto.Champion;
import com.lol.icia.dto.Champion_counter;

@Mapper
public interface LolDao {
	
	List<Champion> get_champion_info(String lane);

	Champion get_champion_detail_info(@Param("cid")int cid , @Param("lane") String lane);

	List<Champion> get_champion_info_winrate(String lane);

	List<Champion> get_champion_info_kda(String lane);

	List<Champion_counter> get_counter_up(@Param("cid")int cid , @Param("lane") String lane);

	List<Champion_counter> get_counter_down(@Param("cid")int cid , @Param("lane") String lane);

	Champion_counter get_relative_record(@Param("cid")int cid , @Param("lane") String lane, @Param("e_id")int e_id);

	int get_champion_total(@Param("rc_name1") String rc_name1, @Param("lane") String lane);

	int get_enemy_total(@Param("rc_name1") String rc_name1, @Param("lane") String lane);

	
}
