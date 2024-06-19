package org.qvtu.hlx307.estore.dao;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.qvtu.hlx307.estore.domain.Order;
import org.qvtu.hlx307.estore.utils.DataSourceUtils;

public class OrderDao {
    //添加订单操作
    public int addOrder(Order order) throws SQLException {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//注意月和小时的格式为两个大写字母
        java.util.Date date = new Date();//获得当前时间
        String time = df.format(date);
        String sql="insert into orders values(null,?,?,?,?,?)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.update(sql,order.getMoney(),order.getReceiverinfo(),1,time,order.getUser_id());
    }

    //查询订单操作
    public List<Order> findByUserId(String id) {
        String sql = "select * from orders where user_id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        try {
            return runner.query(sql,new BeanListHandler<Order>(Order.class),id);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    //删除订单操作
    public boolean deleteOrder(String id) {
        String sql = "delete from orders where id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        try {
            runner.update(sql,id);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
