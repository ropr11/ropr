package dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import model.User;
import model.UserRole;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

public class UserRoleDao {

	private final String QUERY_LIST_ROLES = "select * from ropr.user_role";

	public List<UserRole> loadUserRoles() {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
    
		SQLQuery query = session.createSQLQuery(QUERY_LIST_ROLES);
		List result = query.list();
       /* List<UserRole> userRoles = new ArrayList<UserRole>();
        for (Iterator iterator = result.iterator(); iterator.hasNext();) {
			UserRole item = (UserRole) iterator.next();
			userRoles.add(item);
		}*/
		session.getTransaction().commit();
		
		
		return result;
		
	}
	
}
