package message.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import jdbc.ConnectionProvider;
import member.dao.MemberMessageDao;
import message.dao.MessageDao;
import message.model.Message;
import service.Service;

public class SendingMessageServiceImpl implements Service {
	
	MessageDao dao;
	MemberMessageDao mmdao;

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {

		
		int resultCnt=0;
		
		int reqlistIdx=-1;
		int senderIdx=-1;
		String receiverId=null;
		String title=null;
		String text=null;
		String img=null;
		
		Connection conn=null;
		
		try {

			boolean isMultipart=ServletFileUpload.isMultipartContent(req);
			System.out.println("메시지 업로드 시작");
			
			if(isMultipart) {
				System.out.println("서블릿 파일 업로드 확인");
				DiskFileItemFactory factory=new DiskFileItemFactory();
				ServletFileUpload upload=new ServletFileUpload(factory);
				List<FileItem> items=upload.parseRequest(req);
				Iterator<FileItem> iter=items.iterator();
				
				while(iter.hasNext()) {
					
					FileItem item=iter.next();
					
					if(item.isFormField()) {
						String paramName=item.getFieldName();
						String paramValue=item.getString("utf-8");
						
						conn=ConnectionProvider.getConnection();
						mmdao=MemberMessageDao.getInstance();

						if(paramName.equals("reqListIdx")) {
							reqlistIdx=Integer.parseInt(paramValue);
							
						} else if(paramName.equals("senderIdx")){
							senderIdx=Integer.parseInt(paramValue);
							
							
						} else if(paramName.equals("noteId")) {
							if(mmdao.existId(conn, paramValue)) {
								receiverId=paramValue;
								
							} else {
								throw new Exception("쪽지를 보낼 상대가 존재하지 않습니다.");
							}
						} else if(paramName.equals("noteTitle")){
							title=paramValue;
						}else if(paramName.equals("noteText")) {
							text=paramValue;
						} 
						
					} else {
						String uri="/upload/noteImage";
						String realPath=req.getSession().getServletContext().getRealPath(uri);
						String newFileName=System.nanoTime()+"_"+item.getName();

						File saveFile=new File(realPath, newFileName);
						item.write(saveFile);
						
						System.out.println("저장 완료");
						
						img=uri+"/"+newFileName;

					}
					
				}
				Message msg=new Message();
				msg.setReq_idx(reqlistIdx);
				msg.setMsg_writer(senderIdx);
				msg.setMsg_receiver(receiverId);
				msg.setMsg_title(title);
				msg.setMsg_text(text);
				msg.setMsg_img(img);
				
				dao=MessageDao.getInstance();
				resultCnt=dao.sendMessage(conn, msg);
				req.setAttribute("note", msg);
				req.setAttribute("resultNote", resultCnt);
				
				
			}
			
			
		
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
		
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		return "/WEB-INF/views/message/sendingmessage.jsp";
	}

}
