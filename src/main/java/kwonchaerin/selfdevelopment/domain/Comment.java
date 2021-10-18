package kwonchaerin.selfdevelopment.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
	private int cmtId;
	private int postId;
	private int usrCode;
	private String cmtText;
}