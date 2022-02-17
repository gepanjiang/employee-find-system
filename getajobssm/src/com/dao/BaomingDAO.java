//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.dao;
import java.util.*;

import com.bean.Baoming;
import com.bean.News;
import com.bean.Sysuser;
public interface BaomingDAO {
	List<Baoming> selectAll(HashMap map);
	void add(Baoming baoming);
	List<Baoming> selectOne(HashMap map);
	void delete(int id);
}
