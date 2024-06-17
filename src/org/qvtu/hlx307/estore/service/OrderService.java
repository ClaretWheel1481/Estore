package org.qvtu.hlx307.estore.service;

import java.sql.SQLException;

import org.qvtu.hlx307.estore.dao.OrderDao;
import org.qvtu.hlx307.estore.domain.Order;
import org.qvtu.hlx307.estore.exception.addOrderException;

public class OrderService {
    public void addOrder(Order order) throws addOrderException {
        OrderDao dao=new OrderDao();
        int i = 0;
        try {
            i = dao.addOrder(order);
        } catch (SQLException e) {
            throw new addOrderException("订单提交失败");
        }
    }
}
