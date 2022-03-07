package net.koreate.sec;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import net.koreate.sec.dao.MemberDAO;
import net.koreate.sec.vo.ValidationMemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations= {"classpath:root/root-context.xml"}	
)
public class MemberTest {
	
	@Inject
	MemberDAO dao;
	
	@Test
	public void testDAO() {
		System.out.println(dao);
		ValidationMemberVO vo = new ValidationMemberVO();
		vo.setU_id("hap0p9y@nate.com");
		vo.setU_pw("!chlrlrms1");
		vo.setU_name("최기근");
		vo.setU_phone("01094867166");
		vo.setU_birth("19820207");
		vo.setU_post("58763");
		vo.setU_addr("부산광역시 동래구 충렬대로 84");
		vo.setU_addr_detail("영남빌딩 9층");
		dao.memberJoin(vo);
	}
	
}











