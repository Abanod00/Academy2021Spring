package com.cds.academy.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cds.academy.model.User;
import com.cds.academy.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository userRepository;

	public User findByNameAndPassword(User user) {
		User u = userRepository.findByUsername(user.getUsername());

		if (u != null && u.getPassword().equals(user.getPassword())) {
			return u;
		}

		return null;
	}

	public List<User> findAll() {
		return userRepository.findAll();
	}

	public User save(User user) {
		return userRepository.save(user);
	}

	public User findByUsername(String username) {
		return userRepository.findByUsername(username);

	}

	public Object getRandomUsers() {
		List<User> users = new ArrayList<User>();
		for (int i = 0; i < 3; i++) {
			users.add(getRandomElement(userRepository.findAll()));
		}

		return users;
	}

	public User getRandomElement(List<User> list) {
		Random rand = new Random();
		return list.get(rand.nextInt(list.size()));
	}

	public boolean follow(User loguser, String followid) {

		HashSet<String> follows = loguser.getFollows();
		if (follows == null) {
			follows = new HashSet<String>();
		}

		if (follows.contains(followid)) {
			follows.remove(followid);
			loguser.setFollows(follows);
			userRepository.save(loguser);
			return false;
		} else {
			follows.add(followid);
			loguser.setFollows(follows);
			userRepository.save(loguser);
			return true;
		}

	}

	public User findById(String id) {
		return userRepository.findById(id).get();

	}

	public User update(User user, User userUpdate) {

		String userUsername = user.getUsername();
		String usernameUpdate = userUpdate.getUsername();
		
		if(!usernameUpdate.equals(userUsername)) {
			User dbuser = userRepository.findByUsername(usernameUpdate);
			if ( dbuser != null) {
				return null;
			}

		}

		
		if (usernameUpdate != null && usernameUpdate != "") {
			user.setUsername(usernameUpdate);
		}

		String fullnameUpdate = userUpdate.getFullname();
		if (fullnameUpdate != null && fullnameUpdate != "") {
			user.setFullname(fullnameUpdate);
		}

		String descriptionUpdate = userUpdate.getDescription();
		if (descriptionUpdate != null && descriptionUpdate != "") {
			user.setDescription(descriptionUpdate);
		}

		String avatarUpdate = userUpdate.getAvatar();
		if (avatarUpdate != null && avatarUpdate != "") {
			user.setAvatar(avatarUpdate);
		}

		user = userRepository.save(user);

		return user;

	}

}
