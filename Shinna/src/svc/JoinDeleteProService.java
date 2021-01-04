package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;
public class JoinDeleteProService {

	public boolean isDelete( String isdelete,String id) {
		boolean isDelete = false;
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		MemberBean member = new MemberBean();
		member.setId(id);
		member.setPw(isdelete);
		String userId = memberDAO.memberInfoId(member);
		int isDeleteCount = 0;
		if(userId != null) isDeleteCount = memberDAO.isDelete(id);
		
		if(isDeleteCount > 0 ) {
			commit(con);
			isDelete = true;
		} else {
			rollback(con);
		}
		
		close(con);
		return isDelete;
	}
}
