package miniProj1.Board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

public class BoardService {

	//boardDAO 객체 생성
	BoardDAO boardDAO = new BoardDAO();

	BoardService() {
		super();
	}

	public List<BoardVO> list(BoardVO board) throws ServletException, IOException {
		System.out.println("서비스-list");
		return boardDAO.list(board);
	}
	
	public BoardVO view(BoardVO board) throws ServletException, IOException {
		System.out.println("서비스-view");
		return boardDAO.read(board);
	}
	
	public int delete(BoardVO board) throws ServletException, IOException {
		System.out.println("서비스-delete");
		return boardDAO.delete(board);
	}
	
	public int insert(BoardVO board) throws ServletException, IOException {
		System.out.println("서비스-insert");
		return boardDAO.insert(board);
	}
	
	public int update(BoardVO board) throws ServletException, IOException {
		System.out.println("서비스-update");
		return boardDAO.update(board);
	}

}
