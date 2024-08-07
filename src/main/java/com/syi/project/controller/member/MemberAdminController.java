package com.syi.project.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.syi.project.model.Criteria;
import com.syi.project.model.EnrollVO;
import com.syi.project.model.PageDTO;
import com.syi.project.model.member.MemberVO;
import com.syi.project.model.syclass.SyclassVO;
import com.syi.project.service.member.AdminService;

@Controller
@RequestMapping(value = "/admin")
public class MemberAdminController {

	private static final Logger logger = LoggerFactory.getLogger(MemberAdminController.class);

	@Autowired
	private AdminService adminService;

	@Autowired
	private BCryptPasswordEncoder pwdEncoder;

	// 관리자 로그인 페이지 이동
	@GetMapping("login")
	public void loginGet() {
		logger.info("관리자 로그인 페이지 이동");
	}
	
	// 관리자 로그인
	@PostMapping("login")
	public String loginPost(HttpServletRequest request, MemberVO requestMember, RedirectAttributes rttr)
			throws Exception {
		

		MemberVO loginMember = adminService.selectLoginAdmin(requestMember);

		// 사용자 존재하지 않음
		if (loginMember == null) {
			rttr.addFlashAttribute("result", 1);
			return "redirect:/admin/login";
		}

		// 비밀번호 불일치
		if (!pwdEncoder.matches(requestMember.getMemberPwd(), loginMember.getMemberPwd())) {
			rttr.addFlashAttribute("result", 1);
			return "redirect:/admin/login";
		}

		// 미승인 회원
		if (!"Y".equals(loginMember.getMemberCheckStatus())) {
			rttr.addFlashAttribute("result", 0);
			return "redirect:/admin/login";
		}

		// 로그인 성공
		loginMember.setMemberPwd("");
		HttpSession session = request.getSession();
		session.setAttribute("loginMember", loginMember);
		return "redirect:/admin/main";
	}
	
	// 관리자 수강생 조회 페이지
	@GetMapping("member/list")
	public String memberListGet(Criteria cri, Model model) throws Exception {
		logger.info("관리자 수강 조회 페이지 접속");
		
		List<MemberVO> memberList = adminService.selectMemberList(cri);
		model.addAttribute("memberList", memberList);
		
		// 페이지 이동 인터페이스 데이터
		int total = adminService.selectTotalCount(cri);
		PageDTO pageMaker = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/member/list";
	}
	
	// 승인 처리
	@PostMapping("status-y")
	@ResponseBody
	public String memberChangeStatusYPost(int memberNo) {
		logger.info("승인 처리 중 for memberNo: {}", memberNo);
	    try {
	        int result = adminService.updateStatusY(memberNo);
	        logger.info("승인 처리의 result: {}", result);
	        return result > 0 ? "success" : "fail";
	    } catch (Exception e) {
	        logger.error("Error processing approval for memberNo: {}", memberNo, e);
	        return "error";
	    }
	}
	
	// 미승인 처리
	@PostMapping("status-n")
	@ResponseBody
	public String memberChangeStatusNPost(int memberNo) {
		logger.info("미승인 처리 중 for memberNo: {}", memberNo);
        try {
            int result = adminService.updateStatusN(memberNo);
            logger.info("미승인 처리의 result: {}", result);
            return result > 0 ? "success" : "fail";
        } catch (Exception e) {
            logger.error("Error processing disapproval for memberNo: {}", memberNo, e);
            return "error";
        }
	}
	
	// 회원 상세 페이지
	@GetMapping("/member/detail")
	public String memberDetail(int memberNo, Model model) throws Exception {
		logger.info("회원 상세 페이지");
		
		MemberVO member = adminService.selectMemberDetail(memberNo);
		List<SyclassVO> classList = adminService.selectClassList();
		model.addAttribute("member", member);
		model.addAttribute("classList", classList);
		return "admin/member/detail";
	}
	
	
	// 수강 신청
	@PostMapping("/member/enroll")
	public String memberEnroll(int memberNo, int classNo, RedirectAttributes rttr) {
		EnrollVO enroll = new EnrollVO();
		enroll.setMemberNo(memberNo);
		enroll.setClassNo(classNo);
		
		int result = adminService.insertEnroll(enroll);
		if(result != 0) {
			rttr.addFlashAttribute("enroll_result", "success");
		} else {
			rttr.addFlashAttribute("enroll_result", "fail");
		}

		/* return "redirect:/admin/member/detail"; */
		return "redirect:/admin/member/detail?memberNo=" + memberNo;
	}
	

}
