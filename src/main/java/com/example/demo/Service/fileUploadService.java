package com.example.demo.Service;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class fileUploadService {

	// 파일 디렉토리에 저장
	public String uploadFile(MultipartFile file) throws Exception {
		String imgPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\image\\";
		UUID uuid = UUID.randomUUID();
		String imgFileName = uuid + "_" + file.getOriginalFilename();
		File saveFile = new File(imgPath, imgFileName);
		file.transferTo(saveFile);
		return imgFileName;
	}
	
	// 파일 디렉토리에서 삭제
	public void deleteFile(String fileName) {
		String imgPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\image\\";
		File deleteFile = new File(imgPath+fileName);
		if(deleteFile.exists()) {
			if(deleteFile.delete()) {
				log.info("파일 삭제 성공 : " + fileName);
			}else {
				log.info("파일 삭제 실패 : " + fileName);
			}
		}
		else {	
			log.info("파일 찾기 실패 : " + fileName);
		}
	}
}
