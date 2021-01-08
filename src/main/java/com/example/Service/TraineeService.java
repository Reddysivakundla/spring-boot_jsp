package com.example.Service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.DTO.Skill;
import com.example.DTO.Status;
import com.example.DTO.Trainee;
import com.example.Entity.TraineeEntity;

public interface TraineeService {
	
	public List<Trainee> getTrainees();
	public List<TraineeEntity> getSearchedTrainees(String keyword);
	public Page<Trainee> findAll(Pageable page,String keyword);
	public String addTrainee(TraineeEntity traineeEntity);
	public TraineeEntity updateTrainee(Integer id,Skill skill, Status status);
	public Boolean deleteTrainee(Integer id);
}
