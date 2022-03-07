package net.koreate.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.board.dao.BoardDAO;
import net.koreate.board.utils.Criteria;
import net.koreate.board.utils.PageMaker;
import net.koreate.board.vo.BoardVO;


@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;
	
	
	@Override
	public void regist(BoardVO vo) throws Exception {
		// INSERT title, content, uno
		dao.regist(vo);

		
		

	}


	@Override
	public List<BoardVO> listPage(Criteria cri) throws Exception {
		List<BoardVO> list = dao.listPage(cri);
		
		return list;
	}


	@Override
	public void updateCnt(int bno) throws Exception {
		dao.updateCnt(bno);
		
	}


	@Override
	public PageMaker getPageMaker(Criteria cri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setDisplayPageNum(5);
		int totalCount = dao.listCount(cri);
		pageMaker.setTotalCount(totalCount);
		return pageMaker;
	}


	@Override
	public BoardVO read(int bno) throws Exception {
		BoardVO vo = dao.read(bno);
//		List<String> fileList = dao.getAttach(bno);
//		vo.setFiles(fileList);
		System.out.println(vo);
		return vo;
	}


	
	@Override
	public void replyRegister(BoardVO vo) throws Exception {
		// 기존 글들의 seq 정렬 순서 값이 원본글 보다
		// 큰 긊을 가진 글이 존재하면 1씩 증가한 값으로 수정
		dao.updateReply(vo);
		// 원본글의 origin 값 , dept+1 , seq +1 한 값으로
		// 답변글 INSERT
		vo.setDepth(vo.getDepth()+1);
		vo.setSeq(vo.getSeq()+1);
		System.out.println("등록된 답변글 정보 : "+ vo);
		dao.replyRegister(vo);
		
	}


	@Override
	public void modify(BoardVO vo) throws Exception {
		// re_tbl_board1 정보 수정
		dao.modify(vo);
		
		
		
	}


	@Override
	public void remove(int bno) throws Exception {
		// 게시글 삭제
		dao.remove(bno);
		
	}

}
