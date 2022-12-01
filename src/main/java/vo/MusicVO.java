package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MusicVO {
	private int music_code;
	private String mname;
	private String aname;
	private String album;
	private String thema;
	private String mcategory;
	private String regdate;
	private String lyrics;
	private int count;
	private String imagefile;
	
	private MultipartFile uploadimagef;
	private MultipartFile uploadmusicf;
	
}
