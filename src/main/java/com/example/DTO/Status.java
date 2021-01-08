package com.example.DTO;

public enum Status {
	IN_TRAINING("In training"),
	INTERVIEWS("Interviews"),
	ASSGINMENTS("Assignments");
	
	private String statusName;
	
	Status(String statusName){
		this.statusName = statusName;
	}

	public String getStatusName() {
		return statusName;
	}
	
}
