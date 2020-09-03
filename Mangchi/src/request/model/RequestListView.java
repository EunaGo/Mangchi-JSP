package request.model;

import java.util.List;

public class RequestListView {

	private int requestTotalCount;
	private int currentPageNumber;
	private List <Request> requestList;
	private int pageTotalCount;
	private int requestCountPerpage;
	private int startRow;
	
	
	public RequestListView(int requestTotalCount, int currentPageNumber, List<Request> requestList,
			int requestCountPerpage, int startRow) {
		super();
		this.requestTotalCount = requestTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.requestList = requestList;
		this.requestCountPerpage = requestCountPerpage;
		this.startRow = startRow;
		calTotalCount();
	}

	private void calTotalCount() {
		if(requestTotalCount==0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = requestTotalCount/requestCountPerpage;
			System.out.println(requestTotalCount%requestCountPerpage);
			if(requestTotalCount%requestCountPerpage > 0) {
				pageTotalCount ++;
			}
			System.out.println(pageTotalCount);
		}
	}
	public RequestListView() {}


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


	public List<Request> getRequestList() {
		return requestList;
	}


	public void setRequestList(List<Request> requestList) {
		this.requestList = requestList;
	}


	public int getPageTotalCount() {
		return pageTotalCount;
	}


	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}


	public int getRequestCountPerpage() {
		return requestCountPerpage;
	}


	public void setRequestCountPerpage(int requestCountPerpage) {
		this.requestCountPerpage = requestCountPerpage;
	}


	public int getStartRow() {
		return startRow;
	}


	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}


	@Override
	public String toString() {
		return "RequestListView [requestTotalCount=" + requestTotalCount + ", currentPageNumber=" + currentPageNumber
				+ ", requestList=" + requestList + ", pageTotalCount=" + pageTotalCount + ", requestCountPerpage="
				+ requestCountPerpage + ", startRow=" + startRow + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}
