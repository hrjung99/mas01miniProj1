package miniProj1.Member;

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
	
	
	
	

}
