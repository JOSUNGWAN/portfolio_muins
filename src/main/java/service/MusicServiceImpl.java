package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criteria.Criteria;
import mapperInterface.MusicMapper;
import vo.MusicVO;
import vo.MyListVO;
import vo.PlayListVO;

@Service
public class MusicServiceImpl implements MusicService {

	@Autowired
	MusicMapper mapper;
	
	@Override
	public List<MusicVO> musicTotal() { return mapper.musicTotal(); }

	@Override
	public List<MusicVO> musicPopular() { return mapper.musicPopular(); }

	@Override
	public List<MusicVO> musicCri(Criteria cri) { return mapper.musicCri(cri); }
	
	@Override
	public List<MusicVO> mmainsearch(Criteria cri) { return mapper.mmainsearch(cri); }

	@Override
	public MusicVO selectMusic(MusicVO vo) { return mapper.selectMusic(vo); }

	@Override
	public int criTotalCount() { return mapper.criTotalCount(); }

	@Override
	public List<MusicVO> searchMusic(Criteria cri) { return mapper.searchMusic(cri); }
	
	@Override
	public List<MusicVO> musicThema(MusicVO vo) { return mapper.musicThema(vo); }

	@Override
	public int musicInsert(MusicVO vo) { return mapper.musicInsert(vo); }

	@Override
	public int musicUpdate(MusicVO vo) { return mapper.musicUpdate(vo); }

	@Override
	public int musicDelete(MusicVO vo) { return mapper.musicDelete(vo); }
	
	@Override
	public void musicCountUp(MusicVO vo) { mapper.musicCountUp(vo); }
	
	// myList ============================================
	@Override
	public List<MyListVO> selectMyMusic(MyListVO vo) { return mapper.selectMyMusic(vo); }
	
	@Override
	public int myList(MyListVO vo) { return mapper.myList(vo); }
	
	@Override
	public int myListDelete(MyListVO vo) { return mapper.myListDelete(vo); }
	
	// playList ============================================
	@Override
	public List<PlayListVO> selectPlayMusic(PlayListVO vo) { return mapper.selectPlayMusic(vo); }
	
	@Override
	public int playList(PlayListVO vo) { return mapper.playList(vo); }
	
	@Override
	public int playListDelete(PlayListVO vo) { return mapper.playListDelete(vo); }
	
} // MusicServiceImpl
