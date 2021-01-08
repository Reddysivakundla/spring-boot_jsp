package com.example.DTO;

public enum Skill {
	
	JAVA("Java"),
	C_SHARP("C Sharp"),
	AWS("AWS"),
	MEAN("MEAN"),
	MERN("MERN"),
	PYTHON("Python"),
	DEVOPS("Devops");
	
	
	private String name;
	
	Skill(String name){
		this.name = name;
	}
	
	public String getName() {
		return this.name;
	}
}
