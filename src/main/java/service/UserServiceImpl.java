package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.UserMapper;
import vo.PayDateVO;
import vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper mapper;
	
	
	@Override
	public List<UserVO> userTotal() {
		return mapper.userTotal();
	}
	
	@Override
	public UserVO userSelectOne(UserVO vo) {
		return mapper.userSelectOne(vo);
	} //selectOne

	@Override
	public int userInsert(UserVO vo) {
		return mapper.userInsert(vo);
	} //insert

	@Override
	public int userPasswordChange(UserVO vo) {
		return mapper.userPasswordChange(vo);
	} //passwordChange
	
	@Override
	public int userUpdate(UserVO vo) {
		return mapper.userUpdate(vo);
	} //update
	
	public int userGradeUpdate(UserVO vo) {
		return mapper.userGradeUpdate(vo);
		
	}

	@Override
	public int userDelete(UserVO vo) {
		return mapper.userDelete(vo);
	} //delete
	
	public int payDate(PayDateVO vo) {
		return mapper.payDate(vo);
		
	}
	
	public PayDateVO paydateSelectOne(PayDateVO vo) {
		return mapper.paydateSelectOne(vo);
	}
	
	

}
