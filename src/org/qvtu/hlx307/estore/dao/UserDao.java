package org.qvtu.hlx307.estore.dao;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import org.qvtu.hlx307.estore.domain.User;
import org.qvtu.hlx307.estore.utils.DataSourceUtils;

public class UserDao {
    // 注册
    public void addUser(User user) throws SQLException {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//注意月和小时的格式为两个大写字母
        java.util.Date date = new Date();//获得当前时间
        String time = df.format(date);//将当前时间转换成特定格式的时间字符串，这样便可以插入到数据库中
        String sql = "insert into users values(null,?,?,?,?,?,?)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, user.getUsername(),user.getPassword(),user.getEmail(), "user", 1,time);
    }

    // 登录
    public User findUserByLogin(String username, String password) throws SQLException {
        if (username.contains("@")) {

            String sql = "select * from users where email=? and password=?";
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            return runner.query(sql, new BeanHandler<User>(User.class), username,password);
        }else {
            String sql = "select * from users where username=? and password=?";
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            return runner.query(sql, new BeanHandler<User>(User.class), username,password);
        }
    }
}
