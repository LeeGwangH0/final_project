package net.koreate.sec.dao;

import net.koreate.sec.vo.ValidationMemberVO;

public interface MemberDAO {
	
	void memberJoin(ValidationMemberVO vo);

	ValidationMemberVO getMemberByID(String u_id) throws Exception;

	// 회원가입한 회원 기본 권한 추가 ROLE_USER
	void insertAuth(String u_id) throws Exception;

	void updateVistDate(String u_id) throws Exception;
	
}









