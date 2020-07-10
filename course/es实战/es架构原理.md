## 索引过程中的名称
- 内存buffer
- translog
  - 写入ES的数据首先会被写入translog文件，该文件持久化到磁盘，保证服务器宕机的时候数据不会丢失，由于顺序写磁盘，速度也会很快。
    - 同步写入
    - 异步写入
- refresh
  - 经过固定的时间，或者手动触发之后，将内存中的数据构建索引生成segment，写入文件系统缓冲区
- flush、commit
  - 超过固定的时间，或者translog文件过大之后，触发flush操作
     - 内存buffer清空，相当于一次fresh
     - 所有segment归并写入磁盘
     - 提交commit point
     - 启动或重新打开一个索引的过程中使用这个提交点来判断哪些segment隶属于当前分片
     - 删除旧的translog 写入新的translog
- segment（段）
- merge
  - 磁盘上两个小segment：A和B，内存中又生成了一个小segment：C
  - A,B被读取到内存中，与内存中的C进行merge，生成了新的更大的segment：D
  - 触发commit操作，D被fsync到磁盘
  - 创建新的提交点，删除A和B，新增D
  - 删除磁盘中的A和B

## 索引过程
- 新的文档添加到内存缓冲区【内存buffer】并其二被追加到事务日志【translog】
- refresh完成后，缓存被清空但是tranlog不会刷新
- 事务日志不断累积文档
- flush触发后，segment被全量提交, 并且translog被清空
- segment合并，生成新的commit点，老的segment被删除

## 集群工作原理
- 探测失效节点，维持有效节点集合

## master选举
-  选举策略
    - 如果集群中存在master，认可该master，加入集群
    - 如果集群中不存在master，从具有master资格的节点中选id最小的节点作为master

- 选举时机
    - 集群启动：后台启动线程去ping集群中的节点，按照上述策略从具有master资格的节点中选举出master
- 现有的master离开集群：
    - 后台一直有一个线程定时ping master节点，超过一定次数没有ping成功之后，重新进行master的选举

## 避免脑裂

- 脑裂问题是采用master-slave模式的分布式集群普遍需要关注的问题，脑裂一旦出现，会导致集群的状态出现不一致，导致数据错误甚至丢失。
- ES避免脑裂的策略：过半原则，可以在ES的集群配置中添加一下配置，避免脑裂的发生

