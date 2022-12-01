package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criteria.Criteria;
import mapperInterface.BoardMapper;
import vo.BoardVO;
import vo.PdboardVO;
import vo.VoteTableVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper mapper;
	
	//-2022/11/04수정-----------------------------------------------------------------------------------------------------------------	
	
	//------board------
	
	@Override
	public List<BoardVO> bsearchList(Criteria cri) { // 게시판검색
		return mapper.bsearchList(cri);
	}
	@Override
	public List<BoardVO> bmainSearch(Criteria cri) { // 통합검색
		return mapper.bmainSearch(cri);
	}
	@Override
	public List<BoardVO> bcriList(Criteria cri) { //페이징
		return mapper.bcriList(cri);
	}
	@Override
	public List<BoardVO> boardTotal() { // 게시판 글수확인
		return mapper.boardTotal();
	}
	@Override
	public List<BoardVO> homeBoardList() { // 홈 추천순 게시글보기
		return mapper.homeBoardList();
	}
	@Override
	public BoardVO bselectOne(BoardVO vo) { // 게시판 상세보기
		return mapper.bselectOne(vo);
	}
	@Override
	public int bcriTotalCount() {  // 페이징수 확인
		return mapper.bcriTotalCount();
	}
	@Override
	public int bsearchCount(Criteria cri) {
		return mapper.bsearchCount(cri);
	}
	@Override
	public int binsert(BoardVO vo) { // 새글입력
		return mapper.binsert(vo);
	} 
	@Override
	public int bupdate(BoardVO vo) { // 글수정
		return mapper.bupdate(vo);
	}
	@Override
	public int bdelete(BoardVO vo) { // 글삭제
		return mapper.bdelete(vo);
	}
	@Override
	public int bcountUp(BoardVO vo) { // 조회수증가
		return mapper.bcountUp(vo);
	}
	@Override
	public int brCount(BoardVO vo) { // 댓글갯수 확인
		return mapper.brCount(vo);
	}
	@Override
	public int bvoteUp(BoardVO vo) { // 추전수 증가
		return mapper.bvoteUp(vo);
	}
	@Override
	public int bvoteDown(BoardVO vo) { // 추천수 감소
		return mapper.bvoteDown(vo);
	}


	
	
	//----------------------pdboard----------------------
	
	@Override //
	public List<PdboardVO> pdbsearchList(Criteria cri) {
		return mapper.pdbsearchList(cri);
	}
	
	public List<PdboardVO> pdbmainSearch(Criteria cri) {
		return mapper.pdbmainSearch(cri);
	}
	
	@Override
	public List<PdboardVO> pdbcriList(Criteria cri) {
		return mapper.pdbcriList(cri);
	}
	
	@Override
	public List<PdboardVO> pdboardTotal() {
		return mapper.pdboardTotal();
	}
	
	@Override
	public List<PdboardVO> pdhomeBoardList() {
		return mapper.pdhomeBoardList();
	}
	
	@Override
	public PdboardVO pdbselectOne(PdboardVO vo) {
		return mapper.pdbselectOne(vo);
	}
	
	@Override
	public PdboardVO pdselectMusic(PdboardVO vo) {
		return mapper.pdselectMusic(vo);
	}
	
	@Override
	public int pdbcriTotalCount() {
		return mapper.pdbcriTotalCount();
	}
	
	@Override
	public int pdbsearchCount(Criteria cri) {
		return mapper.pdbsearchCount(cri);
	}
	
	@Override
	public int pdbinsert(PdboardVO vo) {
		return mapper.pdbinsert(vo);
	}
	
	@Override
	public int pdbupdate(PdboardVO vo) {
		return mapper.pdbupdate(vo);
	}
	
	@Override
	public int pdbdelete(PdboardVO vo) {
		return mapper.pdbdelete(vo);
	}
	
	@Override
	public int pdbcountUp(PdboardVO vo) {
		return mapper.pdbcountUp(vo);
	}
	
	@Override
	public int pdbrCount(PdboardVO vo) {
		return mapper.pdbrCount(vo);
	}
	
	@Override
	public int pdbvoteUp(PdboardVO vo) {
		return mapper.pdbvoteUp(vo);
	}
	
	@Override
	public int pdbvoteDown(PdboardVO vo) {
		return mapper.pdbvoteDown(vo);
	}
	
	//------VoteTable------	
	
	@Override
	public int bvoteTableUp(VoteTableVO vo) {
		return mapper.bvoteTableUp(vo);
	}
	@Override
	public int bvoteTableDown(VoteTableVO vo) {
		return mapper.bvoteTableDown(vo);
	}
	@Override
	public int bvoteTableSelect(BoardVO vo) {
		return mapper.bvoteTableSelect(vo);
	}
	
	
	//-------------------------------------------
	@Override
	public int pdbvoteTableUp(VoteTableVO vo) {
		return mapper.pdbvoteTableUp(vo);
	}
	@Override
	public int pdbvoteTableDown(VoteTableVO vo) {
		return mapper.pdbvoteTableDown(vo);
	}
	@Override
	public int pdbvoteTableSelect(PdboardVO vo) {
		return mapper.pdbvoteTableSelect(vo);
	}

}
