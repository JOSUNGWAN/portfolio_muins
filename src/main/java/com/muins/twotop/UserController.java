package com.muins.twotop;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.MusicService;
import service.UserService;
import vo.PayDateVO;
import vo.PlayListVO;
import vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	
	@Autowired
	MusicService mservice;
	
	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	//-2022/11/04수정-----------------------------------------------------------------------------------------------------------------	
	
	@RequestMapping(value = "/usertotal")
	public ModelAndView usertotal(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv) {
		String uri = "/admin/usertotal";
		// MemberList
				List<UserVO> list = new ArrayList<UserVO>();
				list = service.userTotal();
				if ( list!=null ) {
					mv.addObject("userlist", list);
				}else {
					mv.addObject("message", "~~ 출력 자료가 없습니다 ~~");
				}
		
		mv.setViewName(uri);
		return mv;
	}
	
	//-2022/11/04수정-----------------------------------------------------------------------------------------------------------------	
	
	
	/* ===== 로그인 START ===== */
	
	@RequestMapping(value = {"/","loginf"})
	public ModelAndView loginf(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv) {
		String uri = "/userFolder/login";
		mv.setViewName(uri);
		return mv;
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, UserVO vo, RedirectAttributes rttr) {
		// 1) request 처리
		String password = vo.getPassword();
		String uri = "/userFolder/login";
		
		PlayListVO pvo = new PlayListVO();
		List<PlayListVO> list = new ArrayList<PlayListVO>();
		
		// 2) service 처리
		//vo.setId(id);
		vo = service.userSelectOne(vo);
		
		if ( vo != null ) { 
			// ID 는 일치 -> Password 확인
			
			if ( passwordEncoder.matches(password, vo.getPassword()) ) {
				request.getSession().setAttribute("loginID", vo.getId());
				request.getSession().setAttribute("loginName", vo.getName());
				request.getSession().setAttribute("loginPW", password);
				request.getSession().setAttribute("userGrade", vo.getUsergrade());
				request.getSession().setAttribute("loginPhone", vo.getPhone());
				request.getSession().setAttribute("loginAddress", vo.getAddress());
				request.getSession().setAttribute("endDate", vo.getEnd_date());
				pvo.setId(vo.getId());
				list = mservice.selectPlayMusic(pvo);
				request.getSession().setAttribute("splayList", mservice.selectPlayMusic(pvo));
				
				uri="redirect:home" ;
			}else {
				// Password 오류
				mv.addObject("message", "~~ Password 오류,  다시 하세요 ~~");
			}
		}else {	// ID 오류
			mv.addObject("message", "~~ ID 오류,  다시 하세요 ~~");
		} //else
		mv.setViewName(uri);
		return mv;
	} 
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		HttpSession session = request.getSession(false);
    	if (session!=null) session.invalidate();
    	mv.addObject("message", "~~ 로그아웃 되었습니다 ~~"); 
    	mv.setViewName("redirect:home");
		return mv;
	}
	
	/* ===== 로그인 END ===== */

	
	
	/* ===== 회원 가입 START ===== */
	
	@RequestMapping(value = "/signf")
	public ModelAndView signf(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv) {
		String uri = "/userFolder/signup";
		mv.setViewName(uri);
		return mv;
	} // signForm
	

	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public ModelAndView signUp(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv, UserVO vo) {
		String uri = "redirect:home";
		String email = "";
		if (request.getParameter("selectemail").equals("directinput")) {
			email = request.getParameter("email");
		} else {
			email = request.getParameter("email") + request.getParameter("selectemail");
		}
		vo.setEmail(email);
		vo.setPassword(passwordEncoder.encode(vo.getPassword()) );
		
		if (service.userInsert(vo) > 0) {
			mv.addObject("message", "회원가입 성공");
		} else {
			mv.addObject("message", "회원가입 실패");
			uri = "/userFolder/signup";
		}

		// 3. 결과(ModelAndView)전달
		mv.setViewName(uri);
		return mv;
	} // signUp
	
	// ** id 중복확인
		@RequestMapping(value = "/idDupCheck")
		public ModelAndView idDupCheck(HttpServletRequest request, HttpServletResponse response,
				ModelAndView mv, UserVO vo) {
			// 1) ** 입력한 newID보관
			mv.addObject("newId", vo.getId());
			// 2) service
			vo = service.userSelectOne(vo);
			// 3) 결과 처리
			if (vo != null) {
				// -> newId 사용 불가능
				mv.addObject("isUse", "F");
			} else {
				mv.addObject("isUse", "T");
			}
			mv.setViewName("/userFolder/idDupCheck");
			return mv;

		} // idDupCheck
		
	/* ===== 회원 가입 END ===== */
	
		
		
	/* ===== 상세 보기 START ===== */
		
	@RequestMapping(value = "/userDetail")
	public ModelAndView userDetail(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv, UserVO vo, PayDateVO po) {
		String uri = "/userFolder/userdetail";
		vo.setId(request.getParameter("id"));
		vo = service.userSelectOne(vo);
		mv.addObject("user", vo);
		
		po.setId(request.getParameter("id"));
		po = service.paydateSelectOne(po);
		mv.addObject("paydate", po);
		mv.setViewName(uri);
		return mv;
	}
	
	/* ===== 상세 보기 END ===== */

	
	
	/* ===== 업데이트 START ===== */
	/* === 유저 업데이트 === */
	@RequestMapping(value = "/userUpdatef")
	public ModelAndView userUpdatef(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv, UserVO vo, PayDateVO po) {
		String uri = "/userFolder/userUpdate";
		vo.setId(request.getParameter("id"));
		vo = service.userSelectOne(vo);
		vo.setEmail(vo.getEmail().substring(0, vo.getEmail().indexOf('@')));
		mv.addObject("user", vo);
		
		po.setId(request.getParameter("id"));
		po = service.paydateSelectOne(po);
		mv.addObject("paydate", po);
		mv.setViewName(uri);
		return mv;
	}
	
	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public ModelAndView userUpdate(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv, UserVO vo) {
		String uri = "/userFolder/userdetail";
		String email = "";
		vo.setId(request.getParameter("id"));
		if (request.getParameter("selectemail").equals("directinput")) {
			email = request.getParameter("email");
		} else {
			email = request.getParameter("email") + request.getParameter("selectemail");
		}
		vo.setEmail(email);
		if( service.userUpdate(vo) > 0 ) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		mv.addObject("user", vo);
		mv.setViewName(uri);
		return mv;
	}
	/* === 유저 암호변경 === */
	// 암호 변경 화면으로 이동
	@RequestMapping(value = "/userPrePassword")
	public ModelAndView userPrePassword(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv, UserVO vo) {
		String uri = "/userFolder/userPrePassword";
		mv.setViewName(uri);
		return mv;
	}
	// 현재 암호 확인, 맞으면 -> userNextPassword / 틀리면, alert
	@RequestMapping(value = "/userPassword", method = RequestMethod.POST)
	public ModelAndView userPassword(HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr,
			ModelAndView mv, UserVO vo) {
		String uri = "/userFolder/userPrePassword";
		vo.setId((String)request.getSession().getAttribute("loginID"));
		vo = service.userSelectOne(vo);
		if (passwordEncoder.matches(request.getParameter("password"), vo.getPassword() ) ) {
			uri = "/userFolder/userPassword";
		} else {
			rttr.addFlashAttribute("error", "암호가 맞지 않습니다.");
		}
		mv.setViewName(uri);
		return mv;
	}
	// 변경할 암호로 업데이트
	@RequestMapping(value = "/userNextPassword", method = RequestMethod.POST)
	public ModelAndView userNextPassword(HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr,
			ModelAndView mv, UserVO vo) {
		String uri = "redirect:home";
		vo.setId((String)request.getSession().getAttribute("loginID"));
		vo = service.userSelectOne(vo);
		vo.setPassword(passwordEncoder.encode(request.getParameter("password")));
		if(service.userPasswordChange(vo) > 0) {
			rttr.addFlashAttribute("message", "암호변경 완료");
		}
		
		mv.setViewName(uri);
		return mv;
	}
	/* ===== 업데이트 END ===== */
	
	/* ===== 회원 탈퇴 START ===== */
	@RequestMapping(value = "/userDelete")
	public ModelAndView userDelete(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv, UserVO vo, RedirectAttributes rttr) {
		String id = null;
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("loginID") != null) {
			id = (String) session.getAttribute("loginID");
			if (!"admin".equals(id)) vo.setId(id);
			
			if (service.userDelete(vo) > 0) {
				if (!"admin".equals(id)) {
					session.invalidate();
				}
			}
		}

		mv.setViewName("redirect:home");
		return mv;

	}
	/* ===== 회원 탈퇴 END ===== */
	
	
}
