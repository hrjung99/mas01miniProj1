package miniProj1.Member;

import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	
	public MemberVO(String mid, String mpass, String mname, String mage, String madd, String mpno, String mgender) {
	this(mid, mpass, mname, mage, madd, mpno, mgender, "", "");
	}
	

		public MemberVO(String mpass, String mname, String mage, String madd, String mpno, String mgender) {
		this("", mpass, mname, mage, madd, mpno, mgender, "", "");
	}
	
	private String mid;
	private String mpass;
	private String mname;
	private String mage;


	private String madd;
	private String mpno;
	private String mgender;
	private String hobby;
	
	private String searchKey;

}