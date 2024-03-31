package miniProj1.Member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

public class MemberService {

	//memberDAO 객체 생성
	MemberDAO memberDAO = new MemberDAO();

	MemberService() {
		super();
	}

	public List<MemberVO> list(MemberVO member) throws ServletException, IOException {
		System.out.println("서비스-list");
		return memberDAO.list(member);
	}
	
	public MemberVO view(MemberVO member) throws ServletException, IOException {
		System.out.println("서비스-view");
		return memberDAO.read(member);
	}
	
	public int delete(MemberVO member) throws ServletException, IOException {
		System.out.println("서비스-delete");
		return memberDAO.delete(member);
	}

}
