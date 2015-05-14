package kr.ac.ajou.groupho.springjpa.data;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MessageRepository extends JpaRepository<Message, Long> {
	
	List<Message> findByReceiver(String receiver);
	
	List<Message> findBySender(String sender);

}
