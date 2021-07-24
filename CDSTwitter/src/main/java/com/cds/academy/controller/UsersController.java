package com.cds.academy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cds.academy.model.Message;
import com.cds.academy.model.Response;
import com.cds.academy.model.User;
import com.cds.academy.service.MessageService;
import com.cds.academy.service.UserService;
import com.cds.academy.utils.Utils;

@Controller
@RequestMapping("/users")
public class UsersController {

	@Autowired
	MessageService messageService;

	@Autowired
	UserService userService;

	@GetMapping("")
	public String getAllUsers(HttpSession session, Model model) {

		if (!Utils.checkUserIsLog(session)) {
			return "redirect:/";
		}

		model.addAttribute("users", userService.findAll());

		return "users";

	}

	@PostMapping("/follow")
	public ResponseEntity<?> follow(@RequestParam String uuid, HttpSession session, Model model) {
		User user = (User) session.getAttribute("userLog");

		if (userService.follow(user, uuid)) {
			return new ResponseEntity<Response>(new Response(200, "Follow success."), HttpStatus.OK);
		}

		return new ResponseEntity<Response>(new Response(200, "Unfollow success."), HttpStatus.OK);

	}

	@GetMapping("/profile")
	public String getUserInfo(@RequestParam String uuid, HttpSession session, Model model) {
		if (!Utils.checkUserIsLog(session)) {
			return "redirect:/";
		}

		User user = (User) session.getAttribute("userLog");
		User userProfile = (User) userService.findById(uuid);

		List<User> follows = new ArrayList<User>();
		for (String uuidFollows : userProfile.getFollows()) {
			follows.add(userService.findById(uuidFollows));
		}

		int numberPhotos = 0;
		for (String messageuuid : userProfile.getMessagesId()) {
			Message m = messageService.findById(messageuuid);
			if (m.getImages() != null) {
				numberPhotos = numberPhotos + m.getImages().size();
			}

		}

		model.addAttribute("userProfile", userProfile);
		model.addAttribute("user", user);
		model.addAttribute("follows", follows);
		model.addAttribute("numberMessage", user.getMessagesId().size());
		model.addAttribute("numberPhotos", numberPhotos);

		return "profile";
	}
}
