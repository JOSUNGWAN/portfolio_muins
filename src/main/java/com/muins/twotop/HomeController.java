package com.muins.twotop;

import java.time.LocalDate;
import java.util.Enumeration;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.Session;

import criteria.Criteria;
import criteria.PageMaker;
import mapperInterface.BoardMapper;
import mapperInterface.MusicMapper;
import mapperInterface.UserMapper;
import service.BoardService;
import service.MusicService;
import service.UserService;
import vo.BoardVO;
import vo.MusicVO;
import vo.PayDateVO;
import vo.PdboardVO;
import vo.UserVO;


@Controller
public class HomeController {
	
	@Autowired
	BoardMapper bmapper;
	
	@Autowired
	MusicMapper mmapper;
	
	@Autowired
	UserMapper umapper;
	
	@Autowired //자동 주입
	BoardService bservice;

	@Autowired //자동 주입
	MusicService mservice;
	
	@Autowired
	UserService uservice;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv, BoardVO bo, UserVO vo) {
		LocalDate now = LocalDate.now();
		String uri = "home";
		List<MusicVO> list = mmapper.musicTotal();
		mv.addObject("music", list);
		List<MusicVO> plist = mmapper.musicPopular();
		mv.addObject("pmusic", plist);
		List<BoardVO> blist = bmapper.homeBoardList();
		mv.addObject("blist", blist);
		List<PdboardVO> pdblist = bmapper.pdhomeBoardList();
		mv.addObject("pdblist", pdblist);
		mv.addObject("now",now);
		mv.setViewName(uri);
		return mv;
	}
	
	@RequestMapping(value = "/mainsearch")
	public ModelAndView mainsearch(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, Criteria cri, PageMaker pageMaker) {
		cri.setKeyword(request.getParameter("keywords"));
		
		mv.addObject("music",mservice.mmainsearch(cri));
		mv.addObject("board",bservice.bmainSearch(cri));
		mv.addObject("pdboard",bservice.pdbmainSearch(cri));
		
		String uri = "/form/mainsearchtotal";
	
		mv.setViewName(uri);
		return mv;
	} // bcrilist
		
	@RequestMapping(value = "/usergradeupdate")
	public void usergradeupdate(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv, UserVO vo, PayDateVO po) {
		
		vo.setId(request.getParameter("id"));
		vo.setUsergrade("프리미엄");
		po.setId(request.getParameter("id"));
		po.setUsergrade("프리미엄");
		umapper.userGradeUpdate(vo);
		umapper.payDate(po);
		request.getSession().setAttribute("userGrade", vo.getUsergrade());
	}
	
	
	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	public ModelAndView emailAuth(String email, ModelAndView mv) {		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		/* 이메일 보내기 */
        String setFrom = "jsykiss@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        mv.addObject("code", checkNum);
        mv.setViewName("jsonView");
        return mv;
        
 
	}
	
	
	
}
