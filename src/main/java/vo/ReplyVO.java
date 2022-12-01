package vo;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int rno;
	private int rno_next;
	private int seq;
	private String content;
	private String id;
	private String regdate;
	private int root;
	private int step;
	private int indent;
	
}
