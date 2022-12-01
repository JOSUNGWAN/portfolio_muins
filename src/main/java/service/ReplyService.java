package service;

import java.util.List;

import vo.ReplyVO;

public interface ReplyService {
	
	List<ReplyVO> readReply(int bno);
	int brinsert(ReplyVO vo);
	int brupdate(ReplyVO vo);
	int brdelete(ReplyVO vo);
	int brreinsert(ReplyVO vo);
	
	List<ReplyVO> pdreadReply(int bno);
	int pdbrinsert(ReplyVO vo);
	int pdbrupdate(ReplyVO vo);
	int pdbrdelete(ReplyVO vo);
	int pdbrreinsert(ReplyVO vo);

}
