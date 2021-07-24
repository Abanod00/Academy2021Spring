package com.cds.academy.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cds.academy.model.Message;
import com.cds.academy.model.User;
import com.cds.academy.repository.MessageRepository;
import com.cds.academy.repository.UserRepository;

@Service
public class MessageService {

	@Autowired
	MessageRepository messageRepository;

	@Autowired
	UserRepository userRepository;

	public List<Message> getLastMessages() {
		List<Message> messages = messageRepository.findAll();
		if (messages.size() >= 10) {
			messages = messages.subList(messages.size() - 10, messages.size());
		}

		Collections.sort(messages, new Comparator<Message>() {
			public int compare(Message o1, Message o2) {
				return o2.getTimestamp().compareTo(o1.getTimestamp());
			}
		});

		return messages;
	}

	public Message likeMessage(String uuid, User user) {

		Message message = messageRepository.findById(uuid).get();

		HashSet<String> likes = user.getLikes();

		user.setLikes(likes);

		if (message.getLikesUserID().contains(user.get_id())) {
			message.setLike(message.getLike() - 1);
			HashSet<String> messagesUsers = message.getLikesUserID();
			messagesUsers.remove(user.get_id());
			message.setLikesUserID(messagesUsers);

			likes.remove(message.get_id());

		} else {
			message.setLike(message.getLike() + 1);
			HashSet<String> messagesUsers = message.getLikesUserID();
			messagesUsers.add(user.get_id());
			message.setLikesUserID(messagesUsers);

			likes.add(message.get_id());

		}

		userRepository.save(user);
		messageRepository.save(message);
		return message;
	}

	public Message save(Message m) {
		return messageRepository.save(m);

	}

	public Object getUserLikes(HashSet<String> likes) {
		List<Message> messages = new ArrayList<Message>();
		for (String uuid : likes) {
			messages.add(messageRepository.findById(uuid).get());
		}
		return messages;
	}

	public Message findById(String messageuuid) {
		return messageRepository.findById(messageuuid).get();

	}

	public List<Message> findByUserId(String userid) {
		return messageRepository.findByUserId(userid);

	}

	public void updateMessages(List<Message> userMessages, String avatar, String fullname, String username) {

		for (Message message : userMessages) {
			message.setAvatar(avatar);
			message.setUserFullname(fullname);
			message.setUserUsername(username);
			save(message);
		}

	}

}
