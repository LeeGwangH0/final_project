package net.koreate.booking.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Formatter;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.booking.service.BookingService;
import net.koreate.booking.vo.BookingVO;

@Controller
public class BookingController {

	@Inject
	BookingService bs;
	
	@GetMapping("user/bookingnow")
	public String bookingnow(BookingVO vo, RedirectAttributes rttr) throws Exception {
		System.out.println(vo);
		System.out.println(vo.getBookdate());
				
		if(bs.register(vo)) {
			rttr.addFlashAttribute("message","예약이 완료 되었습니다.");
			return "redirect:/user/booking";
		}else {
			rttr.addFlashAttribute("message","다른 날짜로 예약해주세요.");
			return "redirect:/user/booking";
			
		}
	}
}
