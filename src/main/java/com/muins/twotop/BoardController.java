package com.muins.twotop;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import criteria.Criteria;
import criteria.PageMaker;
import service.BoardService;
import service.ReplyService;
import vo.BoardVO;
import vo.PdboardVO;
import vo.ReplyVO;
import vo.VoteTableVO;

@Controller
public class BoardController {

	@Autowired //자동 주입
	BoardService service;

	@Autowired
	ReplyService replyService;

	//---board---------------------------------------------------------------------------------
	
	// 일반게시판 전체목록
	@RequestMapping(value = "/boardtotal")
	public ModelAndView boardtotal(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv) {

		List<BoardVO> list = new ArrayList<BoardVO>();
		list = service.boardTotal();
		if ( list!=null ) {
			mv.addObject("boardlist", list);
		} else {
			mv.addObject("message", "~~ 출력 자료가 없습니다 ~~");
		}
		String uri = "/boardFolder/boardtotal";
		mv.setViewName(uri);
		return mv;

	} // 일반게시판 전체목록

	// 일반게시판 페이징전체목록
	@RequestMapping(value = "/bcrilist")
	public ModelAndView bcrilist(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, Criteria cri, PageMaker pageMaker) {

		cri.setSnoEno();

		mv.addObject("boardlist", service.bsearchList(cri));

		// 3) View 처리
		pageMaker.setCri(cri);
		pageMaker.setTotalRowsCount(service.bsearchCount(cri));

		mv.addObject("pageMaker", pageMaker);
		mv.setViewName("/boardFolder/boardcrilist");
		return mv;
	} // 일반게시판 페이징전체목록
	
	// 새글등록폼
	@RequestMapping(value = "/boardinsertform")
	public ModelAndView boardinsertform(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		mv.setViewName("/boardFolder/boardinsertform");
		return mv;
	} // 새글등록폼

	// 새글등록
	@RequestMapping(value = "/binsert", method = RequestMethod.POST)
	// => 매핑네임과 method 가 일치하는 요청만 처리함 POST방식만 처리
	public ModelAndView binsert(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, BoardVO vo, RedirectAttributes rttr) {

		String uri = "redirect:bcrilist";
		if(service.binsert(vo) > 0) {
		} else {
			uri = "/boardFolder/boardinsertform";
		}

		mv.setViewName(uri);
		return mv;
	} // 새글등록

	// 내글 수정
	@RequestMapping(value = "/bupdate", method = RequestMethod.POST)
	public ModelAndView bupdate(HttpServletRequest request, HttpServletResponse response, 
									ModelAndView mv, BoardVO vo) {

		String uri = "redirect:bcrilist";
		mv.addObject("bselectone",vo);

		if(service.bupdate(vo) > 0) {
			mv.addObject("message", "- 글 수정 성공!!!, -");
		} else {
			mv.addObject("message", "- 글 수정 실패ㅠㅠ, 다시 하세요. -");
			uri = "/boardFolder/boardupdate";
		}

		mv.setViewName(uri);
		return mv;
	} // 내글 수정

	// 글삭제
	@RequestMapping(value = "/bdelete")
	public ModelAndView bdelete(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, BoardVO vo, RedirectAttributes rttr) {

		String uri = "redirect:bcrilist";

		if(service.bdelete(vo) > 0) { 
			rttr.addFlashAttribute("message", "- 글삭제 성공 -");
		} else {
			rttr.addFlashAttribute("message", "- 글삭제 실패, 다시 하세요 -");
			uri = "redirect:boardDetail?seq=" + vo.getSeq();
		}

		mv.setViewName(uri);
		return mv;
	} // 글삭제


	// 글상세보기 & 조회수증가 & 댓글갯수 확인
	@RequestMapping(value = "/boardDetail")
	public ModelAndView boardDetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, BoardVO vo, BoardVO bo) {
		List<ReplyVO> replyList = replyService.readReply(vo.getSeq());
		mv.addObject("replyList", replyList);
		String uri = "/boardFolder/boardDetail";
		vo = service.bselectOne(vo);
		if(vo != null) {
			// 조회수 증가
			String loginID = (String)request.getSession().getAttribute("loginID");
			if(!vo.getId().equals(loginID) && !"U".equals(request.getParameter("jCode"))) {
				service.bcountUp(vo);
			}
			//추천 정보 확인
			bo.setId((String)request.getSession().getAttribute("loginID"));
			if(service.bvoteTableSelect(bo) > 0) {
				mv.addObject("vote","T");
			} else {
				mv.addObject("vote","F");	
			}

			// 댓글갯수 확인
			int rcount = service.brCount(vo);
			mv.addObject("rcount",rcount);

			// 수정요청 확인
			if("U".equals(request.getParameter("jCode"))) {
				uri = "/boardFolder/boardupdate";
			}
			mv.addObject("bselectone",vo);
		} else {
			mv.addObject("message", "- 글번호에 해당하는 자료가 없습니다. -");
		}

		mv.setViewName(uri);
		return mv;
	} // 글상세보기 & 조회수증가 & 댓글갯수 확인
	
	// 추천수 증가
	@RequestMapping(value = "/bvoteUp")
	public void bvoteUp(HttpServletRequest request, HttpServletResponse response, 
			BoardVO vo) {
		service.bvoteUp(vo);
	} // 추천수 증가
	
	// 추천수 감소
	@RequestMapping(value = "/bvoteDown")
	public void bvoteDown(HttpServletRequest request, HttpServletResponse response, 
			BoardVO vo) {
		service.bvoteDown(vo);
	}
	// 추천수 감소
	
	//---board---------------------------------------------------------------------------------
	
	//---voteTable-------------------------------------------------------------------------------
	
	@RequestMapping(value = "/bvoteTableUp")
	public ModelAndView bvoteTableUp(HttpServletRequest request, HttpServletResponse response, 
			VoteTableVO vo) {
		vo.setId((String)request.getSession().getAttribute("loginID"));
		service.bvoteTableUp(vo);
		return null; 
	}
	@RequestMapping(value = "/bvoteTableDown")
	public ModelAndView bvoteTableDown(HttpServletRequest request, HttpServletResponse response, 
			VoteTableVO vo) {
		vo.setId((String)request.getSession().getAttribute("loginID"));
		service.bvoteTableDown(vo);
		return null; 
	}
	@RequestMapping(value = "/pdbvoteTableUp")
	public ModelAndView pdbvoteTableUp(HttpServletRequest request, HttpServletResponse response, 
			VoteTableVO vo) {
		vo.setId((String)request.getSession().getAttribute("loginID"));
		service.pdbvoteTableUp(vo);
		return null; 
	}
	@RequestMapping(value = "/pdbvoteTableDown")
	public ModelAndView pdbvoteTableDown(HttpServletRequest request, HttpServletResponse response, 
			VoteTableVO vo) {
		vo.setId((String)request.getSession().getAttribute("loginID"));
		service.pdbvoteTableDown(vo);
		return null; 
	}
	//---voteTable-------------------------------------------------------------------------------
	
	



	//---pdboard-------------------------------------------------------------------------------

	// 작곡게시판 전체목록
	@RequestMapping(value = "/pdboardtotal")
	public ModelAndView pdboardtotal(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv) {

		List<PdboardVO> list = new ArrayList<PdboardVO>();
		list = service.pdboardTotal();
		if ( list!=null ) {
			mv.addObject("pdboardlist", list);
		} else {
			mv.addObject("message", "~~ 출력 자료가 없습니다 ~~");
		}
		String uri = "/boardFolder/pdboardtotal";
		mv.setViewName(uri);
		return mv;

	} // 작곡게시판 전체목록
	
	// 작곡게시판 페이징전체목록
	@RequestMapping(value = "/pdbcrilist")
	public ModelAndView pdbcrilist(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, Criteria cri, PageMaker pageMaker) {

		cri.setSnoEno();

		mv.addObject("pdboardlist", service.pdbsearchList(cri)); // ver02

		pageMaker.setCri(cri);
		pageMaker.setTotalRowsCount(service.pdbsearchCount(cri));	 // ver02: 조건과 일치하는 Rows의 갯수

		mv.addObject("pageMaker", pageMaker);
		mv.setViewName("/boardFolder/pdboardcrilist");
		return mv;
	} // 작곡게시판 페이징전체목록


	// 새글등록
	@RequestMapping(value = "/pdboardinsertform")
	public ModelAndView pdboardinsertform(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		mv.setViewName("/boardFolder/pdboardinsertform");
		return mv;
	}// 새글등록폼
	
	// 새글등록 & 작곡게시판 노래업로드
	@RequestMapping(value = "/pdbinsert", method = RequestMethod.POST)
	public ModelAndView pdbinsert(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, PdboardVO vo, RedirectAttributes rttr)throws IOException {
 
		String uri = "redirect:pdbcrilist";
		// 폴더 확인 및 생성 & 파일업로드
		String realPath = request.getRealPath("/"); 

		if ( realPath.contains(".eclipse.") ) 
			realPath = "C:\\Mtest\\myWork\\portfolio\\src\\main\\webapp\\resources\\userMusicFile\\" + vo.getId()+"\\";
		else  
			realPath += "resources\\userMusicFile\\" + vo.getId()+"\\";

		File f2 = new File(realPath);
		
		if ( !f2.exists() ) f2.mkdir();
		String file2 = null; 

		MultipartFile uploadfilef = vo.getUploadfilef();
		if ( uploadfilef !=null && !uploadfilef.isEmpty() ) {

			file2 = realPath + uploadfilef.getOriginalFilename();
			uploadfilef.transferTo(new File(file2));

			file2=uploadfilef.getOriginalFilename();
		}
		vo.setUploadfile(file2);
		if(service.pdbinsert(vo) > 0) {
			rttr.addFlashAttribute("message", "- 새글 등록성공!!. -");
		} else {
			rttr.addFlashAttribute("message", "- 새글 등록실패ㅠㅠ, 다시 하세요. -");
			uri = "/boardFolder/pdboardinsertform";
		}

		mv.setViewName(uri);
		return mv;
	}// 새글등록 & 작곡게시판 노래업로드

	// 내글 수정
	@RequestMapping(value = "/pdbupdate", method = RequestMethod.POST)
	public ModelAndView pdbupdate(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, PdboardVO vo)throws IOException {
		
		String uri = "redirect:pdbcrilist";
		mv.addObject("pdbselectone",vo);
		
		// 폴더 확인 및 생성 & 파일업로드
		String realPath = request.getRealPath("/");

		if ( realPath.contains(".eclipse.") ) {
			realPath = "C:\\Mtest\\myWork\\portfolio\\src\\main\\webapp\\resources\\userMusicFile\\" + vo.getId()+"\\";
		} else {
			realPath += "resources\\userMusicFile\\" + vo.getId()+"\\";
		}

		File f2 = new File(realPath);
		if ( !f2.exists() ) f2.mkdir();

		String file2 = null; 

		MultipartFile uploadfilef = vo.getUploadfilef();
		if ( uploadfilef !=null && !uploadfilef.isEmpty() ) {

			file2 = realPath + uploadfilef.getOriginalFilename();
			uploadfilef.transferTo(new File(file2));

			file2=uploadfilef.getOriginalFilename();
		}

		vo.setUploadfile(file2);

		if(service.pdbupdate(vo) > 0) {
			mv.addObject("message", "- 글 수정 성공!!!, -");
		} else {
			mv.addObject("message", "- 글 수정 실패ㅠㅠ, 다시 하세요. -");
			uri = "/boardFolder/pdboardupdate";
		}

		mv.setViewName(uri);
		return mv;
	} // 내글 수정

	// 글삭제
	@RequestMapping(value = "/pdbdelete")
	public ModelAndView pdbdelete(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, PdboardVO vo, RedirectAttributes rttr) {

		String uri = "redirect:pdbcrilist";

		if(service.pdbdelete(vo) > 0) { 
			rttr.addFlashAttribute("message", "- 글삭제 성공 -");
		} else {
			rttr.addFlashAttribute("message", "- 글삭제 실패, 다시 하세요 -");
			uri = "redirect:pdboardDetail?seq=" + vo.getSeq();
		}

		mv.setViewName(uri);
		return mv;
	} // 글삭제

	// 글상세보기 & 조회수증가 & 댓글갯수 확인
	@RequestMapping(value = "/pdboardDetail")
	public ModelAndView pdbDetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, PdboardVO vo, PdboardVO bo) {
		List<ReplyVO> pdreplyList = replyService.pdreadReply(vo.getSeq());
		mv.addObject("pdreplyList", pdreplyList);
		String uri = "/boardFolder/pdboardDetail";
		vo = service.pdbselectOne(vo);
		if(vo != null) {
			String loginID = (String)request.getSession().getAttribute("loginID");
			if(!vo.getId().equals(loginID) && !"U".equals(request.getParameter("jCode"))) {		
				service.pdbcountUp(vo);		
			}
			
			//추천 정보 확인
			bo.setId((String)request.getSession().getAttribute("loginID"));
			if(service.pdbvoteTableSelect(bo) > 0) {
				mv.addObject("vote","T");
			} else {
				mv.addObject("vote","F");	
			}
			
			int rcount = service.pdbrCount(vo);
			mv.addObject("rcount",rcount);
			
			if("U".equals(request.getParameter("jCode"))) {
				uri = "/boardFolder/pdboardupdate";
			}
			mv.addObject("pdbselectone",vo);
		} else {
			mv.addObject("message", "- 글번호에 해당하는 자료가 없습니다. -");
		}

		mv.setViewName(uri);
		return mv;
	} // 글상세보기 & 조회수증가 & 댓글갯수 확인

	
	// 추천수 증가
	@RequestMapping(value = "/pdbvoteUp")
	public void pdbvoteUp(HttpServletRequest request, HttpServletResponse response, 
			PdboardVO vo) {
		service.pdbvoteUp(vo);
	} // 추천수 증가
	
	// 추천수 감소
	@RequestMapping(value = "/pdbvoteDown")
	public void pdbvoteDown(HttpServletRequest request, HttpServletResponse response, 
			PdboardVO vo) {
		service.pdbvoteDown(vo);
	} // 추천수 감소
	

	// 작곡게시판 노래 듣기
	@RequestMapping(value = "/pdselectMusic")
	public ModelAndView pdselectMusic(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv, PdboardVO vo) {
		response.setContentType("text/html; charset=UTF-8");
		vo = service.pdselectMusic(vo);
		mv.addObject("vo",vo);
		mv.setViewName("jsonView");
		return mv;
	} // 작곡게시판 노래 듣기
	
	//---pdboard-------------------------------------------------------------------------------
	
	
	//---admin---------------------------------------------------------------------------------
	// 관리자용 일반게시판 페이징전체목록
	@RequestMapping(value = "/adminBcrilist")
	public ModelAndView adminBcrilist(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, Criteria cri, PageMaker pageMaker) {
		
		cri.setSnoEno();
		mv.addObject("boardlist", service.bsearchList(cri));	
		
		// 3) View 처리
		pageMaker.setCri(cri);
		pageMaker.setTotalRowsCount(service.bsearchCount(cri));
		
		mv.addObject("pageMaker", pageMaker);
		mv.setViewName("/admin/admin_boardcrilist");
		return mv;
	} // 관리자용 일반게시판 페이징전체목록
	
	// 관리자용 일반게시판 글삭제
	@RequestMapping(value = "/adminBdelete")
	public ModelAndView adminBdelete(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, BoardVO vo, RedirectAttributes rttr) {

		String uri = "redirect:adminBcrilist";

		if(service.bdelete(vo) > 0) { 
			rttr.addFlashAttribute("message", "- 글삭제 성공 -");
		} else {
			rttr.addFlashAttribute("message", "- 글삭제 실패, 다시 하세요 -");
		}

		mv.setViewName(uri);
		return mv;
	} // 관리자용 일반게시판 글삭제
	
	// 관리자용 작곡게시판 페이징전체목록
		@RequestMapping(value = "/adminpdBcrilist")
		public ModelAndView adminpdBcrilist(HttpServletRequest request, HttpServletResponse response, 
				ModelAndView mv, Criteria cri, PageMaker pageMaker) {

			cri.setSnoEno();

			mv.addObject("pdboardlist", service.pdbsearchList(cri)); // ver02

			pageMaker.setCri(cri);
			pageMaker.setTotalRowsCount(service.pdbsearchCount(cri));	 // ver02: 조건과 일치하는 Rows의 갯수

			mv.addObject("pageMaker", pageMaker);
			mv.setViewName("/admin/admin_pdboardcrilist");
			return mv;
		} // 작곡게시판 페이징전체목록
		
		// 관리자용 작곡게시판 글삭제
		@RequestMapping(value = "/adminpdBdelete")
		public ModelAndView adminpdBdelete(HttpServletRequest request, HttpServletResponse response, 
				ModelAndView mv, PdboardVO vo, RedirectAttributes rttr) {

			String uri = "redirect:adminpdBcrilist";

			if(service.pdbdelete(vo) > 0) { 
				rttr.addFlashAttribute("message", "- 글삭제 성공 -");
			} else {
				rttr.addFlashAttribute("message", "- 글삭제 실패, 다시 하세요 -");
			}

			mv.setViewName(uri);
			return mv;
		} // 관리자용 작곡게시판 글삭제
	
	

}

