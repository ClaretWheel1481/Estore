package org.qvtu.hlx307.estore.service;

import java.sql.SQLException;
import java.util.List;

import org.qvtu.hlx307.estore.dao.OrderDao;
import org.qvtu.hlx307.estore.domain.Order;
import org.qvtu.hlx307.estore.exception.addOrderException;

public class OrderService {
    public void addOrder(Order order) throws addOrderException {
        OrderDao dao = new OrderDao();
        int i = 0;
        try {
            i = dao.addOrder(order);
        } catch (SQLException e) {
            throw new addOrderException("订单提交失败");
        }
    }

    //根据传值获取订单信息
    public List<Order> findByUserId(String id) throws SQLException{
        OrderDao dao = new OrderDao();
        return dao.findByUserId(id);
    }

    //根据值删除订单信息
    public void deleteOrder(String id) throws SQLException{
        OrderDao dao = new OrderDao();
        dao.deleteOrder(id);
    }
}
