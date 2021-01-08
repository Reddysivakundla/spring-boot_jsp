package com.example.Entity;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.example.DTO.Skill;
import com.example.DTO.Status;
import com.example.DTO.Trainee;

@Entity
@Table(name = "assignment2")
public class TraineeEntity {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String traineeName;
	private String email;
	@Enumerated(EnumType.STRING)
	private Skill skill;
	private String batch;
	private Integer level;
	@Enumerated(EnumType.STRING)
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
	public static Trainee convertTraineeEntity(TraineeEntity traineeEntity) {
		Trainee trainee = new Trainee();
		trainee.setId(traineeEntity.getId());
		trainee.setTraineeName(traineeEntity.getTraineeName());
		trainee.setEmail(traineeEntity.getEmail());
		trainee.setSkill(traineeEntity.getSkill());
		trainee.setBatch(traineeEntity.getBatch());
		trainee.setLevel(traineeEntity.getLevel());
		trainee.setStatus(traineeEntity.getStatus());
		return trainee;
	}
	
}
