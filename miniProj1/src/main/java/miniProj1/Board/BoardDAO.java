package miniProj1.Board;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

	private static Connection conn = null;

	private static PreparedStatement BoardListPstmt = null; // 검색X 리스트
	private static PreparedStatement BoardListPstmt2 = null; // 검색O 리스트

	private static PreparedStatement BoardInsertPstmt = null; // 회원 가입
	private static PreparedStatement BoardInsertHobbyPstmt = null; // 회원 가입(취미)

	private static PreparedStatement BoardDeletePstmt = null; // 회원 탈퇴
	private static PreparedStatement BoardDetailPstmt = null; // 마이페이지
	private static PreparedStatement BoardUpdatePstmt = null;// 회원 수정
	private static PreparedStatement BoardUpdateHobbyPstmt = null;// 회원 수정(취미)

	// jdbc 설치 및 연결 필요
	static {
		// jdbc 드라이버 로딩
		try {
			// jdbc 드라이버 로딩
			Class.forName("org.mariadb.jdbc.Driver");

			// DB 연결
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/miniProj_db", "bituser", "1004");

			System.out.println("연결 성공");
			conn.setAutoCommit(false);

			// 전체 조회
			BoardListPstmt = conn.prepareStatement("SELECT B.BNO,B.BTITLE, B.BCONTENT, M.MNAME, B.BDATE FROM TB_BOARD B INNER JOIN TB_MEMBER M ON B.MID=M.MID");
			// 검색 조회
			BoardListPstmt2 = conn.prepareStatement("SELECT B.BNO,B.BTITLE, B.BCONTENT, M.MNAME, B.BDATE FROM TB_BOARD B INNER JOIN TB_MEMBER M ON B.MID=M.MID WHERE btitle LIKE ? ");
			// 게시물 등록
			BoardInsertPstmt = conn.prepareStatement("insert into tb_board(btitle, bcontent, bdate, mid) values (?,?,current_timestamp(), ?)");
			// 게시물 삭제
			BoardDeletePstmt = conn.prepareStatement("delete from tb_board where bno=?");
			// 게시물 상세 보기
			BoardDetailPstmt = conn.prepareStatement("SELECT B.BNO,B.BTITLE, B.BCONTENT, M.MNAME, B.BDATE FROM TB_BOARD B INNER JOIN TB_MEMBER M ON B.MID=M.MID WHERE bno= ?");
			// 게시물 수정
			BoardUpdatePstmt = conn.prepareStatement("update tb_board set btitle=?, bcontent=? where bno=?"); 

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}

	// list 함수 구현(+검색 기능)
	public List<BoardVO> list(BoardVO boardVO) {
		List<BoardVO> list = new ArrayList<BoardVO>();

		try {
			int updated = 0;
			ResultSet rs = null;
			String searchKey = boardVO.getSearchKey();
			
			// 검색O
			if (searchKey != null && searchKey.length() != 0) {
				BoardListPstmt2.setString(1, "%" + searchKey + "%");
				rs = BoardListPstmt2.executeQuery();

			} else { // 검색X

				rs = BoardListPstmt.executeQuery();
			}
			while (rs.next()) {
				BoardVO board = new BoardVO(
						rs.getInt("BNO")
						, rs.getString("BTITLE")
						, rs.getString("BCONTENT")
						, rs.getString("MNAME")
						, rs.getString("BDATE"));
				// 취미추가
				list.add(board);

			}

			conn.commit();
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}

		return list;
	}

	
	
	// read 함수 구현
	public BoardVO read(BoardVO boardVO) {
		BoardVO view = null;
		try

		{
			System.out.println("bno = " + boardVO.getBno());
			BoardDetailPstmt.setInt(1, boardVO.getBno());
			ResultSet rs = BoardDetailPstmt.executeQuery();
			if (rs.next()) {
				view = new BoardVO(
						rs.getInt("bno")
						, rs.getString("btitle")
						, rs.getString("bcontent")
						, rs.getString("mname")
						, rs.getString("bdate")
						);
			}
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		System.out.println("DAO의 view=" + view);

		return view;
	}

	
	
	// delete 함수 구현
	public int delete(BoardVO boardVO) {

		int updated = 0;

		try {
			BoardDeletePstmt.setInt(1, boardVO.getBno());
			updated = BoardDeletePstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		System.out.println("DAO - delete()의 updated = " + updated);
		return updated;
	}

	
	
	// insert 함수 구현
	public int insert(BoardVO boardVO) {
		int updated = 0;

		try {

			BoardInsertPstmt.setString(1, boardVO.getBtitle());
			BoardInsertPstmt.setString(2, boardVO.getBcontent());
			BoardInsertPstmt.setString(3, boardVO.getMid());

			updated = BoardInsertPstmt.executeUpdate();
			// 입력된 비밀번호와 비밀번호 확인이 같은지, 같지 않은지 유효성 검사
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}

		return updated;
	}


	// update 함수 구현

	public int update(BoardVO boardVO) {
		int updated = 0;

		try {
			BoardUpdatePstmt.setString(1, boardVO.getBtitle());
			BoardUpdatePstmt.setString(2, boardVO.getBcontent());
			BoardUpdatePstmt.setInt(3, boardVO.getBno());

	


			updated = BoardUpdatePstmt.executeUpdate();

			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}

		return updated;
	}

}
