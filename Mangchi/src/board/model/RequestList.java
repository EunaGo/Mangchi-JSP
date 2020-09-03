package board.model;

import java.util.List;

public class RequestList {
	// 회원 리스트
	private List<RequestWriting2> rqList;
	// 전체 게시물의 개수
	private int requestTotalCount;
	// 현재 페이지 번호
	private int currentPageNumber;
	// 전체페이지의 개수
	private int pageTotalCount;
	// 페이지당 표현 게시물의 개수
	private int requestCountPerPage;
	// 게시물 시작행
	private int startRaw;

	
	public RequestList(
				   List<RequestWriting2> rqList, 
				   int requestTotalCount, 
				   int currentPageNumber, 
				   int requestCountPerPage, 
				   int startRaw
					   ) {
		this.rqList = rqList;
		this.requestTotalCount = requestTotalCount;
		this.currentPageNumber=currentPageNumber;
		this.requestCountPerPage = requestCountPerPage;
		this.startRaw = startRaw;
		calTotalPageCount();
	}

	private void calTotalPageCount() {
		if(requestTotalCount==0) {
			pageTotalCount=0;
		}else {
			pageTotalCount= requestTotalCount/requestCountPerPage;
			if(requestTotalCount%requestCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}
	
	
	
	public List<RequestWriting2> getRqList() {
		return rqList;
	}

	public void setRqList(List<RequestWriting2> rqList) {
		this.rqList = rqList;
	}

	public int getRequestTotalCount() {
		return requestTotalCount;
	}

	public void setRequestTotalCount(int requestTotalCount) {
		this.requestTotalCount = requestTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getRequestCountPerPage() {
		return requestCountPerPage;
	}

	public void setRequestCountPerPage(int requestCountPerPage) {
		this.requestCountPerPage = requestCountPerPage;
	}

	public int getStartRaw() {
		return startRaw;
	}

	public void setStartRaw(int startRaw) {
		this.startRaw = startRaw;
	}

	public boolean isEmpty() {
		return requestTotalCount == 0;
	}
}
