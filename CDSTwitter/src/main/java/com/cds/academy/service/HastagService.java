package com.cds.academy.service;

import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cds.academy.model.Hastag;
import com.cds.academy.repository.HastagRepository;
import com.cds.academy.repository.MessageRepository;

@Service
public class HastagService {

	@Autowired
	MessageRepository messageRepository;
	
	@Autowired
	HastagRepository hastagRepository;
	
	public List<Hastag> getTrendingTopic(){
		List<Hastag> tt = hastagRepository.findAll();
		tt.sort(Comparator.comparingInt(Hastag::getCount));
		
		if(tt.size() >= 3){
			return tt.subList(tt.size()-3, tt.size());
		}
		return tt;
	}

	public Hastag save(String hastag) {
		Hastag dbhastag= null;
		
		List<Hastag> hastags = hastagRepository.findAll();
		for (Hastag h : hastags) {
			if(h.getContent().equals(hastag)) {
				dbhastag = h;
			}
		}
		
		if(dbhastag == null) {
			Hastag newHastag = new Hastag();
			newHastag.setContent(hastag);
			newHastag.setCount(1);
			hastagRepository.save(newHastag);
			return newHastag;		
		}else {
			dbhastag.setCount(dbhastag.getCount()+1);
			hastagRepository.save(dbhastag);
			return dbhastag;
		}

	}

	
}
