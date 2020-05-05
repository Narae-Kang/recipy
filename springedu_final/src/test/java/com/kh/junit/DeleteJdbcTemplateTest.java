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
public class DeleteJdbcTemplateTest {

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
	void delete1() {
		sql.append("DELETE FROM student WHERE id = ? ");
		
		int cnt = jt.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, "id2");
				return pstmt;
			}
		});
		assertEquals(1, cnt);
	}
	
	@Test
	@Disabled
	void delelte2() {
		sql.append("DELETE FROM student WHERE id = 'id2' ");
		
		int cnt = jt.update(sql.toString());
		assertEquals(1, cnt);
	}
	
	@Test
	@Disabled
	void delete3() {
		sql.append("DELETE FROM student WHERE id = ? ");
		
		int cnt = jt.update(sql.toString(), "id2");
		assertEquals(1, cnt);
	}
	
	@Test
	@Disabled
	void delete4() {
		sql.append("DELETE FROM student WHERE id = ? ");
		
		int cnt = jt.update(sql.toString(), new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, "id2");
			}
		});
		assertEquals(1, cnt);
	}
	
	@Test
	@Disabled
	void delete5() {
		sql.append("DELETE FROM student WHERE id = ? ");
		
		int cnt = jt.update(
				sql.toString(), 
				new Object[] {"id2"}, 
				new int[] {Types.VARCHAR}
				);
		assertEquals(1, cnt);			
	}
	
}






















