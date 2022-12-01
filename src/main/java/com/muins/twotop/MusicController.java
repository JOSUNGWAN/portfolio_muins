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

import criteria.Criteria;
import criteria.PageMaker;
import service.MusicService;
import vo.MusicVO;
import vo.MyListVO;
import vo.PlayListVO;

@Controller
public class MusicController {

	@Autowired
	MusicService service;

	// Music Total ==================================================
	@RequestMapping(value = "/musictotal")
	public ModelAndView musicTotal(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		String uri = "/admin/musictotal";
		List<MusicVO> list = new ArrayList<MusicVO>();
		list = service.musicTotal();

		mv.addObject("musicList", list);
		mv.setViewName(uri);
		return mv;
	} // musicTotal

	// Music Cri (Paging, Search) ==========================================
	@RequestMapping(value = "/musicCri")
	public ModelAndView mcrilist(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			Criteria cri, PageMaker pageMaker) {
		if (request.getParameter("rowsCount") != null) {
			cri.setRowsPerPage(Integer.parseInt(request.getParameter("rowsCount")));
			cri.setCategory(request.getParameter("category"));
		}

		cri.setSnoEno();
		mv.addObject("music", service.musicCri(cri));
		pageMaker.setCri(cri);
		pageMaker.setTotalRowsCount(service.criTotalCount());
		
		MyListVO mvo = new MyListVO();
		PlayListVO pvo = new PlayListVO();

		mvo.setId((String)request.getSession().getAttribute("loginID"));
		pvo.setId((String)request.getSession().getAttribute("loginID"));

		mv.addObject("myList", service.selectMyMusic(mvo));
		mv.addObject("playList", service.selectPlayMusic(pvo));

		mv.addObject("pageMaker", pageMaker);

		mv.setViewName("/musicFolder/listform");
		return mv;
	} // musicCri

	// Music Thema =============================================
	@RequestMapping(value = "/themaf")
	public ModelAndView themaf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		String uri = "/musicFolder/thema";
		List<MusicVO> list = new ArrayList<MusicVO>();

		list = service.musicTotal();
		mv.addObject("music", list);

		mv.setViewName(uri);
		return mv;
	} // themaf

	@RequestMapping(value = "/musicthema")
	public ModelAndView musicthema(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MusicVO vo) {
		String uri = "/musicFolder/thema";
		vo.setThema(request.getParameter("thema"));
		List<MusicVO> list = new ArrayList<MusicVO>();
		
		list = service.musicThema(vo);
		mv.addObject("music", list);
		mv.setViewName(uri);
		return mv;
	} // themaf

	// Music Search ================================================
	@RequestMapping(value = "/searchMusic")
	public ModelAndView searchMusic(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			Criteria cri, PageMaker pageMaker) {
		if (request.getParameter("rowsCount") != null) {
			cri.setRowsPerPage(Integer.parseInt(request.getParameter("rowsCount")));
			cri.setSearchType(request.getParameter("searchType"));
			cri.setKeyword(request.getParameter("keyword"));
			cri.setCategory(request.getParameter("category"));
		}

		cri.setSnoEno();
		mv.addObject("music", service.searchMusic(cri));
		mv.addObject("hidden", "hide");
		pageMaker.setCri(cri);
		pageMaker.setTotalRowsCount(service.criTotalCount());

		mv.addObject("pageMaker", pageMaker);
		mv.setViewName("/musicFolder/listform");
		return mv;
	} // searchMusic

	// Music Select ==============================================
	@RequestMapping(value = "/selectMusic", method = RequestMethod.GET)
	public ModelAndView selectMusic(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MusicVO vo) {
		response.setContentType("text/html; charset=UTF-8");
		vo.setMusic_code(Integer.parseInt(request.getParameter("music_code")) );
		vo = service.selectMusic(vo);
		mv.addObject("vo", vo);
		mv.setViewName("jsonView");
		return mv;
	} // selectMusic

	// Music Update START =============================================
	@RequestMapping(value = "/musicUpdatef")
	public ModelAndView musicupdatef(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MusicVO vo) {
		vo.setMusic_code(Integer.parseInt(request.getParameter("music_code")));
		vo = service.selectMusic(vo);
		mv.addObject("music", vo);
		mv.setViewName("/admin/musicupdatef");
		return mv;
	} // musicUpdatef

	@RequestMapping(value = "/musicUpdate")
	public ModelAndView musicupdate(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MusicVO vo) {
		vo.setMusic_code(Integer.parseInt(request.getParameter("music_code")));
		if (service.musicUpdate(vo) > 0)
			;

		mv.setViewName("redirect:musictotal");
		return mv;
	} // musicUpdate

	// Music Insert START =============================================
	@RequestMapping(value = "/musicInsertf")
	public ModelAndView musicInsertf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MusicVO vo) {
		mv.setViewName("/admin/musicinsertf");
		return mv;
	} // musicInsertf

	@RequestMapping(value = "/musicInsert", method = RequestMethod.POST)
	public ModelAndView musicInsert(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MusicVO vo) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String musicRealPath = request.getServletContext().getRealPath("/");
		String imageRealPath = request.getServletContext().getRealPath("/");

		if (musicRealPath.contains(".eclipse.")) {
			musicRealPath = "C:\\MTest\\myWork\\portfolio\\src\\main\\webapp\\resources\\music\\";
			imageRealPath = "C:\\MTest\\myWork\\portfolio\\src\\main\\webapp\\resources\\images\\musicImages\\";
		} else {
			musicRealPath += "resources\\music\\";
			imageRealPath += "resources\\images\\musicImages\\";
		}

		File musicf1 = new File(musicRealPath);
		File imagef1 = new File(imageRealPath);
		if (!musicf1.exists())
			musicf1.mkdir();
		if (!imagef1.exists())
			imagef1.mkdir();

		String musicfile1, musicfile2 = "resources/images/music/basicman4.mp3";
		String imagefile1, imagefile2 = "resources/images/musicImages/basicman4.png";

		MultipartFile uploadmusicf = vo.getUploadmusicf();
		if (uploadmusicf != null && !uploadmusicf.isEmpty()) {
			musicfile1 = musicRealPath + uploadmusicf.getOriginalFilename();
			uploadmusicf.transferTo(new File(musicfile1)); // 음악 저장
			musicfile2 = "resources/music/" + uploadmusicf.getOriginalFilename(); // 음악 DB 저장 X
		}

		MultipartFile uploadimagef = vo.getUploadimagef();
		if (uploadimagef != null && !uploadimagef.isEmpty()) {
			imagefile1 = imageRealPath + uploadimagef.getOriginalFilename(); // 경로완성
			uploadimagef.transferTo(new File(imagefile1)); // 이미지 DB 저장 O
			imagefile2 = "resources/images/musicImages/" + uploadimagef.getOriginalFilename();
		}

		vo.setImagefile(imagefile2);

		if (service.musicInsert(vo) > 0) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		// 3. 결과(ModelAndView) 전달
		mv.setViewName("redirect:musictotal");
		return mv;
	} // musicInsert

	// Music Insert myList
	// START=======================================================
	@RequestMapping(value = "/myList")
	public void myList(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, MusicVO vo) {
		MyListVO mvo = new MyListVO();

		String loginid = (String)request.getSession(false).getAttribute("loginID");
		vo.setMusic_code(Integer.parseInt(request.getParameter("music_code")));
		vo = service.selectMusic(vo);

		mvo.setId(loginid);
		mvo.setMname(vo.getMname());
		mvo.setAname(vo.getAname());
		if (service.myList(mvo) > 0);
	} // myList

	// Music Insert playList
	// START=======================================================
	@RequestMapping(value = "/playList")
	public void playList(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, MusicVO vo) {
		PlayListVO pvo = new PlayListVO();

		String loginid = (String)request.getSession(false).getAttribute("loginID");
		vo.setMusic_code(Integer.parseInt(request.getParameter("music_code")));
		vo = service.selectMusic(vo);

		pvo.setId(loginid);
		pvo.setMname(vo.getMname());
		pvo.setAname(vo.getAname());
		if (service.playList(pvo) > 0) {
			request.getSession().setAttribute("splayList", service.selectPlayMusic(pvo));
		}
	} // playList

	@RequestMapping(value = "/popupPlayer")
	public ModelAndView popupPlayer(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, MusicVO vo) {
		
		mv.setViewName("/popup/player");
		return mv;
	} // playList

	// Delete Music =======================================================
	// Music Delete ===
	@RequestMapping(value = "/musicDelete")
	public ModelAndView musicDelete(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MusicVO vo) {

		vo.setMusic_code(Integer.parseInt(request.getParameter("music_code")));

		if (service.musicDelete(vo) > 0);
		mv.setViewName("redirect:musictotal");
		return mv;
	} // musicDelete

	// playList Delete ===
	@RequestMapping(value = "/playListDelete")
	public ModelAndView playListDelete(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			PlayListVO vo) {

		vo.setNo(Integer.parseInt(request.getParameter("no")));
		if (service.playListDelete(vo) > 0) {
			vo.setId((String)request.getSession(false).getAttribute("loginID"));
			request.getSession().setAttribute("splayList", service.selectPlayMusic(vo));
		}
		mv.setViewName("redirect:musicCri");
		return mv;
	} // musicDelete

	// myList Delete ===
	@RequestMapping(value = "/myListDelete")
	public ModelAndView myListDelete(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MyListVO vo) {

		vo.setNo(Integer.parseInt(request.getParameter("no")));

		if (service.myListDelete(vo) > 0)
			;
		mv.setViewName("redirect:musicCri");
		return mv;
	} // musicDelete

	// MusicCountUp ===================================================
	@RequestMapping(value = "/musicCountUp")
	public void musicCountUp(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, MusicVO vo) {
		vo.setMusic_code(Integer.parseInt(request.getParameter("music_code")));
		service.musicCountUp(vo);
	} // musicCountUp

} // C_MusicController
