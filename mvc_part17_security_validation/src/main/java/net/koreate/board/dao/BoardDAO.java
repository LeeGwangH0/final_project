package net.koreate.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.board.utils.Criteria;
import net.koreate.board.vo.BoardVO;

public interface BoardDAO {

	// 게시글 등록
	@Insert("INSERT INTO re_tbl_board1(title, content, u_no) "
			+ " VALUES(#{title}, #{content}, #{u_no})")
	void regist(BoardVO vo) throws Exception;

	// 게시글 목록 검색
	@Select("SELECT B.*, V.u_name AS writer FROM re_tbl_board1 AS B NATURAL JOIN validation_member AS V ORDER BY B.origin DESC , B.seq ASC limit #{pageStart}, #{perPageNum};")
	List<BoardVO> listPage(Criteria cri);

	// 조회수 증가
	@Update("UPDATE re_tbl_board1 SET viewcnt = viewcnt +1 WHERE bno = #{bno}" )
	void updateCnt(int bno);

	// re_tbl_board1 의 전체 게시물 수
	@Select("SELECT count(*) FROM re_tbl_board1")
	int listCount(Criteria cri);

	// 게시글 번호가 일치하는 한개의 게시글 정보 검색
	@Select("SELECT B.*, V.u_name AS writer "
			+ "FROM re_tbl_board1 AS B NATURAL JOIN validation_member AS V "
			+ "WHERE B.bno = #{bno}")	
	BoardVO read(int bno) throws Exception;

	// 답변글 들의 정렬 값 수정
	@Update("UPDATE re_tbl_board1 SET seq = seq +1 "
			+ " WHERE origin = #{origin} AND seq > #{seq} ")
	void updateReply(BoardVO vo) throws Exception;

	// 답변글 등록
	@Insert("INSERT INTO re_tbl_board1(title,content,origin,depth,seq,u_no) "
			  + " VALUES(#{title},#{content},#{origin},#{depth},#{seq},#{u_no})")
	void replyRegister(BoardVO vo);

	// re_tbl_board1 title,content,updatedate 수정
	@Update("UPDATE re_tbl_board1 SET "
			+ " title = #{title} ,"
			+ " content = #{content} ,"
			+ " updatedate = now() "
			+ " WHERE bno = #{bno}")
	void modify(BoardVO vo);

	
	// 게시글 삭제 처리 showboard ='N'
	@Update("UPDATE re_tbl_board1 SET showboard = 'N' "
			+ " WHERE bno = #{bno}")
	void remove(int bno) throws Exception;
	
}
