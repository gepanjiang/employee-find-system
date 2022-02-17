//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.dao;
import java.util.*;
import com.bean.Findjob;
import com.bean.Jianli;
public interface JianliDAO {
	List<Jianli> selectAll(HashMap map);
	void add(Jianli jianli);
	Jianli findById(int id);
	void update(Jianli jianli);
	List<Jianli> selectOne(int memberid);
}
