package com.study.springboot.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component //이 어노테이션이 달려있는 것들은 전부다 bean으로 설정해줌
public class Member {
	@Value("나문희")
	private String name;
	@Value("호박고구마")
	private String nickname;
	@Autowired
	@Qualifier("printerA")
	private Printer printer;
	
	public Member() {}
	
	public Member(String name, String nickname, Printer printer) {
		this.name = name;
		this.nickname=nickname;
		this.printer=printer;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setNickname(String nickname ) {
		this.nickname=nickname;
	}
	public void setPrinter(Printer printer) {
		this.printer = printer;
	}
	public void print() {
		printer.print("안녕!"+name+":"+nickname);
	}
	
}
