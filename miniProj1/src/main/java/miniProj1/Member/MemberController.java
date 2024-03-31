package miniProj1.Member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import miniProj1.Board.BoardService;

//jsp 에서 받아온 데이터를 가공해서 service가 처리할 수 있게 넘겨주고
//service 가 처리한 데이터를 받아다 jsp에 넘겨준다.
public class MemberController {
	
	MemberService memberService = new MemberService();
	
	public MemberController(){
		super();
		}
		
	public Object list(HttpServletRequest request, MemberVO member) throws ServletException, IOException {
		System.out.println("컨트롤러 - list 왔음");
		List<MemberVO> list = memberService.list(member);
		request.setAttribute("list", list);
		return "list";
	}
	
	public Object view(HttpServletRequest request, MemberVO member, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 - view 왔음");
		request.setAttribute("member", memberService.view(member));
		return "view";
	}
	
	public Object delete(HttpServletRequest request, MemberVO member, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 - delete 왔음");
		
		int updated = memberService.delete(member);
				
		Map<String, Object> map = new HashMap<>();
		if(updated ==1) {
			map.put("status", 0);
		}else {
			map.put("status", -99);
			map.put("statusMessage", "회원 탈퇴에 실패하였습니다.");
		}
			
		return map;
	}
	
	public Object insertForm(HttpServletRequest request, MemberVO member, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 - insertForm");
		return "insertForm";
	}
	
	
	
	public Object insert(HttpServletRequest request, MemberVO member, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 - insert 왔음");
		
		int updated = memberService.insert(member);
				
			Map<String, Object> map = new HashMap<>();
			if(updated ==1) {
			map.put("status", 0);
		}else {
			map.put("status", -99);
			map.put("statusMessage", "회원 가입에 실패하였습니다.");
		}
		return map;
	}
	
	public Object update(HttpServletRequest request, MemberVO member, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 - update 왔음");
		
		int updated = memberService.update(member);
				
		Map<String, Object> map = new HashMap<>();
		if(updated ==1) {
			map.put("status", 0);
		}else {
			map.put("status", -99);
			map.put("statusMessage", "회원 수정에 실패하였습니다.");
		}
		return map;
	}
	
	
	
	
	
	//login
	
	
	public Object existMemberID(HttpServletRequest request, MemberVO memberVO) throws ServletException, IOException {
		//1. 처리
		System.out.println("existMemberID mid->" + memberVO.getMid());
		MemberVO existMember = memberService.view(memberVO);
		Map<String, Object> map = new HashMap<>();
		System.out.println(existMember);
		
		if (existMember == null) { //사용가능한 아이디
			map.put("existUser", false);
		} else { //사용 불가능 아아디 
			map.put("existUser", true);
		}
		return map;
	}
	
	
	public Object loginForm(HttpServletRequest request) {
		return "loginForm";
	}

	public Object login(HttpServletRequest request, MemberVO memberVO) throws ServletException, IOException {
		MemberVO loginVO = memberService.view(memberVO);
		Map<String, Object> map = new HashMap<>();

		if (memberVO.isEqualPassword(loginVO)) {
			//로그인 사용자의 정보를 세션에 기록한다
			HttpSession session = request.getSession();
			session.setAttribute("loginVO", loginVO);
			map.put("status", 0);
		} else {
			map.put("status", -99);
			map.put("statusMessage", "아이디 또는 비밀번호가 잘못되었습니다");
		}
		return map;
	}

	public Object logout(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();

		//로그인 사용자의 정보를 세션에 제거한다
		HttpSession session = request.getSession();
		session.removeAttribute("loginVO"); //특정 이름을 제거한다
		session.invalidate(); //세션에 저장된 모든 자료를 삭제한다 
		map.put("status", 0);

		return map;
	}

}
