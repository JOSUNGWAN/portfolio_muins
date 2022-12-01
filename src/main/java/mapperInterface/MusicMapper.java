package mapperInterface;

import java.util.List;

import criteria.Criteria;
import vo.MusicVO;
import vo.MyListVO;
import vo.PlayListVO;

public interface MusicMapper {
	List<MusicVO> musicTotal();
	List<MusicVO> musicPopular();
	List<MusicVO> musicCri(Criteria cri);
	List<MusicVO> mmainsearch(Criteria cri);
	MusicVO selectMusic(MusicVO vo);
	int criTotalCount();
	List<MusicVO> searchMusic(Criteria cri);
	List<MusicVO> musicThema(MusicVO vo);
	
	int musicInsert(MusicVO vo);
	int musicUpdate(MusicVO vo);
	int musicDelete(MusicVO vo);
	void musicCountUp(MusicVO vo);
	
	// myList
	List<MyListVO> selectMyMusic(MyListVO vo);
	int myList(MyListVO vo);
	int myListDelete(MyListVO vo);
	
	// playList
	List<PlayListVO> selectPlayMusic(PlayListVO vo);
	int playList(PlayListVO vo);
	int playListDelete(PlayListVO vo);
}
