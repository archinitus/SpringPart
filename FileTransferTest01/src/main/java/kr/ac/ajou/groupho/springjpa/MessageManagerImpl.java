package kr.ac.ajou.groupho.springjpa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.ac.ajou.groupho.springjpa.data.Message;
import kr.ac.ajou.groupho.springjpa.data.MessageRepository;

public class MessageManagerImpl implements MessageManager {
	
	@Autowired
	private MessageRepository repo;

	@Override
	public Message insert(String sender, String receiver, String filePath) {
		Message msg = repo.save(new Message(sender, receiver, filePath));
		return msg;
	}


	@Override
	public Message findOne(long id) {
		return repo.findOne(id);
	}
	
	
	@Override
	public List<Message> findAll() {
		return repo.findAll();
	}

	@Override
	public List<Message> findBySender(String sender) {
		return repo.findBySender(sender);
	}

	@Override
	public List<Message> findByReceiver(String receiver) {
		return repo.findByReceiver(receiver);
	}

	@Override
	public int update(Message m) {
		if(repo.findOne(m.getId()) != null) {
			repo.save(m);
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public int delete(Message m) {
		if(repo.findOne(m.getId()) != null) {
			repo.delete(m);
			return 1;
		} else {
			return 0;
		}
	}



}
