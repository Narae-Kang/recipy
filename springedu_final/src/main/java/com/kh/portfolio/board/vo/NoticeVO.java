package com.kh.portfolio.board.vo;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Entity;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Entity
@Data
public class NoticeVO {
	private long nnum;						//BNUM      NOT NULL NUMBER(10)    

	@NotNull
	@Size(min=4, max=50, message="제목은 4~50자 까지 입력 가능합니다!")
	private String ntitle;				//BTITLE    NOT NULL VARCHAR2(150)

	private String nid;						//BID       NOT NULL VARCHAR2(40)
	//@Size(min=3, max=10, message="별칭은 3~10자 까지 입력 가능합니다!")
	private String nnickname;			//BNICKNAME NOT NULL VARCHAR2(30)
		
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp	ncdate;			//BCDATE    NOT NULL TIMESTAMP(6)  
	private Timestamp nudate;			//BUDATE             TIMESTAMP(6)  
	private int nhit;							//BHIT      NOT NULL NUMBER(5)
	@NotNull(message="내용을 입력바랍니다!!")
	@Size(min=4, message="내용은 최소 4자 이상 입력 바랍니다.!")	
	private String ncontent;			//BCONTENT  NOT NULL CLOB          
//	private int	ngroup;						//BGROUP    NOT NULL NUMBER(5)     
//	private int nstep;						//BSTEP     NOT NULL NUMBER(5)     
//	private int nindent;					//BINDENT   NOT NULL NUMBER(5)

			
}




