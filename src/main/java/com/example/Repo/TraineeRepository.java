package com.example.Repo;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.Entity.TraineeEntity;

public interface TraineeRepository extends JpaRepository<TraineeEntity, Integer> {
	
	@Query("SELECT t FROM TraineeEntity t WHERE CONCAT(t.traineeName,' ',t.email,' ',t.skill,' ',t.batch,' ',t.level,' ',t.status) LIKE %?1% ")
	public Page<TraineeEntity> search(String keyword,Pageable page);
	
	@Query("SELECT t FROM TraineeEntity t WHERE CONCAT(t.traineeName,' ',t.email,' ',t.skill,' ',t.batch,' ',t.level,' ',t.status) LIKE %?1% ")
	public List<TraineeEntity> searchTotal(String keyword);
}
