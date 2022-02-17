//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.dao;
import java.util.*;

import com.bean.News;
import com.bean.Sysuser;
public interface NewsDAO {
	List<News> selectAll(HashMap map);
	void add(News news);
	News findById(int id);
	void update(News news);
	void delete(int id);
}
