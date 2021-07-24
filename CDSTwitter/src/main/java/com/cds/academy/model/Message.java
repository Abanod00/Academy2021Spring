package com.cds.academy.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "message")
public class Message implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private String _id;

	private String content;
	private String date;
	private Date timestamp;
	private int like;
	HashSet<String> likesUserID;
	private List<Message> conversation;
	String avatar;
	
	String userFullname;
	String userUsername;
	String userId;
	
	List<String> images;

	boolean userLike;

	public Message() {
		this.timestamp = new Date();
	}

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getUserFullname() {
		return userFullname;
	}

	public void setUserFullname(String userFullname) {
		this.userFullname = userFullname;
	}

	public String getUserUsername() {
		return userUsername;
	}

	public void setUserUsername(String userUsername) {
		this.userUsername = userUsername;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public List<Message> getConversation() {
		return conversation;
	}

	public void setConversation(List<Message> conversation) {
		this.conversation = conversation;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<String> getImages() {
		return images;
	}

	public void setImages(List<String> images) {
		this.images = images;
	}

	public HashSet<String> getLikesUserID() {
		return likesUserID;
	}

	public void setLikesUserID(HashSet<String> likesUserID) {
		this.likesUserID = likesUserID;
	}

	public boolean isUserLike() {
		return userLike;
	}

	public void setUserLike(boolean userLike) {
		this.userLike = userLike;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	
}
