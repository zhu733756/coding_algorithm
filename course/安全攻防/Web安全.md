## XSS注入(检测工具：beef)
-  什么是XSS:通过给定异常的输入，黑客可以在你的路蓝旗中插入恶意js脚本，进而窃取隐私信息或者仿冒操作。
-  反射性XSS：诱导点击链接，嵌入黑客定义的js脚本，进而窃夺用户隐私; 
-  基于DOM的XSS：利用跨域接口window.location将用户信息推送出去。
-  持久性XSS：将恶意的js脚本写入正常的服务器数据库。
-  常用XSS注入点： html元素内容、属性内容; url请求参数; css值; js
-  安全防护：验证输入输出; 编码; 检测过滤（白名单过滤）; CSP（W3C提出的CSP内容安全策略）

## SQL注入:检测工具：sqlmap
-  定义:在应用拼接sql语句的时候篡改正常的sql语句;比如修改where语句
-  sql能做什么？ 绕过验证; 任意篡改数据; 窃取数据; 消耗资源(强行占满CPU); 
-  防护？ 一个宗旨:一切用户输入皆不可信, 方法:preparedStatement; 存储过程(临时将分隔符替换); 验证输入 

## CSRF攻击(跨站请求伪造) && SSRF(服务端请求伪造、内网穿透)
-  CSRF防护: csrf_token
-  SSRF防护: 白名单限制、协议限制、请求端限制

## 信息泄露
-  间接泄露: 代码注释泄露（利用白盒测试扫描）、错误信息（正确地配置文件、黑盒测试）、返回信息（返回统一的模糊化信息）
-  直接泄露: 版本管理工具中的隐藏文件, 版本管理工具中的隐藏文件: 人工审查; 私自上传代码到github上, 加强员工安全意识的培训, 强化公司管理制度

## 插件泄露
-  危害：破坏服务器和应用程序
-  防护：整理插件,剔除无用插件；管理插件补丁更新；使用公开漏洞库（可以使用插件漏洞监测工具）