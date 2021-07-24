package com.cds.academy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cds.academy.model.User;
import com.cds.academy.service.UserService;

@RequestMapping("/login")
@Controller
public class LoginController {

	@Autowired
	private UserService userService;

	@GetMapping("")
	public String login(HttpSession session, Model model) {

		model.addAttribute("user", new User());

		User user = (User) session.getAttribute("userLog");

		if (user == null) {
			return "index";
		}

		return "redirect:/messages";

	}

	@PostMapping("/register")
	public String register(@ModelAttribute User user, HttpSession session, Model model) {

		User newUser = userService.findByUsername(user.getUsername());

		if (newUser != null) {
			session.setAttribute("errorMessage", "Name " + user.getUsername() + " already registered.");
			session.setAttribute("errorMessageBool", true);
			return "index";
		}

		session.removeAttribute("errorMessageBool");
		session.removeAttribute("errorMessage");
		newUser = userService.save(user);
		session.setAttribute("userLog", newUser);

		return "redirect:/messages";
	}

	@PostMapping("/log")
	public String loginPost(@ModelAttribute User user, HttpSession session, Model model) {

		User u = userService.findByNameAndPassword(user);

		if (u == null) {
			session.setAttribute("errorMessageBool", true);
			session.setAttribute("errorMessage", "Username/Password are incorrect.");
			return "redirect:/";
		}

		session.removeAttribute("errorMessageBool");
		session.removeAttribute("errorMessage");
		session.setAttribute("userLog", u);

		return "redirect:/messages";

	}

	@GetMapping("/logout")
	public ResponseEntity<?> logout(HttpSession session) {
		session.removeAttribute("userLog");
		
		return new ResponseEntity<>(HttpStatus.OK);
	}

}
