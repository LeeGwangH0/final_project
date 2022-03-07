package net.koreate.booking.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.board.vo.BoardVO;
import net.koreate.booking.dao.BookingDAO;
import net.koreate.booking.vo.BookingVO;

@Service
public class BookingServiceImpl implements BookingService {

	@Inject
	BookingDAO dao;
	
	@Override
	public boolean register(BookingVO vo) throws Exception {
		
		if(dao.reservationConfirm(vo) == null ) {
			dao.register(vo);
			return true;

		}else {
			return false;
		}
		
		
		
	}

	@Override
	public List<BookingVO> listPage() throws Exception {
		List<BookingVO> list = dao.listPage();
		
		return list;
	}

}
