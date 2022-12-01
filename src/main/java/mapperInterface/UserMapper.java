package mapperInterface;

import java.util.List;

import vo.PayDateVO;
import vo.UserVO;

public interface UserMapper {
	List<UserVO> userTotal(); 
	
	UserVO userSelectOne(UserVO vo);

	int userInsert(UserVO vo);

	int userPasswordChange(UserVO vo);
	
	int userUpdate(UserVO vo);
	
	int userGradeUpdate(UserVO vo);

	int userDelete(UserVO vo);
	
	int payDate(PayDateVO vo); 
	
	PayDateVO paydateSelectOne(PayDateVO vo);
	
}
