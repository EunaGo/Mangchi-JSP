package message.model;

import java.util.List;

public class MessageListView {
	
	
	//받는 사람 아이디
	private String receiver;
	private int writer;

	//전체 게시물의 갯수
	private int messageTotalCount;
	//현재 페이지 번호
	private int currentPageNumber;
	//메시지 리스트
	private List<Message> messageList;
	//전체 페이지의 갯수
	private int pageTotalCount;
	//페이지 당 표현 게시물의 갯수
	private int messageCountPerpage;
	//게시물의 시작 행
	private int startRow;
	
	
	public MessageListView(String receiver, int messageTotalCount, int currentPageNumber, List<Message> messageList,	int messageCountPerpage, int startRow) {
		this.receiver=receiver;
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageList = messageList;
		this.messageCountPerpage = messageCountPerpage;
		this.startRow = startRow;
		calTotalPageCount();
	}
	
	
	public MessageListView(int writer, int messageTotalCount, int currentPageNumber, List<Message> messageList,	int messageCountPerpage, int startRow) {
		this.writer=writer;
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageList = messageList;
		this.messageCountPerpage = messageCountPerpage;
		this.startRow = startRow;
		calTotalPageCount();
	}
	
	
	
	private void calTotalPageCount() {
		
		if(messageTotalCount==0) {
			pageTotalCount=0;
		} else {
			pageTotalCount=messageTotalCount/messageCountPerpage;
			if(messageTotalCount%messageCountPerpage>0) {
				pageTotalCount++;
			}
			
		}
	}

	
	
	
	public String getReceiver() {
		return receiver;
	}
	
	
	public int getWriter() {
		return writer;
	}


	public int getMessageTotalCount() {
		return messageTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getMessageCountPerpage() {
		return messageCountPerpage;
	}

	public int getStartRow() {
		return startRow;
	}

	@Override
	public String toString() {
		return "MessageListView [receiver=" + receiver + ", messageTotalCount=" + messageTotalCount
				+ ", currentPageNumber=" + currentPageNumber + ", messageList=" + messageList + ", pageTotalCount="
				+ pageTotalCount + ", messageCountPerpage=" + messageCountPerpage + ", startRow=" + startRow + "]";
	}


	
	
	
}
