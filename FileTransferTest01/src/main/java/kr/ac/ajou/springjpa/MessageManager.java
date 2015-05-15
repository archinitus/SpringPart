package kr.ac.ajou.springjpa;

import java.util.List;

import kr.ac.ajou.springjpa.data.Message;

public interface MessageManager {
	
	Message insert(String sender, String receiver, String filePath, String textMessage);
	
	Message findOne(long id);
	
	List<Message> findAll();
	
	List<Message> findBySender(String sender);
	
	List<Message> findByReceiver(String receiver);
	
	int update(Message m);
	
	int delete(Message m);

}
