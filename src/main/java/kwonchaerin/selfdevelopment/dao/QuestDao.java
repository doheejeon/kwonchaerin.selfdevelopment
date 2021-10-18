package kwonchaerin.selfdevelopment.dao;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Quest;

public interface QuestDao {
	List<Quest> selectQuests();
	Quest selectQuest(int qstId);
	Quest selectQuestCategory(String clsNameTop);
	Quest selectQuestDifficulty(int difficulty);
	Quest selectQuestName(String qstName);
	
	int insertQuest(Quest quest);
	int updateQuest(Quest quest);
	int deleteQuest(int qstId);
}
