package com.kh.junit;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

import javax.inject.Inject;

import org.junit.jupiter.api.BeforeEach;
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
public class UpdateJdbcTemplateTest {

	private final static Logger logger
	= LoggerFactory.getLogger(MemberDAOImplJDBCTest.class);
	
	@Inject
	JdbcTemplate jt;
	
	StringBuffer sql = null;
	@BeforeEach		//얘는 test 실행 할때마다 수행함!!
	void beforeEach() {
		sql = new StringBuffer();
	}
	
	@Test
	@Disabled
	void update1() {
		sql.append("update student set kor = ? where name = ? ");
		
		int cnt = jt.update(new PreparedStatementCreator() {	
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, 50);
				pstmt.setString(2, "원빈");
				return pstmt;
			}
		});
		assertEquals(1, cnt);
	}
	
	@Test
	@Disabled
	void update2() {
		sql.append("update student set kor = 88 where name = '손담비' ");
		
		int cnt = jt.update(sql.toString());
		assertEquals(1, cnt);
	}
	
	@Test
	@Disabled
	void update3() {
		sql.append("update student set kor = ? where name = ? ");
		
		int cnt = jt.update(sql.toString(), 90, "강동원");
		assertEquals(1, cnt);	
	}
	
	@Test
	@Disabled
	void update4() {
		sql.append("update student set eng = ? where id = ? ");
		
		int cnt = jt.update(sql.toString(), new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, 20);
				ps.setString(2, "id2");
			}
		});
		assertEquals(1, cnt);
	}
	
	@Test
	@Disabled
	void update5() {
		sql.append("update student set eng = ? where id = ? ");
		
		int cnt = jt.update(
				sql.toString(), 
				new Object[] {70, "id1"}, 
				new int[] {Types.INTEGER, Types.VARCHAR}
				);
		assertEquals(1, cnt);
	}
	
	

	
}


















