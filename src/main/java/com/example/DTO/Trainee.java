package com.example.DTO;

import com.example.Entity.TraineeEntity;

public class Trainee {
	
	private Integer id;
	private String traineeName;
	private String email;
	private Skill skill;
	private String batch;
	private Integer level;
	private Status status;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTraineeName() {
		return traineeName;
	}
	public void setTraineeName(String traineeName) {
		this.traineeName = traineeName;
	}

	public String getBatch() {
		return batch;
	}
	public void setBatch(String batch) {
		this.batch = batch;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	
	public Skill getSkill() {
		return skill;
	}
	public void setSkill(Skill skill) {
		this.skill = skill;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public static TraineeEntity convertTrainee(Trainee trainee) {
		TraineeEntity traineeEntity = new TraineeEntity();
		traineeEntity.setId(trainee.getId());
		traineeEntity.setTraineeName(trainee.getTraineeName());
		traineeEntity.setEmail(trainee.getEmail());
		traineeEntity.setSkill(trainee.getSkill());
		traineeEntity.setBatch(trainee.getBatch());
		traineeEntity.setLevel(trainee.getLevel());
		traineeEntity.setStatus(trainee.getStatus());
		return traineeEntity;
	}
	
}
