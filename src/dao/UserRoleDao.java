package dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import model.User;
import model.UserRole;

import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

public class UserRoleDao {

    private final String QUERY_LIST_ROLES = "select * from ropr.user_role";
    private final String QUERY_USER_ROLE_BY_ID = "select * from ropr.user_role where User_role_ID=:id";
    private final String QUERY_USER_ROLE_ID_BY_NAME = "select User_role_ID from ropr.user_role where Role=:name";

    public List<UserRole> loadUserRoles() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<UserRole> userRoles = new ArrayList<UserRole>();
        //List userRoles = session.find("* from UserRoles as role");
        SQLQuery query = session.createSQLQuery(QUERY_LIST_ROLES);
        query.addEntity(UserRole.class);
        List result = query.list();
		//Iterator iter = query.iterate();
		/*while (result.iterator().hasNext()) {
         Object obj = result.iterator().next();
         Hibernate.initialize(obj);
         UserRole userRole = (UserRole)obj ;
			
         userRoles.add(userRole);
         }*/

        session.getTransaction().commit();

        return result;

    }

    public UserRole loadUserRoleById(Integer id, boolean withUsers) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<UserRole> userRoles = new ArrayList<UserRole>();
        //List userRoles = session.find("* from UserRoles as role");
        SQLQuery query = session.createSQLQuery(QUERY_USER_ROLE_BY_ID);
        query.setParameter("id", id);
        query.addEntity(UserRole.class);
        UserRole userRole = (UserRole) query.uniqueResult();
        session.getTransaction().commit();
        if (withUsers) {
            System.out.print("");
            //Hibernate.initialize(userRole);
        }
		//Iterator iter = query.iterate();
		/*while (result.iterator().hasNext()) {
         Object obj = result.iterator().next();
         Hibernate.initialize(obj);
         UserRole userRole = (UserRole)obj ;
			
         userRoles.add(userRole);
         }*/

       

        return userRole;

    }

    public Integer loadUserRoleIdByName(String name) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        //List userRoles = session.find("* from UserRoles as role");
        SQLQuery query = session.createSQLQuery(QUERY_USER_ROLE_ID_BY_NAME);
        query.setParameter("name", name);
        Number result = (Number) query.uniqueResult();

        session.getTransaction().commit();

        return (Integer) result.intValue();

    }

    public Set<User> loadUsersByRoleName(String name) {
        Integer id = loadUserRoleIdByName(name);
        UserRole userRole = loadUserRoleById(id, true);
        
        return userRole.getUsers();

    }

}
