package com.lol.icia.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors (chain = true)
@Alias ("counter")
public class Champion_counter {
	String lane;
	String champ;
	String c_id;
	String win;
	int match;
	double winrate;
	String enemy;
	String cn_eg;
	String e_id;
}
