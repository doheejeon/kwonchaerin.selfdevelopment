package kwonchaerin.selfdevelopment.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kwonchaerin.selfdevelopment.dao.map.QuestMap;
import kwonchaerin.selfdevelopment.domain.Quest;

@Repository
public class QuestDaoImpl implements QuestDao {
	@Autowired private QuestMap questMap;
	
	@Override
	public List<Quest> selectQuests() {
		return questMap.selectQuests();
	}
	
	@Override
	public Quest selectQuest(int qstId) {
		return questMap.selectQuest(qstId);
	}
	
	@Override
	public Quest selectQuestCategory(String clsNameTop) {
		return questMap.selectQuestCategory(clsNameTop);
	}
	
	@Override 
	public Quest selectQuestDifficulty(int difficulty) {
		return questMap.selectQuestDifficulty(difficulty);
	}
	@Override
	public Quest selectQuestName(String qstName) {
		return questMap.selectQuestName(qstName);
	}
	
	@Override
	public int insertQuest(Quest quest) {
		return questMap.insertQuest(quest);
	}
	
	@Override
	public int updateQuest(Quest quest) {
		return questMap.updateQuest(quest);
	}
	
	@Override
	public int deleteQuest(int qstId) {
		return questMap.deleteQuest(qstId);
	}
	
}
