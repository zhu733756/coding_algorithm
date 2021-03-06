## 垃圾回收
- Python GC主要使用引用计数（reference counting）来跟踪和回收垃圾。
- 在引用计数的基础上, 通过“标记-清除”（mark and sweep）解决容器对象可能产生的循环引用问题
- 通过“分代回收”（generation collection）以空间换时间的方法提高垃圾回收效率。

## is 和 == 的区别
```
>>> a,b ="1","2"
>>> a is b
False
>>> a == b
False
>>> a = "12"     
>>> b = "13" 
>>> a+b
'1213'
>>> c = "1213" 
>>> a+b is c
False
>>> a+b == c  
True
>>> d = 1
>>> e = 3
>>> d+e is 4
True
>>> d+e == 4
True
```
## 小整数对象池
- 在python中整数范围[-5,256]会创建一个小整数对象池的东西
- python为了优化速度，会把[-5,256]之间的数据提前存放在小整数对象池中
- 程序中只要用的[-5，256]之间的数据不会再重新创建一份，都是指向对象池中的同一份数据，
- 除了这个区间之外的数据，每次使用时系统都会重新申请一块内存，用来存储数据
## 字符串驻留机制
- python中的字符串驻留机制：字符串驻留是指相同字符串仅保存一份的做法

 