package teamproject.sagi.dto;

public class ListPager {
	private int totalRows;		//전체 행수
	private int totalPageNo;	//전체 페이지 수
	private int totalGroupNo;	//전체 그룹 수
	private int startPageNo;	//그룹의 시작 페이스 번호
	private int endPageNo;		//그룹의 끝 페이지 번호
	private int pageNo;			//현재 페이지 번호
	private int pagesPerGroup;	//그룹당 페이지 수
	private int groupNo;		//현재 그룹 번호
	private int rowsPerPage;	//페이지당 행 수 
	private int startRowNo;		//페이지의 시작 행 번호
	private int endRowNo;		//페이지의 마지막 행 번호
	private int type;	//order by할 타입
	private int category;	//보여줄 카테고리

	public ListPager(int rowsPerPage, int pagesPerGroup, int totalRows, int pageNo, int type, int category) {
		this.rowsPerPage = rowsPerPage;
		this.pagesPerGroup = pagesPerGroup;
		this.totalRows = totalRows;
		this.pageNo = pageNo;
		this.type = type;
		this.category = category;
		
		totalPageNo = totalRows / rowsPerPage;
		if(totalRows % rowsPerPage != 0) totalPageNo++;
		
		totalGroupNo = totalPageNo / pagesPerGroup;
		if(totalPageNo % pagesPerGroup != 0) totalGroupNo++;
		
		groupNo = (pageNo - 1) / pagesPerGroup + 1;
		
		startPageNo = (groupNo-1) * pagesPerGroup + 1;
		
		endPageNo = startPageNo + pagesPerGroup - 1;
		//마지막 그룹의 end page no는 전체페이지랑 같다
		if(groupNo == totalGroupNo) endPageNo = totalPageNo;
		
		startRowNo = (pageNo - 1) * rowsPerPage + 1;
		endRowNo = pageNo * rowsPerPage;
	}

	
	public int getCategory() {
		return category;
	}


	public void setCategory(int category) {
		this.category = category;
	}


	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public int getTotalPageNo() {
		return totalPageNo;
	}

	public int getTotalGroupNo() {
		return totalGroupNo;
	}

	public int getStartPageNo() {
		return startPageNo;
	}

	public int getEndPageNo() {
		return endPageNo;
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getPagesPerGroup() {
		return pagesPerGroup;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public int getRowsPerPage() {
		return rowsPerPage;
	}
	
	public int getStartRowNo() {
		return startRowNo;
	}

	public int getEndRowNo() {
		return endRowNo;
	}	
}
	
	
