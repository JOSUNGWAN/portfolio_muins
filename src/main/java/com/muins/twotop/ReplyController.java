package com.muins.twotop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.ReplyService;
import vo.ReplyVO;


@Controller
public class ReplyController {
	
	@Autowired
	ReplyService replyService;

	// 댓글목록
	@RequestMapping(value = "/breplyf", method = RequestMethod.POST)
	public ModelAndView breplyf(HttpServletRequest request, HttpServletResponse response,
									ModelAndView mv, ReplyVO vo) {
		
		List<ReplyVO> list = replyService.readReply(vo.getSeq());
		if ( list!=null ) {
			mv.addObject("replyListF", list);
		} else {
			mv.addObject("message", "~~ 출력 자료가 없습니다 ~~");
		}
		mv.setViewName("boardFolder/breplyf");
		return mv;
	} // 댓글목록
	
	
	
	// 댓글입력
	@RequestMapping(value = "/brinsert", method = RequestMethod.POST)
	public ModelAndView brinsert(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, ReplyVO vo,  RedirectAttributes rttr) {
		String uri = "redirect:boardDetail?seq="+vo.getSeq();
		vo.setRno_next(vo.getRno()+1);
		if(replyService.brinsert(vo) > 0) {
			rttr.addFlashAttribute("message", "- 댓글 등록성공! -");
		} else {
			rttr.addFlashAttribute("message", "- 댓글 등록실패ㅠㅠ, 다시 하세요. -");
			uri = "/boardFolder/boardDetail";
		}
		mv.setViewName(uri);
		return mv;
	} //댓글입력
	
	// 댓글 수정
		@RequestMapping(value = "/brupdate", method = RequestMethod.POST)
		public ModelAndView brupdate(HttpServletRequest request, HttpServletResponse response, 
										ModelAndView mv, ReplyVO vo) {
			if(replyService.brupdate(vo) > 0) {
				mv.addObject("message", "- 댓글 수정 성공!!!, -");
			} else {
				mv.addObject("message", "- 댓글 수정 실패ㅠㅠ, 다시 하세요. -");
			}
			return null;
		} // 댓글 수정
	
	// 댓글 삭제
	@RequestMapping(value = "/brdelete")
	public ModelAndView brdelete(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, ReplyVO vo, RedirectAttributes rttr) {
		String uri = "redirect:boardDetail?seq="+vo.getSeq();
		if(replyService.brdelete(vo) > 0) { 
			rttr.addFlashAttribute("message", "- 댓글삭제 성공 -");
		} else {
			rttr.addFlashAttribute("message", "- 댓글삭제 실패, 다시 하세요 -");
			uri = "redirect:boardDetail?seq="+vo.getSeq();
		}
		mv.setViewName(uri);
		return mv;
	} // 댓글 삭제
	
	// 대댓글입력
	@RequestMapping(value = "/brreinsert", method = RequestMethod.POST)
	public ModelAndView brreinsert(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, ReplyVO vo,  RedirectAttributes rttr) {

		String uri = "redirect:boardDetail?seq="+vo.getSeq();
		vo.setStep(vo.getStep()+1);
		vo.setIndent(vo.getIndent()+1);
		

		vo.setRno_next(vo.getRno()+1);
		
		if(replyService.brreinsert(vo) > 0) {
			rttr.addFlashAttribute("message", "- 대댓글 등록성공! -");
		} else {

			rttr.addFlashAttribute("message", "- 대댓글 등록실패ㅠㅠ, 다시 하세요. -");
			uri = "/boardFolder/boardDetail";
		}
				
		// 3. 결과(ModelAndView)전달
		mv.setViewName(uri);
		return mv;
	} //대댓글입력

	
	
	
	
	

	
//---------------------------------------------------------------------------------------------------------
	// 댓글목록
	@RequestMapping(value = "/pdbreplyf", method = RequestMethod.POST)
	public ModelAndView pdbreplyf(HttpServletRequest request, HttpServletResponse response,ModelAndView mv, ReplyVO vo) {
		List<ReplyVO> list = replyService.pdreadReply(vo.getSeq());
		if ( list!=null ) {
			mv.addObject("pdreplyListF", list);
		} else {
			mv.addObject("message", "~~ 출력 자료가 없습니다 ~~");
		}
		mv.setViewName("boardFolder/pdbreplyf");
		return mv;
	} // 댓글목록
	
	// 댓글입력
	@RequestMapping(value = "/pdbrinsert", method = RequestMethod.POST)
	// => 매핑네임과 method 가 일치하는 요청만 처리함 POST방식만 처리
	public ModelAndView pdbrinsert(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv,ReplyVO vo,  RedirectAttributes rttr) {
		// 1. 요청분석
		String uri = "redirect:pdboardDetail?seq="+vo.getSeq();
		// 2. Service 처리
		vo.setRno_next(vo.getRno()+1);
		if(replyService.pdbrinsert(vo) > 0) {
			rttr.addFlashAttribute("message", "- 댓글 등록성공! -");
		} else {
			// 실패 : binsertForm.jsp
			rttr.addFlashAttribute("message", "- 댓글 등록실패ㅠㅠ, 다시 하세요. -");
			uri = "/boardFolder/pdboardDetail";
		}
		return null;
	} // 댓글입력
	
	// 댓글 수정
	@RequestMapping(value = "/pdbrupdate", method = RequestMethod.POST)
	public ModelAndView pdbrupdate(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, ReplyVO vo) {

		if(replyService.pdbrupdate(vo) > 0) {
			mv.addObject("message", "- 댓글 수정 성공!!!, -");
		} else {
			mv.addObject("message", "- 댓글 수정 실패ㅠㅠ, 다시 하세요. -");
		}
		return null;
	} // 댓글 수정
	
	// ** Delete : 글삭제
	@RequestMapping(value = "/pdbrdelete")
	public ModelAndView pdbrdelete(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, ReplyVO vo, RedirectAttributes rttr) {

		String uri = "redirect:pdboardDetail?seq="+vo.getSeq();

		if(replyService.pdbrdelete(vo) > 0) { 
			rttr.addFlashAttribute("message", "- 댓글삭제 성공 -");
		} else {
			rttr.addFlashAttribute("message", "- 댓글삭제 실패, 다시 하세요 -");
			uri = "redirect:pdboardDetail?seq="+vo.getSeq();
		}
		return null;
	}
	
	// 대댓글입력
	@RequestMapping(value = "/pdbrreinsert", method = RequestMethod.POST)
	// => 매핑네임과 method 가 일치하는 요청만 처리함 POST방식만 처리
	public ModelAndView pdbrreinsert(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv,ReplyVO vo,  RedirectAttributes rttr) {

		String uri = "redirect:pdboardDetail?seq="+vo.getSeq();
		vo.setStep(vo.getStep()+1);
		vo.setIndent(vo.getIndent()+1);

		vo.setRno_next(vo.getRno()+1);
		if(replyService.pdbrreinsert(vo) > 0) {
			rttr.addFlashAttribute("message", "- 댓글 등록성공! -");
		} else {

			rttr.addFlashAttribute("message", "- 댓글 등록실패ㅠㅠ, 다시 하세요. -");
			uri = "/boardFolder/pdboardDetail";
		}
		return null;
	} // 대댓글입력
	
}
