package kwonchaerin.selfdevelopment.service;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Quest;

public interface QuestService {
	List<Quest> getQuests();
	Quest getQuest(int qstId);
	Quest getQuestCategory(String clsNameTop);
	Quest getQuestDifficulty(int difficulty);
	Quest getQuestName(String qstName);
	
	boolean addQuest(Quest quest);
	boolean fixQuest(Quest quest);
	boolean delQuest(int qstId);
}
