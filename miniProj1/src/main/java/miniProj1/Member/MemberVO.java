package miniProj1.Member;

import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	
	public MemberVO(String mid, String mpass, String mname, int mage, String madd, String mpno, String mgender) {
	this(mid, mpass,"", mname, mage, madd, mpno, mgender, "", "", "");
	}
	

		public MemberVO(String mpass, String mname, int mage, String madd, String mpno, String mgender) {
		this("", mpass, "", mname, mage, madd, mpno, mgender, "", "" ,"");
	}
		
	
	private String mid;
	private String mpass;
	private String mpass2;

	private String mname;
	private int mage;
	private String madd;
	private String mpno;
	private String mgender;
	private String hobby;
	
	//실행 명령 필드
	private String action;
	
	private String searchKey;
	
	

	public boolean isEmptySearchKey() {
		return searchKey == null || searchKey.length() == 0; 
	}
	
	public boolean isEqualPassword(MemberVO memberVO) {
		return memberVO != null && mpass.equals(memberVO.getMpass());
	}
}
