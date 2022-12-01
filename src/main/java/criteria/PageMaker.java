package criteria;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;

@Getter
public class PageMaker {

	private int totalRowsCount; // 전체Row 갯수 (전체 Page수 계산위해 필요)
	private int spageNo; // view 에 표시할 첫 PageNo
	private int epageNo; // view 에 표시할 끝 PageNo

	private int displayPageNo = 5; // 1Page당 표시할 pageNo갯수
	private int lastPageNo; 
	// => 출력 가능한 마지막 PageNo (totalRowCount, rowsPerPage 로 계산)

	private boolean prev; // 이전 PageBlock 으로
	private boolean next; // 다음 PageBlock 으로

	private Criteria cri;


	public void setCri(Criteria cri) {
		this.cri=cri;
	}


	// 2) totalRowCount
	public void setTotalRowsCount(int totalRowsCount) { 
		this.totalRowsCount = totalRowsCount; 
		calcData();
	}

	// 3) 위외에 필요값 계산

	public void calcData() {
		// 3.1) currPage가 속한 페이지블럭의 epageNo 를 계산

		epageNo=(int)Math.ceil(cri.getCurrPage()/(double)displayPageNo) * displayPageNo;
		spageNo= (epageNo-displayPageNo) + 1 ;

		// 3.2) lastPageNo 계산, epageNo 확인
		lastPageNo=(int)Math.ceil(totalRowsCount/(double)cri.getRowsPerPage());
		if ( epageNo>lastPageNo ) epageNo=lastPageNo;


		// 3.3) prev, next
		prev = spageNo == 1 ? false : true;
		next = epageNo == lastPageNo ? false : true;
	}

	// 4) QueryString 만들기

	public String makeQuery(int currPage, int rowsCount) {
		cri.setRowsPerPage(rowsCount);
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance().
				queryParam("currPage", currPage).
				queryParam("rowsPerPage", rowsCount).
				build();
		return uriComponents.toString();	
	} //makeQuery

	// ** ver02
//	 => ?curPage=1&rowsPerPage=3&searchType=t&keyword=Java
	public String searchQuery(int currPage) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().
				queryParam("currPage", currPage).
				queryParam("rowsPerPage", cri.getRowsPerPage()).
				queryParam("searchType", cri.getSearchType()).
				queryParam("keyword", cri.getKeyword()).build();
		return uriComponents.toString();	
	}
	public String mainsearchQuery(int currPage) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().
				queryParam("currPage", currPage).
				queryParam("rowsPerPage", cri.getRowsPerPage()).
				queryParam("searchType", cri.getSearchType()).
				queryParam("keywords", cri.getKeyword()).build();
		return uriComponents.toString();	
	}

}
