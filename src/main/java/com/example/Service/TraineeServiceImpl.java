package com.example.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.DTO.Skill;
import com.example.DTO.Status;
import com.example.DTO.Trainee;
import com.example.Entity.TraineeEntity;
import com.example.Repo.TraineeRepository;

@Service("traineeService")
public class TraineeServiceImpl implements TraineeService {
	
	private static final Logger logger = LogManager.getLogger(TraineeServiceImpl.class);
	
	@Autowired
	private TraineeRepository traineeRepository;

	@Override
	public List<Trainee> getTrainees() {
		
		List<Trainee> traineeList = new ArrayList<>();
		try {
			List<TraineeEntity> traineeEntityList = traineeRepository.findAll();
			for (TraineeEntity traineeEntity : traineeEntityList) {
				traineeList.add(TraineeEntity.convertTraineeEntity(traineeEntity));
			}
		}
		catch(Exception e) {
			logger.error(e.getMessage(),e);
		}
		return traineeList;
	}
	
	@Override
	public List<TraineeEntity> getSearchedTrainees(String keyword){
		List<TraineeEntity> traineeList = new ArrayList<>();
		try {
			traineeList = traineeRepository.searchTotal(keyword);
		}
		catch(Exception e) {
			logger.error(e.getMessage(),e);
		}
		return traineeList;
	}

	@Override
	public Page<Trainee> findAll(Pageable page,String keyword){
		// TODO Auto-generated method stub
		
		Page<TraineeEntity> pageValues = null;
		Page<Trainee> pageRequiredValues = null;
		
		if(keyword!=null) {
			pageValues = traineeRepository.search(keyword, page);
			pageRequiredValues = pageValues.map( x->TraineeEntity.convertTraineeEntity(x) );
		}
		else {
			pageValues = traineeRepository.findAll(page);
			pageRequiredValues = pageValues.map( x -> TraineeEntity.convertTraineeEntity(x) );
		
		}
		return pageRequiredValues;
	}

	@Override
	public String addTrainee(TraineeEntity traineeEntity) {
		TraineeEntity traineeEntity2 = null;
		String returnValue = "";
			try {
				String avail = "notfound";
				List<Trainee> traineeList = this.getTrainees();
				for(Trainee trainee : traineeList) {
					if(trainee.getEmail().equalsIgnoreCase(traineeEntity.getEmail())) {
						avail = "found";
						break;
					}
				}
				if(avail.equals("notfound")) {
					traineeEntity2 =  traineeRepository.saveAndFlush(traineeEntity);
					returnValue =  traineeEntity2.getId()+"";
				}
				else {
					returnValue = "found";
				}
			}
			catch(Exception e) {
				logger.error(e.getMessage(),e);
			}
			return returnValue;
	}

	@Override
	public TraineeEntity updateTrainee(Integer id, Skill skill, Status status) {
		// TODO Auto-generated method stub
		TraineeEntity traineeEntity = null;
		try {
			traineeEntity = traineeRepository.getOne(id);
			traineeEntity.setSkill(skill);
			traineeEntity.setStatus(status);
			traineeRepository.save(traineeEntity);
		}
		catch(Exception e) {
			logger.error(e.getMessage(),e);
		}
		return traineeEntity;
	}

	@Override
	public Boolean deleteTrainee(Integer id) {
		// TODO Auto-generated method stub
		TraineeEntity traineeEntity = null;
		try {
			traineeEntity = traineeRepository.getOne(id);
			traineeRepository.delete(traineeEntity);
		}
		catch(Exception e) {
			logger.error(e.getMessage(),e);
		}
		if(traineeEntity != null) {
			return true;
		}
		return false;
	}

}
