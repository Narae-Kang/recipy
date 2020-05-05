package com.kh.junit;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

import javax.inject.Inject;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.portfolio.member.dao.MemberDAOImplJDBCTest;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class InsertJdbcTemplateTest {
	private final static Logger logger
	= LoggerFactory.getLogger(MemberDAOImplJDBCTest.class);
	
	@Inject
	JdbcTemplate jt;
	
	@Test
	@Disabled
	void insert() {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO student ( id, name, kor, eng, mat) ");
		sql.append("VALUES (?,?,?,?,?) ");

							//익명 클래스 (클래스 or 인터페이스)
		int cnt = jt.update(new PreparedStatementCreator() {	
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, "id1");
				pstmt.setString(2, "홍길동");
				pstmt.setInt(3, 100);
				pstmt.setInt(4, 80);
				pstmt.setInt(5, 95);
				return pstmt;
			}
		});
		assertEquals(1, cnt);
	}
	
	@Test
	//@Disabled
	void insert2() {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO student ( id, name, kor, eng, mat) ");
		sql.append("VALUES ('id2','송혜교', 90,85,98) ");
		
						//jt.update(sql)
		int cnt = jt.update(sql.toString());
		assertEquals(1, cnt);
	}
	
	@Test
	@Disabled
	void insert3() {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO student ( id, name, kor, eng, mat) ");
		sql.append("VALUES (?,?,?,?,?) ");

						//jt.update(sql, args)
		int cnt = jt.update(sql.toString(), "id3","원빈", 100,98,95);
		assertEquals(1, cnt);
	}
	
	@Test
	@Disabled
	void insert4() {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO student ( id, name, kor, eng, mat) ");
		sql.append("VALUES (?,?,?,?,?) ");
		

		int cnt = jt.update(sql.toString(), new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, "id4");
				ps.setString(2, "강동원");
				ps.setInt(3, 100);
				ps.setInt(4, 100);
				ps.setInt(5, 100);
			}
		});	
		assertEquals(1, cnt);		
	}

	@Test
	@Disabled
	void insert5() {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO student ( id, name, kor, eng, mat) ");
		sql.append("VALUES (?,?,?,?,?) ");
		
							//jt.update(sql, args, argTypes)
		int cnt = jt.update(
				sql.toString(), 
				new Object[] {"id5", "손담비", 95,98,100}, 
				new int[] {Types.VARCHAR, Types.VARCHAR, Types.INTEGER, Types.INTEGER, Types.INTEGER}
		);
		assertEquals(1, cnt);
	}
	
	
}
























