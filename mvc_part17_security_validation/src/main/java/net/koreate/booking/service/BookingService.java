package net.koreate.booking.service;



import java.util.List;


import net.koreate.board.vo.BoardVO;
import net.koreate.booking.vo.BookingVO;

public interface BookingService {

	
	
	// 예약 등록
	boolean register(BookingVO vo) throws Exception;

	// 리스트 페이지
	List<BookingVO> listPage() throws Exception;
	
	

	


}
