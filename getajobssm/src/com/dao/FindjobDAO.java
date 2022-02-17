//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.dao;
import java.util.*;
import com.bean.Findjob;
public interface FindjobDAO {
	List<Findjob> selectAll(HashMap map);
	void add(Findjob findjob);
	Findjob findById(int id);
	void update(Findjob findjob);
	void delete(int id);
	List<Findjob> myfindjoblist(HashMap map);
}
