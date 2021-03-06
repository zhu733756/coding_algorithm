## IO 多路复用问题 

## 1 定义: 
-  IO多路复用是一种同步IO模型，实现一个线程可以监视多个文件句柄；
-  一旦某个文件句柄就绪，就能够通知应用程序进行相应的读写操作；
-  没有文件句柄就绪时会阻塞应用程序，交出cpu。
-  多路是指网络连接，复用指的是同一个线程。

## 2 其他同步IO模型
-  BIO 同步阻塞IO, 单线程时阻塞, 多线程面临线程切换代价
-  NIO 同步非阻塞IO, 每次轮询所有fd, 浪费内存
-  信号驱动IO

## 3 IO多路复用模型
-  3.1 select优缺点: 
-  3.1.1 单线程中,FD的上限为1024;
-  3.1.2 将文件描述符从用户态拷贝到内核态;
-  3.1.3 对socket扫描是线性扫描, 时间复杂度o(n)
-  3.2 poll的优缺点: FD集合的操作不受限制,其它基本一样;
-  3.3 epoll的优缺点: 
-  3.3.1 内核中间加一个 ep 对象，把所有需要监听的 socket 都放到 ep 对象中, 无需fd集合拷贝
-  3.3.2 基于事件回调处理, 时间复杂度降到o(1)
-  3.3.3 支持边缘触发, 读操作发生在读内核缓存区为空到非空，写操作发生在内核写缓存区有满转化到不满的时候

## 4 应用
-  nginx/redis 所使用的IO模型epoll

-  补充：
   -  水平触发(level-trggered)
   -  只要文件描述符关联的读内核缓冲区非空，有数据可以读取，就一直发出可读信号进行通知，
   -  当文件描述符关联的内核写缓冲区不满，有空间可以写入，就一直发出可写信号进行通知
   -  边缘触发(edge-triggered)
   -  当文件描述符关联的读内核缓冲区由空转化为非空的时候，则发出可读信号进行通知，
   -  当文件描述符关联的内核写缓冲区由满转化为不满的时候，则发出可写信号进行通知



