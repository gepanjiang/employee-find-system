//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.dao;
import java.util.*;
import com.bean.Work;
public interface WorkDAO {
	List<Work> selectAll(HashMap map);
	void add(Work work);
	Work findById(int id);
	void update(Work work);
	void delete(int id);
}
