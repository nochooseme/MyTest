# MyTest
基于SSM框架简单实现书籍在线阅读系统
# Spring Boot 测试
1.错误提示：  
  检测不到mapper  
  解决方案:  
  Application中添加  
  @MapperScan("com.ljl.online.map.mapper")  
2.错误提示：  
  Caused by: java.lang.IllegalArgumentException: Property ‘sqlSessionFactory‘ or ‘sqlSessionTemplate‘ are required  
  解决方案：  
  pom.xml中添加  
  <pre><code>
    &lt;dependency&gt;
      &lt;groupId&gt;com.alibaba&lt;/groupId&gt;
      &lt;artifactId&gt;druid-spring-boot-starter&lt;/artifactId&gt;
      &lt;version&gt;1.1.9&lt;/version&gt;
    &lt;/dependency&gt;
  </code></pre>
