package kwonchaerin.selfdevelopment.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kwonchaerin.selfdevelopment.domain.Quest;
import kwonchaerin.selfdevelopment.service.QuestService;

@RestController
@RequestMapping
public class QusetController {
	@Autowired private QuestService questService;
	
	@GetMapping("/quest/{qstId}")
	public ModelAndView getQuest(ModelAndView mv, @RequestBody int qstId) {
		Quest qst = questService.getQuest(qstId);
		if(qst != null) mv.setViewName("quest/getQuest");
		else mv.setViewName("/quest");
		
		return mv;
	}
	
	@GetMapping("/quest/report/{qstId}")
	public ModelAndView quest03(ModelAndView mv, @RequestBody int qstId) {
		Quest qst = questService.getQuest(qstId);
		if(qst != null) mv.setViewName("quest/doQuest");
		else mv.setViewName("/quest/" + qstId);
		
		return mv;
	}
	
	/* 퀘스트 목록 조회 */
	@GetMapping("/quest/list")
	public List<Quest> getQuests() {
		return questService.getQuests();
	}
	
	/* 퀘스트 추가 */
	@PostMapping("/quest/add")
	public boolean addQuest(@RequestBody Quest quest) {
		return questService.addQuest(quest);
	}
	
	/* 퀘스트 수정 */
	@PutMapping("/quest/fix")
	public boolean fixQuest(@RequestBody Quest quest) {
		return questService.fixQuest(quest);
	}
	
	/* 퀘스트 관리자 삭제 */
	@DeleteMapping("/quest/del/{qstId}")
	public boolean delQuest(@RequestBody int qstId) {
		return questService.delQuest(qstId);
	}
}