#encoding:utf-8
import MySQLdb
import datetime
import time
from time import strftime
import numpy as np
import matplotlib.pyplot as plt
#-*- coding: utf-8 -*-

#打开数据库连接
db = MySQLdb.connect("localhost", "root", "root", "reporting", charset='utf8' )
# 使用cursor()方法获取操作游标 
cursor = db.cursor()
while 1:
   print("1.Enter ID and Date query ")#通过学号和日期查询
   print("2.Enter Date query")#通过日期查询
   print("3.Query thin month's infomation")#查询本月所有数据并统计患病与未患病数量用柱状图表示
   print("4.Query infomation in the past 7 days")#查过去7天数据，同上
   print("5.Query last week's infomation")#查上周数据
   print("6.quit")
   a=input("Enter your choise\n")
   if a==1:
      n=input("Enter ID\n")
      p=raw_input("Enter Date like 2020-02-28\n")
      sql = "select risk.risk,risk.date,info.id,info.name,info.address \
         from risk,info \
         where  info.id = risk.id and info.id='%d'and risk.date='%s'"%(n,p)
      # 执行SQL语句
      cursor.execute(sql)
      # 获取所有记录列表
      results1 = cursor.fetchall()
      sql = "select count(*) \
         from risk,info \
         where  info.id = risk.id and info.id='%d'and risk.date='%s'"%(n,p)
      # 执行SQL语句
      cursor.execute(sql)
      # 获取所有记录列表
      results2 = cursor.fetchall()
      b=int(np.array(results2))
      if b==0:
         print("No infomation for this day\n")
      elif b>0:
         print ("risk date id name address")
         #每一项都输出
         for it in results1:
            for i in range(len(it)):
               print it[i],
            print ('\n')   
   elif a==2:
      p= raw_input("Enter Date like 2020-02-28\n")
      #date_p=date.date.strptime(p,'%Y-%m-%d').date()
      sql="select risk.risk,risk.date,info.id,info.name,info.address \
         from risk,info \
         where date='%s' and risk.id=info.id"%(p)
      # 执行SQL语句
      cursor.execute(sql)
      # 获取所有记录列表
      results = cursor.fetchall()
      print ("risk date id name address")
      #每一项都输出
      for it in results:
         for i in range(len(it)):
            print it[i],
         print ('\n')        
   elif a==4:
      sql="select count(*)  \
         from risk,info \
         where DATE_SUB(CURDATE(), INTERVAL 7 DAY) <='2020-03-08' \
         and risk.risk='yes' \
         and risk.id=info.id "
      cursor.execute(sql)
      # 获取所有记录列表
      results1 = cursor.fetchall()
      sql="select count(*)  \
         from risk,info \
         where DATE_SUB(CURDATE(), INTERVAL 7 DAY) <='2020-03-08' \
         and risk.risk='no' \
         and risk.id=info.id "
      cursor.execute(sql)
      # 获取所有记录列表
      results2 = cursor.fetchall()
      sql="select risk.risk,risk.date,info.id,info.name,info.address  \
         from risk,info \
         where DATE_SUB(CURDATE(), INTERVAL 7 DAY) <='2020-03-08' \
         and risk.id=info.id "
      cursor.execute(sql)
      # 获取所有记录列表
      results3 = cursor.fetchall()
      print ("risk date id name address")
      #每一项都输出
      for it in results3:
         for i in range(len(it)):
             print it[i],
         print ('\n')
      print("The count :")
      print ("yes  no")
      #将从mysql中读出的元祖类型元素转换成int型数
      a=int(np.array(results1))
      b=int(np.array(results2))
      print a,b
      print'\n'
      #绘制柱状图
      name_list = ['have risk','not risk']  
      num_list = [a,b]  
      plt.bar(range(len(num_list)), num_list,color='rgb',tick_label=name_list)  
      plt.show()   
                 
   elif a==3:
      sql="select count(*)  \
         from risk,info \
         where DATE_FORMAT(date,'%Y-%m')=DATE_FORMAT(NOW(),'%Y-%m') \
         and risk.risk='yes' \
         and risk.id=info.id "
      cursor.execute(sql)
      # 获取所有记录列表
      results1 = cursor.fetchall()
      sql="select count(*)  \
         from risk,info \
         where DATE_FORMAT(date,'%Y-%m')=DATE_FORMAT(NOW(),'%Y-%m') \
         and risk.risk='no' \
         and risk.id=info.id "
      cursor.execute(sql)
      # 获取所有记录列表
      results2 = cursor.fetchall()
      sql="select risk.risk,risk.date,info.id,info.name,info.address  \
         from risk,info \
         where DATE_FORMAT(date,'%Y-%m')=DATE_FORMAT(NOW(),'%Y-%m') \
         and risk.id=info.id "
      cursor.execute(sql)
      # 获取所有记录列表
      results3 = cursor.fetchall()
      print ("risk date id name address")
      #每一项都输出
      for it in results3:
         for i in range(len(it)):
             print it[i],
         print('\n')
      print("The count:")
      print ("yes  no")
      #将从mysql中读出的元祖类型元素转换成int型数
      a=int(np.array(results1))
      b=int(np.array(results2))
      print a,b
      print'\n'
      #绘制柱状图
      name_list = ['have risk','not risk']  
      num_list = [a,b]  
      plt.bar(range(len(num_list)), num_list,color='rgb',tick_label=name_list)  
      plt.show() 
   elif a==5:
      sql="select count(*)  \
         from risk,info \
         where YEARWEEK(DATE_FORMAT(date,'%Y-%m-%d')) = YEARWEEK(NOW())-1 \
         and risk.id=info.id \
         and risk.risk='yes'"
      cursor.execute(sql)
      # 获取所有记录列表
      results1= cursor.fetchall()
      sql="select count(*)  \
         from risk,info \
         where YEARWEEK(DATE_FORMAT(date,'%Y-%m-%d')) = YEARWEEK(NOW())-1 \
         and risk.id=info.id \
         and risk.risk='no'"
      cursor.execute(sql)
      # 获取所有记录列表
      results2 = cursor.fetchall()
      sql="select risk.risk,risk.date,info.id,info.name,info.address  \
         from risk,info \
         where YEARWEEK(DATE_FORMAT(date,'%Y-%m-%d')) = YEARWEEK(NOW())-1 \
         and risk.id=info.id "
      cursor.execute(sql)
      # 获取所有记录列表
      results3 = cursor.fetchall()
      print ("risk date id name address")
      #每一项都输出
      for it in results3:
          for i in range(len(it)):
              print it[i],
          print ('\n')
      print("The count:")
      print ("yes  no")
      #将从mysql中读出的元祖类型元素转换成int型数
      a=int(np.array(results1))
      b=int(np.array(results2))
      print a,b
      print'\n'
      #绘制柱状图
      name_list = ['have risk','not risk']  
      num_list = [a,b]  
      plt.bar(range(len(num_list)), num_list,color='rgb',tick_label=name_list)  
      plt.show() 
   elif a==6:
      exit(0)
   
# 关闭数据库连接
db.close()
   
