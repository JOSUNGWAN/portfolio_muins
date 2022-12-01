package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import mapperInterface.ReplyMapper;

import vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyMapper mapper;
	
	@Override
	public List<ReplyVO> readReply(int bno) {
		return mapper.readReply(bno);
	}

	@Override
	public int brinsert(ReplyVO vo) {
		return mapper.brinsert(vo);
	}
	
	 public int brupdate(ReplyVO vo) {
		 return mapper.brupdate(vo);
	 }
	
	public int brdelete(ReplyVO vo) {
		return mapper.brdelete(vo);
	}	
	
	public int brreinsert(ReplyVO vo) {
		mapper.stepUpdate(vo);
		return mapper.brreinsert(vo);
	}

//	-------------------------------------------------------
	@Override
	public List<ReplyVO>pdreadReply(int bno) {
		
		return mapper.pdreadReply(bno);
	}
	@Override
	public int pdbrinsert(ReplyVO vo) {
		return mapper.pdbrinsert(vo);
	}
	
	public int pdbrupdate(ReplyVO vo) {
		return mapper.pdbrupdate(vo);
	}

	public int pdbrdelete(ReplyVO vo) {
		return mapper.pdbrdelete(vo);
		
	}
	
	public int pdbrreinsert(ReplyVO vo) {
		mapper.pdstepUpdate(vo);
		return mapper.pdbrreinsert(vo);
	}
}
