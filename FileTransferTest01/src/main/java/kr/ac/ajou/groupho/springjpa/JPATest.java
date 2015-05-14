package kr.ac.ajou.groupho.springjpa;

import java.util.List;

import kr.ac.ajou.groupho.springjpa.config.Config;
import kr.ac.ajou.groupho.springjpa.data.Message;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class JPATest {
	
	public static void main(String[] args) {
		
		ApplicationContext ctx = new AnnotationConfigApplicationContext(Config.class);
		
		MessageManagerImpl mm = ctx.getBean(MessageManagerImpl.class);
		
		Message test1 = mm.insert("soowoong", "hyunjin", "c:/spring_test/project/upload/1.jpg");
		Message test2 = mm.insert("hyunjin", "soowoong", "c:/spring_test/project/upload/license.txt");
		
		System.err.println("All message: ");
		for(Message m : mm.findAll()) {
			System.err.println(m);
		}
		
		System.err.println("Find by sender(=soowoong): ");
		List<Message> foundedMsg = mm.findBySender("soowoong");
		for(Message m : foundedMsg) {
			System.err.println(m.toString());
		}
		
		// close the context
		((ConfigurableApplicationContext)ctx).close();
		
		// Why it doesn't work....
	}
}
