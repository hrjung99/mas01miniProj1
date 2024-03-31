package miniProj1.Board;

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
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardController boardController = new BoardController();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardServlet() {
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

		BoardVO boardVO= null;	
		System.out.println("서블릿 왔당");	
		

	
		
		// 검색은 나중에
		// jsp 가 보낸데이터 타입 확인하고 받는 부분
		String contentType = request.getContentType(); // 요청의 타입 확인
		System.out.println("contentType111 =" + contentType);
		ObjectMapper objectMapper = new ObjectMapper(); //자바 객체를 JSON 문자열로 변환 or JSON 데이터를 자바 객체 형태로 사용할 수 있게 해줌
		
		if (contentType == null || contentType.startsWith("application/x-www-form-urlencoded")) {
			boardVO = objectMapper.convertValue(convertMap(request.getParameterMap()), BoardVO.class);
		} else if (contentType.startsWith("application/json")) {
			boardVO = objectMapper.readValue(request.getInputStream(), BoardVO.class);
		}
		
		String cmd = boardVO.getCmd();
		
		//cmd 관련하여 값 받아서출력
		//String cmd = request.getParameter("cmd");
		
		System.out.println("cmd : " + cmd);

		
		
		//분배
		Object result = switch(cmd) {
		case "list" -> boardController.list(request, boardVO);
		case "view" -> boardController.view(request, boardVO, response);
		case "delete" -> boardController.delete(request, boardVO, response);
		case "insertForm" -> boardController.insertForm(request, boardVO, response);
		case "insert" -> boardController.insert(request, boardVO, response);
		case "update" ->boardController.update(request, boardVO, response);
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
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/board/"+"board_"+url+".jsp");
				rd.forward(request, response);
			}			
		}
		System.out.println("boardVO : "+ boardVO);

	}

}
