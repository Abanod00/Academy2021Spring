package com.cds.academy.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cds.academy.model.Message;
import com.cds.academy.model.User;
import com.cds.academy.service.HastagService;
import com.cds.academy.service.MessageService;
import com.cds.academy.service.UserService;
import com.cds.academy.utils.Utils;

@Controller
@RequestMapping("/messages")
public class MessagesController {

	@Autowired
	MessageService menssagesService;

	@Autowired
	UserService userService;

	@Autowired
	HastagService hastagService;

	@GetMapping("")
	public String messages(HttpSession session, Model model) {

		if (!Utils.checkUserIsLog(session)) {
			return "redirect:/";
		}

		User user = (User) session.getAttribute("userLog");

		List<Message> messages = menssagesService.getLastMessages();

		for (Message message : messages) {
			if (message.getLikesUserID().contains(user.get_id())) {
				message.setUserLike(true);
			}
		}

		model.addAttribute("user", user);
		model.addAttribute("messages", messages);
		model.addAttribute("trendictopic", hastagService.getTrendingTopic());
		model.addAttribute("randomUsers", userService.getRandomUsers());
		model.addAttribute("messagesLike", menssagesService.getUserLikes(user.getLikes()));

		return "messages";
	}

	@PostMapping("/post")
	public ResponseEntity<?> postMessage(HttpSession session, Model model, @RequestBody Message message) {

		User user = (User) session.getAttribute("userLog");

		List<String> hastags = Utils.getHastags(((Message) message).getContent());

		Message m = new Message();

		m.setUserUsername(user.getUsername());
		m.setUserFullname(user.getFullname());
		m.setAvatar(user.getAvatar());
		Date date = new Date();
		m.setDate(date.toString());

		if (!message.getImages().isEmpty()) {
			m.setImages(message.getImages());
		}

		m.setLike(0);
		m.setContent(message.getContent());
		m.setLikesUserID(new HashSet<String>());
		m.setUserId(user.get_id());

		menssagesService.save(m);

		for (String hastag : hastags) {
			hastagService.save(hastag);
		}

		List<String> userMessages = user.getMessagesId();
		if (userMessages == null) {
			userMessages = new ArrayList<String>();
		}
		userMessages.add(m.get_id());
		user.setMessagesId(userMessages);
		userService.save(user);

		return new ResponseEntity<Message>(m, HttpStatus.OK);
	}

	@PostMapping("/like")
	public ResponseEntity<?> likeMessage(@RequestParam String uuid, HttpSession session, Model model) {
		User user = (User) session.getAttribute("userLog");
		Message message = menssagesService.likeMessage(uuid, user);
		return new ResponseEntity<Message>(message, HttpStatus.OK);
	}

}
