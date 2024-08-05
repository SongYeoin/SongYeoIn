package service.member;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.syi.project.model.member.MemberVO;
import com.syi.project.service.member.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberServiceTests {
	
    private static final Logger log = LoggerFactory.getLogger(MemberServiceTests.class);

    @Autowired
    private MemberService memberService;
    
    // 로그인
    @Test
    public void memberLoginTest() throws Exception {
		MemberVO member = new MemberVO();
		
		member.setMemberId("user01");
		member.setMemberPwd("user01@@");
		memberService.selectLoginMember(member);
			
		System.out.println("결과값 : " + memberService.selectLoginMember(member));

    	
    }

}
