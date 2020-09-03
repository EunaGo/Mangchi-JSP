package board.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import jdbc.ConnectionProvider;
import member.model.Member;
import board.dao.BoardDao;
import board.model.RequestWriting2;
import service.Service;

public class ReqWriteServiceImpl implements Service {
	
	BoardDao dao;

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
//		LocalDateTime ldt = LocalDateTime.now();
//		String req_regdate = ldt.format(formatter);

//		req_writer = Integer.parseInt(request.getParameter("req_writer"));
//		req_title = request.getParameter("req_title");
//		req_price = Integer.parseInt(request.getParameter("req_price"));
//		req_loc = request.getParameter("req_loc");
//		System.out.println("req-Loc : " + req_loc);
//		req_latitude = 37;
//		req_longitude = 38;
//		req_text = request.getParameter("req_text");

//		String term_str = request.getParameter("req_term");
//		System.out.println("term_str: " + term_str);
//		System.out.println("req_term: " + req_term);
//	LocalDateTime dateTime= LocalDateTime.parse(req_term,formatter);
//	req_term = dateTime.format(formatter);
//	System.out.println("req_term2: "+req_term);
//	System.out.println(req_regdate);
		Connection conn = null;
		int req_writer=-1;
		String req_title=null; // 글제목
		int req_price=0; // 금액
		String req_term=null; // 반납일시
		String req_loc=null; // 주소
		String req_text=null; // 상세내용
		double req_latitude=0;// 위도
		double req_longitude=0;// 경도
		String req_img=null; // 참고이미지
		Member mb=(Member)request.getSession().getAttribute("loginInfo");
		String nick = mb.getNick();
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		try {
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			if (isMultipart) {
				// 팩토리 만들기 --> 저장공간 만들기
				DiskFileItemFactory factory = new DiskFileItemFactory();

				ServletFileUpload upload = new ServletFileUpload(factory);
				// 잘라주는 역할
				List<FileItem> items = upload.parseRequest(request);
				Iterator<FileItem> ite = items.iterator();
				while (ite.hasNext()) {
					FileItem file = ite.next();
					// isFormField() : text value를 가지는 input 확인
					if (file.isFormField()) { // type==file 이외의 input
						// 파라미터이름
						String paramName = file.getFieldName();
						// 파라미터 값
						String paramVal = file.getString("UTF-8");
						
						if(paramName.equals("req_writer")) {
							req_writer=Integer.parseInt(paramVal);
						}else if (paramName.equals("nickName")) {
							nick = paramVal;
						}else if (paramName.equals("req_title")) {
							req_title = paramVal;
						}else if (paramName.equals("req_price")) {
							req_price = Integer.parseInt(paramVal);
						}else if (paramName.equals("req_term")) {
							req_term = paramVal;
						}else if (paramName.equals("req_loc")) {
							req_loc = paramVal;
						}else if (paramName.equals("req_text")) {
							req_text = paramVal;
							if (req_text.trim().length() == 0) {
								req_text = "도와주세요";
							}
							
						}else if (paramName.equals("req_latitude")) {
							req_latitude=Double.parseDouble(paramVal);
						}else if (paramName.equals("req_longitude")) {
							req_longitude=Double.parseDouble(paramVal);
						}
						if (req_title.trim().length() == 0) {
							req_title = "[" + nick + "의 요청] 도와주세요";
						}
					}else { // type==file
						String uri="/upload/requestimg";
//						String uri = request.getSession()
//											.getServletContext()
//											.getInitParameter("uploadPath");
						String realPath = request.getSession()
												 .getServletContext()
												 .getRealPath(uri);
						
//						System.out.println(realPath);
//						System.out.println("file사이즈 : "+file.getSize());
						if(file.getSize()!=0) {
							// 파일 덮어쓰면 안되니까 앞에 나노초 붙여줌
							String newFileName = System.nanoTime() + "_" + file.getName();
							File saveFile = new File(realPath, newFileName);
							file.write(saveFile);
							System.out.println("사진저장완료");
	
	//						saveFile.delete();
	
							req_img = uri + "/" + newFileName; // 웹경로
						}
					}
				}
				

//				System.out.println("img : "+req_img);
				RequestWriting2 rw = new RequestWriting2();
				rw.setReq_writer(req_writer);
				rw.setReq_title(req_title);
				rw.setReq_price(req_price);
				rw.setReq_loc(req_loc);
				rw.setReq_term(req_term);
				rw.setReq_text(req_text);
				rw.setReq_img(req_img);
				rw.setReq_latitude(req_latitude);
				rw.setReq_longitude(req_longitude);
				
				conn = ConnectionProvider.getConnection();
				dao = BoardDao.getInstance();

				int result = dao.insertRequest(conn, rw);
				System.out.println("인서트 성공 : " + result);
				if (result == 1) {
					request.setAttribute("writeResult", result);
					request.setAttribute("writer", rw);
				}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return "/WEB-INF/views/board/writeResult.jsp";
	}

}
