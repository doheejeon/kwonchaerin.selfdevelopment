package kwonchaerin.selfdevelopment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kwonchaerin.selfdevelopment.dao.QuestDao;
import kwonchaerin.selfdevelopment.domain.Quest;

@Service
public class QuestServiceImpl implements QuestService{
	@Autowired private QuestDao questDao;
	
	@Override
	public List<Quest> getQuests() {
		return questDao.selectQuests();
	}
	
	@Override
	public Quest getQuest(int qstId) {
		return questDao.selectQuest(qstId);
	}
	
	@Override
	public Quest getQuestCategory(String clsNameTop) {
		return questDao.selectQuestCategory(clsNameTop);
	}
	
	@Override
	public Quest getQuestDifficulty(int difficulty) {
		return questDao.selectQuestDifficulty(difficulty);
	}
	
	@Override
	public Quest getQuestName(String qstName) {
		return questDao.selectQuestName(qstName);
	}
	
	@Override
	public boolean addQuest(Quest quest) {
		return questDao.insertQuest(quest) > 0;
	}
	
	@Override
	public boolean fixQuest(Quest quest) {
		return questDao.updateQuest(quest) > 0;
	}
	
	@Override
	public boolean delQuest(int qstId) {
		return questDao.deleteQuest(qstId) > 0;
	}
}