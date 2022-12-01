package vo;

import lombok.Data;

@Data
public class UserVO {
	private String id; // 4 ~ 15 영문, 숫자 가능, 특수문자 사용 불가
	private String password; // 8 ~ 15 특수문자 사용 가능
	private String name; //
	private String email; // dnjsdls321 [select option] : [@naver.com][@daum.net][@google.com][@직접입력]
	private String phone; // sub 010-1234-1234
	private String address; // 주소입력
	private String nickname; // 영어, 한글 상관없이 8 ~ 15
	private String usergrade; // 비회원(보기만 가능), 일반(게시판 글쓰기 가능), 프리미엄(듣기 글쓰기 가능), 어드민(전체 권한) 
	private String mycategory; // 장르
	private String birthdate; // 19920208
	
	private String createtime; // 자동 생성
	private String end_date;
}
