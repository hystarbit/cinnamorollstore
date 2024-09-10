package com.cinnamoroll.store.item.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.cinnamoroll.store.item.ItemVO;

@Repository
public class ItemDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	private String uploadDir = "/Users/hwajung/Documents/work/uploadImage/";

	// 상품 추가
	public void insertItem(ItemVO vo) {
		MultipartFile file = vo.getUploadFile();

		if (!file.isEmpty()) {
			try {
				// 기존 파일명
				String originalFileName = file.getOriginalFilename();

				// 확장자 분리
				String extension = originalFileName.substring(originalFileName.lastIndexOf("."));

				// 중복 방지 이름
				String uniqueFileName = UUID.randomUUID().toString() + extension;

				// 저장할 경로
				File dir = new File(uploadDir);

				// 디렉토리 존재하지 않으면 생성
				if (!dir.exists()) {
					dir.mkdirs();
				}

				// 파일을 저장할 경로 생성
				File uploadFile = new File(uploadDir + uniqueFileName);

				// 파일을 해당 경로에 저장
				file.transferTo(uploadFile);

				// 파일명을 VO 객체에 설정
				vo.setImage(uniqueFileName);

				// 파일 정보와 함께 DB에 삽입
				mybatis.insert("ItemDAO.insertItem", vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	// 상품 수정
	public void updateItem(ItemVO vo) {
		MultipartFile newFile = vo.getUploadFile();

		if (newFile != null & !newFile.isEmpty()) {
			try {
				// 기존 이미지 파일명
				String existingFileName = vo.getImage();

				if (existingFileName != null && !existingFileName.isEmpty()) {
					File oldFile = new File(uploadDir + existingFileName);
					if (oldFile.exists()) {
						oldFile.delete();
					}
				}
				String originalFileName = newFile.getOriginalFilename();

				String extension = originalFileName.substring(originalFileName.lastIndexOf("."));

				String uniqueFileName = UUID.randomUUID().toString() + extension;

				File dir = new File(uploadDir);

				if (!dir.exists()) {
					dir.mkdirs();
				}

				File uploadFile = new File(uploadDir + uniqueFileName);

				newFile.transferTo(uploadFile);

				vo.setImage(uniqueFileName);

				mybatis.update("ItemDAO.updateItem", vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			mybatis.update("ItemDAO.updateItem", vo);
		}
	}

	// 상품 삭제
	public void deleteItem(ItemVO vo) {
		ItemVO item = (ItemVO) mybatis.selectOne("ItemDAO.getItem", vo);
		String existingImage = item.getImage();

		if (existingImage != null && !existingImage.isEmpty()) {
			System.out.println("나 여깄어. ");
			File imageFile = new File(uploadDir + existingImage);
			if (imageFile.exists()) {
				imageFile.delete();
				System.out.println("이미지 파일 삭제: ");
			}
		}

		mybatis.delete("ItemDAO.deleteItem", vo);
	}

	// 상품 세부 정보 보기
	public ItemVO getItem(ItemVO vo) {
		return (ItemVO) mybatis.selectOne("ItemDAO.getItem", vo);
	}

	// 상품 목록 보기
	public List<ItemVO> getItemList(ItemVO vo) {
		return mybatis.selectList("ItemDAO.getItemList", vo);
	}

	// 진열된 상품된 목록 보기
	public List<ItemVO> getItemDisplayList(ItemVO vo) {
		return mybatis.selectList("ItemDAO.getItemDisplayList", vo);
	}

	// 진열된 상품 카테고리 목록 보기
	public List<ItemVO> getItemCategoryList(ItemVO vo) {
		return mybatis.selectList("ItemDAO.getItemCategoryList", vo);
	}

	// 오늘 등록된 상품의 개수
	public int getTodayItemCount() {
		return mybatis.selectOne("ItemDAO.getTodayItemCount");
	}

}
