package com.cds.academy.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.cds.academy.model.Hastag;

public interface HastagRepository extends MongoRepository<Hastag, String> {

	Hastag findByContent();
	
	

}
