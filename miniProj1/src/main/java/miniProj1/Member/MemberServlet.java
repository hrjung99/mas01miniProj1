package miniProj1.Member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import miniProj1.Board.BoardController;
import miniProj1.Board.BoardVO;

/**
 * Servlet implementation class UserServlet
 */
//@WebServlet("/UserServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberController memberController = new MemberController();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doService(request, response);
	}
	
	
	private Map<String, Object> convertMap(Map<String, String[]> map) {
		Map<String, Object> result = new HashMap<>();

		for (var entry : map.entrySet()) {
			if (entry.getValue().length == 1) {
				//문자열 1건  
				result.put(entry.getKey(), entry.getValue()[0]);
			} else {
				//문자열 배열을 추가한다  
				result.put(entry.getKey(), entry.getValue());
			}
		}	
		
		return result;
	}
	
	private void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 인코딩

		MemberVO memberVO= null;	
		System.out.println("서블릿 왔당");	
		

	
		
		// 검색은 나중에
		// jsp 가 보낸데이터 타입 확인하고 받는 부분
		String contentType = request.getContentType(); // 요청의 타입 확인
		System.out.println("contentType000 =" + contentType);
		ObjectMapper objectMapper = new ObjectMapper(); //자바 객체를 JSON 문자열로 변환 or JSON 데이터를 자바 객체 형태로 사용할 수 있게 해줌
		
		if (contentType == null || contentType.startsWith("application/x-www-form-urlencoded")) {
			memberVO = objectMapper.convertValue(convertMap(request.getParameterMap()), MemberVO.class);
		} else if (contentType.startsWith("application/json")) {
			memberVO = objectMapper.readValue(request.getInputStream(), MemberVO.class);
		}
		
		String action = memberVO.getAction();
		
		//action 관련하여 값 받아서출력
		//String action = request.getParameter("action");
		
		System.out.println("action : " + action);

		
		
		//분배
		Object result = switch(action) {
		case "list" -> memberController.list(request, memberVO);
		case "view" -> memberController.view(request, memberVO, response);
		case "delete" -> memberController.delete(request, memberVO, response);
		case "insertForm" -> memberController.insertForm(request, memberVO, response);
		case "insert" -> memberController.insert(request, memberVO, response);
		case "update" ->memberController.update(request, memberVO, response);
		default -> ""; 
		};
		
		if (result instanceof Map map) {
			//json 문자열을 리턴
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(objectMapper.writeValueAsString(map));
		} else if (result instanceof String url) {
			if (url.startsWith("redirect:")) {
				//리다이렉트
				response.sendRedirect(url.substring("ridirect:".length()));
			} else {
				//포워딩 
				System.out.println("url=" + url);
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/member/"+"member_"+url+".jsp");
				rd.forward(request, response);
			}			
		}
		System.out.println("memberVO : "+ memberVO);

	}

}
