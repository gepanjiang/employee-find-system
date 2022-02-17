//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.dao;
import java.util.*;
import com.bean.Sysuser;
public interface SysuserDAO {
   Sysuser findById(int id);
   void update(Sysuser sysuser);
   void updatepwd(int id,String sysuserpassword);
   List<Sysuser> selectOne(HashMap map);
   List<Sysuser> checkUsername(String username);
   List<Sysuser> selectAll(HashMap map);
   void add(Sysuser sysuser);
   void delete(int id);
}
