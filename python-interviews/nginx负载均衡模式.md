- 默认轮询：把每个请求分配到不同的server, 如果分配到的server不可用, 则分配到下一个, 直到可用。
- 权重： 值越大表示访问的概率越大
- ip_hash: 如果客户访问了某个服务器，当用户再次访问时，会将该请求通过哈希算法，自动定位到该服务器。
- least_conn: 把请求分配到连接数最少的server