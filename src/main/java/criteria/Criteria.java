package criteria;

import lombok.Data;

@Data
public class Criteria {
	private int rowsPerPage; // 1Page 출력할 Row 갯수  페이지 표시 번호 1,2,3,4,5
	private int currPage; // 현재 출력할 (요청받은) Page  클릭한 페이지 표시 번호
	private int sno; // start RowNo
	private int eno; // end RowNo(MySql 은 없어도 됨)  
	private String searchType;
	private String keyword;
	private String keywords;
	private String category;
	
	// 1) 필요한 초기값은 생성자로 초기화 
	public Criteria() {
		this.rowsPerPage = 10; 
		this.currPage = 1;
		this.category = "종합";
	}

	// 2) setCurrPage : 요청받은(출력할) PageNo set
	public void setCurrPage(int currPage) {
		if(currPage > 1) {
			this.currPage = currPage;
		} else {
			this.currPage = 1;
		}

	}

	// 3) setRowsPerPage
	public void setRowsPerPage(int rowsPerPage) {
		if(rowsPerPage > 5 && rowsPerPage <= 100) {
			this.rowsPerPage=rowsPerPage;
		} else {
			this.rowsPerPage = 5;
		}
	}

	// 4) setSnoEno : sno, eno 계산
	public void setSnoEno() {
		if(this.sno < 1) { this.sno = 1; }
		//this.sno = ((this.currPage-1)*this.rowsPerPage) + 1; // Oracle 1p=1~5 2p=6~10 3p=11~15
		this.sno = (this.currPage-1)*this.rowsPerPage; // MySql 1p=1~5 2p=6~10 3p=11~15
		this.eno = (sno + this.rowsPerPage) - 1; // MySql 에서는 필요가 없다.
	}


}
