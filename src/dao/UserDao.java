package dao;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import model.User;

import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import sun.misc.BASE64Encoder;
import sun.misc.BASE64Decoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDao {

    private Random random = new SecureRandom();
    private final String QUERY_USER_BY_USERNAME = "select * from ropr.user where username=:username";
    private final String QUERY_USER_BY_NAME_AND_SURNAME = "select * from ropr.user where surname=:surname and name=:name";
    private final String QUERY_USER_BY_USERID = "select * from ropr.user where ID_User=:userid";
    private final String QUERY_LIST_USERS = "select * from ropr.user";

    public User loadUserByUsername(String username) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        SQLQuery query = session.createSQLQuery(QUERY_USER_BY_USERNAME);
        query.addEntity(User.class);
        query.setParameter("username", username);
        List<User> result = query.list();

        session.getTransaction().commit();

        if (result.size() > 0) {
            User user = result.get(0);
            Hibernate.initialize(user);
            return user;
        } else {
            return null;
        }

    }

    public User loadUserByNameAndSurname(String name, String surname) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        SQLQuery query = session.createSQLQuery(QUERY_USER_BY_NAME_AND_SURNAME);
        query.addEntity(User.class);
        query.setParameter("name", name);
        query.setParameter("surname", surname);
        List<User> result = query.list();

        session.getTransaction().commit();

        if (result.size() > 0) {
            User user = result.get(0);
            Hibernate.initialize(user);
            return user;
        } else {
            return null;
        }

    }

    public User loadUserByUserId(Integer userid) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        SQLQuery query = session.createSQLQuery(QUERY_USER_BY_USERID);
        query.addEntity(User.class);
        query.setParameter("userid", userid);
        List<User> result = query.list();
        session.getTransaction().commit();

        if (result.size() > 0) {
            User user = result.get(0);

            return user;
        } else {
            return null;
        }

    }

    public Serializable createNewUser(User user) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        String passwordHash = makePasswordHash(user.getPassword(), Integer.toString(random.nextInt()));
        user.setPassword(passwordHash);
        Transaction transaction = session.beginTransaction();
        Serializable id = session.save(user);
        transaction.commit();
        return id;
    }

    public void deleteUser(User user) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.delete(user);
        transaction.commit();
    }

    public List<User> listUsers() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        SQLQuery query = session.createSQLQuery(QUERY_LIST_USERS);
        query.addEntity(User.class);
        List<User> result = query.list();
        session.getTransaction().commit();
        return result;
    }

    public void updateUserPassword(User user, String password) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        SQLQuery query = session.createSQLQuery(QUERY_USER_BY_USERNAME);
        query.addEntity(User.class);
        query.setParameter("username", user.getUsername());
        List<User> result = query.list();
        User userFromDb = result.get(0);
        userFromDb.setPassword(makePasswordHash(password, Integer.toString(random.nextInt())));
        //save changes
        transaction.commit();
    }

    public String makePasswordHash(String password, String salt) {
        try {
            String saltedAndHashed = password + "," + salt;
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(saltedAndHashed.getBytes());
            BASE64Encoder encoder = new BASE64Encoder();
            byte hashedBytes[] = (new String(digest.digest(), "UTF-8")).getBytes();
          String result = encoder.encode(hashedBytes) + "," + salt;
          System.out.print(result);
          return result;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("MD5 is not available", e);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("UTF-8 unavailable?  Not a chance", e);
        }} 
        
       

    public String decodePassword(String password){
        BASE64Decoder decoder = new BASE64Decoder();

        byte[] decodedBytes;
        try {
            decodedBytes = decoder.decodeBuffer(password);
            
            String result =  decodedBytes.toString();
          System.out.print(result);
          return result;
        } catch (IOException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
      }
}

