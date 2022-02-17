//-------------------------2755--------------------------
//-----------------作者Q: 1305637939-------------------
package com.dao;
import java.util.*;

import com.bean.Member;
public interface MemberDAO {
   Member findById(int id);
   void update(Member member);
   void updatepwd(int id,String memberpassword);
   List<Member> selectOne(HashMap map);
   List<Member> checkUname(String uname);
   List<Member> selectAll(HashMap map);
   void add(Member member);
   void delete(int id);
   List<Member> searchQzz(HashMap map);
}
