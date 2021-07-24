package com.cds.academy.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.cds.academy.model.Message;

public interface MessageRepository extends MongoRepository<Message, String>{

	
	List<Message> findByUserId(String userid);
}
