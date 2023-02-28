package com.lol.icia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.lol.icia.dto.Champion;

@Mapper
public interface LolDao {
	
	List<Champion> get_champion_info(String lane);

	Champion get_champion_detail_info(@Param("cid")int cid , @Param("lane") String lane);
}
