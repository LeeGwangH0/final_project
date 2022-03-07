package net.koreate.booking.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import net.koreate.booking.vo.BookingVO;

public interface BookingDAO {
	
	// 예약 등록
	@Insert("INSERT INTO booking(u_id, u_name, bookdate, people, request, u_no) "
			+ "VALUES(#{u_id},#{u_name},#{bookdate},#{people},#{request},#{u_no}) ")
	void register(BookingVO vo) throws Exception;

	// 예약 확인
	@Select("SELECT u_id FROM booking WHERE bookdate= #{bookdate};" )
	String reservationConfirm(BookingVO vo) throws Exception;

	@Select("SELECT * FROM booking")
	List<BookingVO> listPage();

}
