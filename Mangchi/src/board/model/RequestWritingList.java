package board.model;

import java.util.List;

public class RequestWritingList {
	
		private int requestTotalCount;

		private int requestCountPage;

		private int pageTotalCount;
		
		private int currentPageNumber;

		private List<RequestWriting> requestWriting;

		private int startRow;

		public RequestWritingList(int requestTotalCount, int requestCountPage,
				int currentPageNumber, List<RequestWriting> requestWriting, int startRow) {
			this.requestTotalCount = requestTotalCount;
			this.requestCountPage = requestCountPage;
			this.currentPageNumber = currentPageNumber;
			this.requestWriting = requestWriting;
			this.startRow = startRow;
			calTotalCount();
		}

		// 전체 페이지를 구하는 메소드
		private void calTotalCount() {
			if (requestTotalCount == 0) {
				pageTotalCount = 0;
			} else {

				// 전체 페이지 수 = 전체 회원 정보 수 / 한 페이지 당 표현 할 회원 정보 수
				pageTotalCount = requestTotalCount / requestCountPage;
				// 전체 회원 정보 수 / 페이지 당 회원 정보 수의 나머지에 따라 페이지를 추가해준다.?
				if (requestTotalCount % requestCountPage > 0) {
					pageTotalCount++;
				}

			}
		}
		
		
		
		public int getRequestTotalCount() {
			return requestTotalCount;
		}

		public void setRequestTotalCount(int requestTotalCount) {
			this.requestTotalCount = requestTotalCount;
		}

		public int getRequestCountPage() {
			return requestCountPage;
		}

		public void setRequestCountPage(int requestCountPage) {
			this.requestCountPage = requestCountPage;
		}

		public int getPageTotalCount() {
			return pageTotalCount;
		}

		public void setPageTotalCount(int pageTotalCount) {
			this.pageTotalCount = pageTotalCount;
		}

		public int getCurrentPageNumber() {
			return currentPageNumber;
		}

		public void setCurrentPageNumber(int currentPageNumber) {
			this.currentPageNumber = currentPageNumber;
		}

		public List<RequestWriting> getRequestWriting() {
			return requestWriting;
		}

		public void setRequestWriting(List<RequestWriting> requestWriting) {
			this.requestWriting = requestWriting;
		}

		public int getStartRow() {
			return startRow;
		}

		public void setStartRow(int startRow) {
			this.startRow = startRow;
		}

		@Override
		public String toString() {
			return "" + requestWriting +"";
		} 	
		
		
		
		
	
		
}
