package kr.ac.ajou.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import kr.ac.ajou.springjpa.MessageManager;
import kr.ac.ajou.springjpa.MessageManagerImpl;
import kr.ac.ajou.springjpa.config.Config;
import kr.ac.ajou.springjpa.data.Message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
	
	@Autowired
	private MessageManager manager;
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String displayForm() {
		return "fileupload";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@RequestParam("to") String receiver, @RequestParam("from") String sender, @RequestParam("textMessage") String textMessage,
			@RequestParam("file") MultipartFile uploadForm, Model model) throws Exception {
		

		MultipartFile file = uploadForm;

		// File upload to local drive of server.
		if(file != null) {
			String fileName = file.getOriginalFilename();
			String path = "c:/spring_test/project/upload/" + fileName;
					
			File f = new File(path);
					
			file.transferTo(f);
			System.out.println("file names: " + fileName);
			System.err.println("textMessage: " + textMessage);
			
			manager.insert(sender, receiver, path, textMessage);
			
			
			
			List<Message> msgs = manager.findAll();
			for(Message m : msgs) {
				System.err.println(m.toString());
			}
			
		
			model.addAttribute("to", receiver);
			model.addAttribute("from", sender);
			model.addAttribute("file", fileName);
			model.addAttribute("textMessage", textMessage);
			return "success";	
		} else {
			return "fail";
		}
		
	}
	
	@RequestMapping(value = "/dbtest")
	public void TestDB() throws Exception {
		
		List<Message> msgs = manager.findAll();
		for(Message m : msgs) {
			System.err.println(m.toString());
		}
		
	}
	
	@RequestMapping(value = "/testdb", method = RequestMethod.GET)
	public String testDB() {
		List<Message> msgs = manager.findAll();
		for(Message m : msgs) {
			System.err.println(m.toString());
		}
		
		return "home";
	}
	
	
	@RequestMapping(value = "/download", method=RequestMethod.GET, produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public FileSystemResource downloadFile(@RequestParam("path") String path, HttpServletResponse response) throws IOException {
		
		
		File file = new File(path);
		
		response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
		
		return new FileSystemResource(file);
	}
	
	@RequestMapping(value = "/downloadpage", method = RequestMethod.GET)
	public String save(@RequestParam("to") String receiver, Model model) throws Exception {
		
		String path = null;
		String sender = null;
		String textMsg = null;
		
		List<Message> foundedMsg = manager.findByReceiver(receiver);
		for(Message m : foundedMsg) {
			System.err.println(m.toString());
			path = m.getFilePath();
			sender = m.getSender();
			textMsg = m.getTextMessage();
		}
		
		String downloadPath = "/download?path=" + path;

		
		model.addAttribute("to", receiver);
		model.addAttribute("from", sender);
		model.addAttribute("textMessage", textMsg);
		model.addAttribute("downPath", downloadPath);
		
		return "downloadpage";	
		
		
	}
	

}
