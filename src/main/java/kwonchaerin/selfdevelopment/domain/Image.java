package kwonchaerin.selfdevelopment.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Image {
	private int imageId;
	private String fileName;
	private String linkUrl;
	private String usingPage;
}