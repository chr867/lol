package com.lol.icia.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors (chain = true)
@Alias ("champion")

public class Champion {
	String cn_eg;
	String cn_kr;
	double win_rate;
	double pick_rate;
	double kda;
}
