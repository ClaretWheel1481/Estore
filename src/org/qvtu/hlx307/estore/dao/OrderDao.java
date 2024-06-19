package org.qvtu.hlx307.estore.dao;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.dbutils.QueryRunner;

import org.qvtu.hlx307.estore.domain.Order;
import org.qvtu.hlx307.estore.utils.DataSourceUtils;

public class OrderDao {
    //添加订单操作
    public int addOrder(Order order) throws SQLException {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//注意月和小时的格式为两个大写字母
        java.util.Date date = new Date();//获得当前时间
        String time = df.format(date);//将当前时间转换成特定格式的时间字符串，这样便可以插入到数据库中
        String sql="insert into orders values(null,?,?,?,?,?)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.update(sql,order.getMoney(),order.getReceiverinfo(),1,time,order.getUser_id());
    }
}
