//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.dao;
import java.util.*;

import com.bean.Notice;
import com.bean.Sysuser;
public interface NoticeDAO {
	List<Notice> selectAll(HashMap map);
	void add(Notice notice);
	Notice findById(int id);
	void update(Notice notice);
	void delete(int id);
}
