package miniProj1.Member;

public class Test {
	public static void main(String[] args) {
		MemberDAO memberDAO = new MemberDAO();
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMid("csk");
		MemberVO memberVO2 =  memberDAO.read(memberVO);
		System.out.println("test " + memberVO2 );
	}
}
