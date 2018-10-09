package net.artron.cms.pgymatch.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ImageModel {

	   private MultipartFile file; 
	   private int imagetype=0;
	
}
