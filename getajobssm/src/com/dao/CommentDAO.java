//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.dao;
import java.util.*;

import com.bean.Baoming;
import com.bean.Comment;
import com.bean.News;
import com.bean.Sysuser;
public interface CommentDAO {
	List<Comment> selectOne(HashMap map);
	void add(Comment comment);
	List<Comment> selectComment(int workid);
	List<Comment> selectAll(HashMap map);
	void delete(int id);
	
}
