package cn.nsu.edu.estore.service;

import java.sql.SQLException;

import javax.security.auth.login.LoginException;

import cn.nsu.edu.estore.dao.UserDao;
import cn.nsu.edu.estore.domain.User;
import cn.nsu.edu.estore.exception.RegistException;

public class UserService {
    /* 1.注册操作		START*/
    public void regist(User user) throws RegistException {
        UserDao dao = new UserDao();
        try {
            dao.addUser(user);
        } catch (SQLException e) {
            throw new RegistException("注册失败",e);
        }
    }
    public User login(String username, String password) throws LoginException {
        // 需要注意用户是否激活
        UserDao dao = new UserDao();
        try {
            User user = dao.findUserByLogin(username, password);
            if (user != null) {
                // 判断用户是否激活
                if (user.getState() == 1) {
                    return user;
                }
            } else {
                throw new LoginException("用户名或密码错误");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LoginException("用户名或密码错误");
        }
        return null;
    }
}


