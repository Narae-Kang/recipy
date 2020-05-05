package com.kh.portfolio.controller;

import javax.persistence.Entity;
import javax.validation.constraints.Max;
import lombok.Data;

@Data		//lombok
@Entity	//유효성 체크 해주기 위해
public class Person {
	String name;
	@Max(value=30, message="30 미만 입력하세요!")
	int age;
}



