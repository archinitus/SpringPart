package kr.ac.ajou.groupho.controllers;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileForm {
	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	

}
