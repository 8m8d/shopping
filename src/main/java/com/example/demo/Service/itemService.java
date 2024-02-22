package com.example.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.DAO.itemMapper;
import com.example.demo.DTO.itemDTO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class itemService {

	@Autowired
	itemMapper itemMapper;
	@Autowired
	fileUploadService fileUploadService;
	
	public List<itemDTO>selectAll() {
		return itemMapper.selectAll();
	}
	public itemDTO detailOne(int itemNo) {
		return itemMapper.detailOne(itemNo);
	}
	public void addItem(itemDTO dto,MultipartFile file) throws Exception {
		String imgFileName = fileUploadService.uploadFile(file);
		dto.setImgFileName(imgFileName);
		dto.setImgFilePath("/image/" + imgFileName);
		itemMapper.addItem(dto);
	}
	public void itemUpdate(itemDTO dto, MultipartFile file) throws Exception {
		
		String existingFileName = itemMapper.detailOne(dto.getItemNo()).getImgFileName();
		
		if(file != null) {
			//	기존에 있던 이미지파일 삭제
			fileUploadService.deleteFile(itemMapper.detailOne(dto.getItemNo()).getImgFileName());
			// 새로 저장한 파일 업로드
			String newFileName = fileUploadService.uploadFile(file);
			// DB에 이미지 파일 경로 저장
			dto.setImgFileName(newFileName);
			dto.setImgFilePath("/image/" + newFileName);
		}else {
			dto.setImgFileName(existingFileName);
			dto.setImgFilePath("/image/" + existingFileName);
		}
		
		log.info("수정된 데이터 : " + dto);
		itemMapper.itemUpdate(dto);
	}
	
	public List<itemDTO>searchItem(String itemTitle){
		return itemMapper.searchItem(itemTitle);
	}
}
