package miniProj1.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
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
