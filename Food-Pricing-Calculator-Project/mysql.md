---
sidebar_position: 3
---

# 02-MySQL 

Developer has chosen the database MySQL. Hence, we are trying to install it up and configure it.

:::tip Hint
**Versions of the DB Software you will get context from the developer, Meaning we need to check with developer.**
:::

Install MySQL Server 8.0.x

```shell 
apt-get install mysql-server -y
```

Start MySQL Service 

```shell 
systemctl enable mysql
systemctl start mysql  
```

Next, We need to change the default root password in order to start using the database service. Use password **`ExpenseApp@1`** or any other as per your choice. 

```shell
mysql_secure_installation --set-root-pass ExpenseApp@1
```

Go Inside Mysql
```mysql
FLUSH PRIVILEGES;
ALTER USER 'root'@'%' IDENTIFIED WITH caching_sha2_password BY 'ExpenseApp@1';
exit;
```

Make changes to the DB config to support connections and restart it

:::info
Hint! You can edit file by using **`vim /etc/mysql/mysql.conf.d/mysqld.cnf`**

bind-address = 0.0.0.0

systemctl restart mysql
:::

Provide "expense" user access to DB
Go Inside Mysql
```mysql
mysql -u root -p
CREATE USER 'expense'@'%' IDENTIFIED BY 'ExpenseApp@1';
GRANT ALL PRIVILEGES ON transactions.* TO 'expense'@'%';
FLUSH PRIVILEGES;

```

If having root user access issue:
Provide "root" user access to DB
Go Inside Mysql
```mysql
mysql -u root -p

CREATE USER 'root'@'%' IDENTIFIED BY 'ExpenseApp@1';

or

ALTER USER 'root'@'%' IDENTIFIED BY 'ExpenseApp@1';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;

```

