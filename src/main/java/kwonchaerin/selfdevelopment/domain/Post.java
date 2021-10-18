package kwonchaerin.selfdevelopment.domain;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Post {
	private int postId;
	private int usrCode;
	private String pstHead;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private LocalDate pstWriteDate;
	
	private String pstTitle;
	private String pstContent;
}