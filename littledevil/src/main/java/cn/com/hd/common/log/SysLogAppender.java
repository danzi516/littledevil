package cn.com.hd.common.log;

import java.sql.SQLException;
import java.util.Iterator;

import org.apache.log4j.jdbc.JDBCAppender;
import org.apache.log4j.spi.LoggingEvent;

/**
 * 继承JDBCAppender类
 * 
 * @author fengcaizhi
 * 
 */
public class SysLogAppender extends JDBCAppender {

	@Override
	public void flushBuffer() {
		removes.ensureCapacity(buffer.size());
		for (Iterator i = buffer.iterator(); i.hasNext();)
			try {
				LoggingEvent logEvent = (LoggingEvent) i.next();
				String sql = getLogStatement(logEvent);
				execute(sql);
				removes.add(logEvent);
			} catch (SQLException e) {
				super.errorHandler.error("Failed to excute sql", e, 2);
			}

		buffer.removeAll(removes);
		removes.clear();
	}

}
