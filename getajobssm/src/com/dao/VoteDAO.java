//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.dao;
import java.util.*;

import com.bean.Baoming;
import com.bean.News;
import com.bean.Sysuser;
import com.bean.Vote;
public interface VoteDAO {
	List<Vote> selectOne(HashMap map);
	void add(Vote vote);
}
