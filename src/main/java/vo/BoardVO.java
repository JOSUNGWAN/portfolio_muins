package vo;

import lombok.Data;

@Data
public class BoardVO {
	private int seq;
	private String id;
	private String title;
	private String content;
	private String regdate;
	private int cnt;
	private int root;
	private int step;
	private int indent;
	private int vote;
}
