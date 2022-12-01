package mapperInterface;

import java.util.List;

import criteria.Criteria;
import vo.BoardVO;
import vo.PdboardVO;
import vo.ReplyVO;
import vo.VoteTableVO;

public interface BoardMapper {

	
	//------board------
	List<BoardVO> bsearchList(Criteria cri); // 게시판검색
	List<BoardVO> bmainSearch(Criteria cri); // 통합검색
	List<BoardVO> bcriList(Criteria cri); //페이징
	List<BoardVO> boardTotal();  // 게시판 글수확인
	List<BoardVO> homeBoardList(); // 홈 추천순 게시글보기
	BoardVO bselectOne(BoardVO vo); // 게시판 상세보기

	int bcriTotalCount(); // 페이징수 확인
	int bsearchCount(Criteria cri);
	int binsert(BoardVO vo); // 새글입력
	int bupdate(BoardVO vo); // 글수정
	int bdelete(BoardVO vo); // 글삭제
	int bcountUp(BoardVO vo); // 조회수증가
	int brCount(BoardVO vo); // 댓글갯수 확인
	int bvoteUp(BoardVO vo); // 추전수 증가
	int bvoteDown(BoardVO vo); // 추천수 감소
	
	//------pdboard------	
	List<PdboardVO> pdbsearchList(Criteria cri);
	List<PdboardVO> pdbmainSearch(Criteria cri);
	List<PdboardVO> pdbcriList(Criteria cri);
	List<PdboardVO> pdboardTotal(); 
	List<PdboardVO> pdhomeBoardList(); 
	PdboardVO pdbselectOne(PdboardVO vo);
	PdboardVO pdselectMusic(PdboardVO vo); // 작곡 게시판 노래선택
	
	int pdbcriTotalCount();
	int pdbsearchCount(Criteria cri);
	int pdbinsert(PdboardVO vo);
	int pdbupdate(PdboardVO vo);
	int pdbdelete(PdboardVO vo);
	int pdbcountUp(PdboardVO vo);
	int pdbrCount(PdboardVO vo);
	int pdbvoteUp(PdboardVO vo);
	int pdbvoteDown(PdboardVO vo);
	
	//------VoteTable------	
	int bvoteTableUp(VoteTableVO vo); // 추천정보 저장
	int bvoteTableDown(VoteTableVO vo); // 추천정보 삭제
	int bvoteTableSelect(BoardVO vo); // 추천전보 검색
	
	//---------------------
	int pdbvoteTableUp(VoteTableVO vo);
	int pdbvoteTableDown(VoteTableVO vo);
	int pdbvoteTableSelect(PdboardVO vo);
}