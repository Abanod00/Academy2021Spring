package com.cds.academy.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import com.cds.academy.model.User;

public class Utils {

	public static boolean checkUserIsLog(HttpSession session) {
		if(session.getAttribute("userLog") != null) {
			return true;
		}
		return false;
	}
	
	public static List<String> getHastags(String message){
		List<String> hastags = new ArrayList<String>();
		
		Pattern regex = Pattern.compile(".*?\\s(#\\w+).*?");
		Matcher regexMatcher = regex.matcher(String.valueOf(message));
		while (regexMatcher.find()) {
			hastags.add(regexMatcher.group(1));
		}
		
		return hastags;
	}

	public static void updateSessionUser(HttpSession session, User user) {
		session.setAttribute("userLog", user);
	}
	
}
