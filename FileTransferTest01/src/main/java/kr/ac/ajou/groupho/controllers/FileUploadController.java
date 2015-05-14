package kr.ac.ajou.groupho.controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String displayForm() {
		return "fileupload";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@RequestParam("to") String to, @RequestParam("from") String from, 
			@RequestParam("file") MultipartFile uploadForm, Model model) throws Exception {
		

		MultipartFile file = uploadForm;

		// File upload to local drive of server.
		if(file != null) {
			String fileName = file.getOriginalFilename();
			String path = "c:/spring_test/project/upload/" + fileName;
					
			File f = new File(path);
					
			file.transferTo(f);
			System.out.println("file names: " + fileName);
	
			model.addAttribute("to", to);
			model.addAttribute("from", from);
			model.addAttribute("file", fileName);
			return "success";	
		} else {
			return "fail";
		}
		
	}
	
	@RequestMapping(value = "/download", method=RequestMethod.GET, produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public FileSystemResource downloadFile(HttpServletResponse response) throws IOException {
		String fileName = "1.jpg";
		String path = "c:/spring_test/project/upload/" + fileName;
		
		File file = new File(path);
		
		response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
		
		return new FileSystemResource(file);
	}
	
	@RequestMapping(value = "/downloadpage", method = RequestMethod.GET)
	public String save(@RequestParam("to") String to, @RequestParam("from") String from, Model model) throws Exception {
		
		String downloadPath = "/download";

		model.addAttribute("to", to);
		model.addAttribute("from", from);
		model.addAttribute("downPath", downloadPath);
		
		return "downloadpage";	
		
		
	}
	

}
