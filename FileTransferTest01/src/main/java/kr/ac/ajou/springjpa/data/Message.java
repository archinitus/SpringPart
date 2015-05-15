package kr.ac.ajou.springjpa.data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Message {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	private String sender;
	private String receiver;
	private String filePath;
	private String textMessage;
	
	public Message() {
		
	}
	
	public Message(Long id, String sender, String receiver, String filePath, String textMessage) {
		this(sender, receiver, filePath, textMessage);
		this.id = id;
	}
	
	public Message(String sender, String receiver, String filePath, String textMessage) {
		this.sender = sender;
		this.receiver = receiver;
		this.filePath = filePath;
		this.textMessage = textMessage;
	}
	
	public String getTextMessage() {
		return textMessage;
	}

	public void setTextMessage(String textMessage) {
		this.textMessage = textMessage;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public String toString() {
		return "Message [id=" + id +", sender=" + sender + ", receiver=" + receiver
				+ ", filePath=" + filePath + ", MSG=" + textMessage + "]";
	}

}
