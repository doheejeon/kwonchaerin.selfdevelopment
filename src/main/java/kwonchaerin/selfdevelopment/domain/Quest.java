package kwonchaerin.selfdevelopment.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Quest {
	private int qstId;
	private int clsId;
	private String qstName;
	private int difficulty;
	private String qstContent;
	private String clsNameTop;
	
}