package miniProj1.Board;

import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	
	
	
	public BoardVO(int bno,String btitle, String bcontent, String bdate) {
		this(bno, btitle, bcontent,"", bdate, "","","");
		}
	
	public BoardVO(int bno, String btitle, String bcontent, String mname, String bdate) {
		this(bno, btitle, bcontent, mname, bdate, "","","");
		}
	
	
	public BoardVO(String btitle, String bcontent, String mname, String bdate) {
		this(0, btitle, bcontent, mname, bdate, "","","");
		}
	

		
	
	private int bno;
	private String btitle;
	private String bcontent;
	private String mname;
	private String bdate;
	private String mid;
	

	
	//실행 명령 필드
	private String cmd;
	
	private String searchKey;
	

}
