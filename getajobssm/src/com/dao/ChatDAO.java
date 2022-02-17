//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.dao;
import java.util.*;
import com.bean.Chat;
public interface ChatDAO {
	void add(Chat chat);
	List<Chat> selectAll(HashMap map);
	void update(Chat chat);
	void delete(int id);
}
