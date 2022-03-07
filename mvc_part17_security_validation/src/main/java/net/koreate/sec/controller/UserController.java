package net.koreate.sec.controller;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.koreate.board.utils.Criteria;
import net.koreate.board.utils.PageMaker;
import net.koreate.booking.service.BookingService;
import net.koreate.sec.service.MemberService;
import net.koreate.sec.vo.ValidationMemberVO;

@Controller
public class UserController {
	
	
	
	@Inject
	JavaMailSender mailSender;
	
	@Inject
	BookingService bs;
	
	@Inject
	MemberService ms;
	
	@GetMapping("/user/index")
	public void index() {
		
	}
	
	@GetMapping("/user/about")
	public void about() {
		
	}
	@GetMapping("/user/service")
	public String service(Model model)throws Exception {
		
		model.addAttribute("list",bs.listPage());
		
		return "/user/service";
		
	}
	

	@GetMapping("/user/login")
	public String login(String message, Model model) {
		model.addAttribute("message", message);
		return "user/login";
	}

	@GetMapping("/user/join")
	public void join() {
	}

	@GetMapping("/user/logout")
	public void logout() {
	}
	
	// id 중복 체크
	@PostMapping("/user/uidCheck")
	@ResponseBody
	public boolean uidCheck(String u_id)throws Exception{
		boolean isCheck = ms.getMemberByID(u_id);
		System.out.println(isCheck);
		return isCheck;
	}
	
	@GetMapping("/checkEmail")
	@ResponseBody
	public String sendMail(
			@RequestParam("u_id") String email)throws Exception{
		System.out.println(email);
		String code = "";
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper
			= new MimeMessageHelper(message,"UTF-8");
		messageHelper.setFrom("gwangho669@gmail.com");
		messageHelper.setTo(email);
		messageHelper.setSubject("이메일 인증 코드 확인");
		for(int i=0; i<5; i++) {
			// 0~ 0.99999
			code += (int)(Math.random()*10);
		}
		System.out.println(code);
		String msg = "다음 인증 코드를 입력해주세요. <h3>" + code + "</h3>";
		messageHelper.setText(msg,true);
		mailSender.send(message);
		System.out.println("발신완료");
		return code;
	}	
	
	@PostMapping("/user/joinPost")
	public String joinPost(ValidationMemberVO vo) throws Exception{
		System.out.println(vo);
		ms.memberJoin(vo);
		return "redirect:/user/login";
	}

	
	/*
	 * @GetMapping("/board/listPage") public void listPage() {
	 * 
	 * }
	 */
	
	@GetMapping("/user/booking")
	public void booking() {
	}
	
}












