package com.syi.project.controller.notice;

import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;

import com.syi.project.model.Criteria;
import com.syi.project.model.EnrollVO;
import com.syi.project.model.PageDTO;
import com.syi.project.model.member.MemberVO;
import com.syi.project.model.notice.NoticeFileVO;
import com.syi.project.model.notice.NoticeVO;
import com.syi.project.service.enroll.EnrollService;
import com.syi.project.service.notice.NoticeService;


@Controller
@RequestMapping("member/notice")
public class NoticeMemberController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeMemberController.class);

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private EnrollService enrollService;

	// 공지사항 조회
	@GetMapping("list")
	public String noticeList(Criteria cri, Model model, HttpSession session,
            					@RequestParam(value = "classNo", required = false) Integer classNo) throws Exception {
		logger.info("공지사항 조회 페이지");

		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();


		// 전체 공지 조회
		List<NoticeVO> noticeList = noticeService.selectNoticeList(cri);
		model.addAttribute("noticeList", noticeList);

		// classNo가 null 이거나 유효하지 않을 떄
		int syclassNo = (classNo != null && classNo > 0) ? classNo : enrollService.selectClassNo(memberNo);
		
		// 반 공지 조회
		List<NoticeVO> noticeClassList = noticeService.selectNoticeClassList(cri, syclassNo);
		model.addAttribute("noticeClassList", noticeClassList);
		
		// 수강 중인 반 조회
		List<EnrollVO> classList = enrollService.selectEnrollList(memberNo);
		System.out.println(">>>classList " + classList);
		model.addAttribute("classList", classList);

		int total = noticeService.selectNoticeTotal(cri, syclassNo);
		PageDTO pageMaker = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMaker);
		return "member/notice/list";
	}

	// 공지사항 상세 조회
	@GetMapping("detail")
	public String noticeDetail(int noticeNo, Model model) {
		logger.info("상세 조회");
		NoticeVO notice = noticeService.selectNoticeDetail(noticeNo);
		model.addAttribute("notice", notice);
		List<NoticeFileVO> fileList = noticeService.selectNoticeFiles(noticeNo);
		model.addAttribute("fileList", fileList);
		return "member/notice/detail";
	}

	@GetMapping("/download")
	public ResponseEntity<Resource> downloadAttachment(@RequestParam("fileNo") int fileNo) {
		// 파일 정보 조회
		NoticeFileVO file = noticeService.selectNoticeFile(fileNo);
		String filePath = file.getFilePath();
		Path path = Paths.get("C:\\upload\\temp" + filePath);
		Resource resource = new FileSystemResource(path);

		if (!resource.exists()) {
			return ResponseEntity.notFound().build();
		}

		// 원본 파일 이름과 인코딩된 파일 이름을 설정
		String originalFilename = file.getFileOriginalName();
		String encodedFilename = UriUtils.encodePathSegment(originalFilename, StandardCharsets.UTF_8);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", encodedFilename);

		return new ResponseEntity<>(resource, headers, HttpStatus.OK);
	}

}