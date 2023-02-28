package com.lol.icia.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors (chain = true)
@Alias ("champion")

public class Champion {
	int cid;
	String cn_eg;
	String cn_kr;
	String lane;
	double winrate;
	double pickrate;
	double kda;
}
