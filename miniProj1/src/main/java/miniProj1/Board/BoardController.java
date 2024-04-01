package miniProj1.Board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import miniProj1.Board.BoardService;

//jsp 에서 받아온 데이터를 가공해서 service가 처리할 수 있게 넘겨주고
//service 가 처리한 데이터를 받아다 jsp에 넘겨준다.
public class BoardController {
	
	BoardService boardService = new BoardService();
	
	public BoardController(){
		super();
		}
		
	public Object list(HttpServletRequest request, BoardVO board) throws ServletException, IOException {
		System.out.println("board 컨트롤러 - list 왔음");
		List<BoardVO> list = boardService.list(board);
		request.setAttribute("list", list);
		return "list";
	}
	
	public Object view(HttpServletRequest request, BoardVO board, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("board 컨트롤러 - view 왔음");
		request.setAttribute("board", boardService.view(board));
		return "view";
	}
	
	public Object delete(HttpServletRequest request, BoardVO board, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("board 컨트롤러 - delete 왔음");
		
		int updated = boardService.delete(board);
				
		Map<String, Object> map = new HashMap<>();
		if(updated ==1) {
			map.put("status", 0);
		}else {
			map.put("status", -99);
			map.put("statusMessage", "게시물 삭제를 실패했습니다.");
		}
			
		return map;
	}
	
	public Object insertForm(HttpServletRequest request, BoardVO board, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 - insertForm");
		return "insertForm";
	}
	
	
	
	public Object insert(HttpServletRequest request, BoardVO board, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 - insert 왔음");
		
		int updated = boardService.insert(board);
				
			Map<String, Object> map = new HashMap<>();
			if(updated ==1) {
			map.put("status", 0);
		}else {
			map.put("status", -99);
			map.put("statusMessage", "게시물 등록을 실패했습니다.");
		}
		return map;
	}
	
	public Object update(HttpServletRequest request, BoardVO board, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 - update 왔음");
		
		int updated = boardService.update(board);
				
		Map<String, Object> map = new HashMap<>();
		if(updated ==1) {
			map.put("status", 0);
		}else {
			map.put("status", -99);
			map.put("statusMessage", "게시물 수정을 실패하였습니다.");
		}
		return map;
	}
	
	
	public Object news(HttpServletRequest request, BoardVO board, HttpServletResponse response ) throws ServletException, IOException {
		System.out.println("board 컨트롤러 - news 왔음");
		return "news";
	}
	
	public Object introduce(HttpServletRequest request, BoardVO board, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("board 컨트롤러 - introduce 왔음");
		return "introduce";
	}
	

}
