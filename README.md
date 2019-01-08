# MyTest
基于SSM框架简单实现书籍在线阅读系统
# Spring Boot 测试
## 1.配置数据库后
  Application中添加  
  @SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
## 2.检测不到mapper  
  Application中添加  
  @MapperScan("com.ljl.online.map.mapper")  
## 3.Caused by: java.lang.IllegalArgumentException: Property ‘sqlSessionFactory‘ or ‘sqlSessionTemplate‘ are required    
  pom.xml中添加  
  <pre><code>
    &lt;dependency&gt;
      &lt;groupId&gt;com.alibaba&lt;/groupId&gt;
      &lt;artifactId&gt;druid-spring-boot-starter&lt;/artifactId&gt;
      &lt;version&gt;1.1.9&lt;/version&gt;
    &lt;/dependency&gt;
  </code></pre>
## 4.com.alibaba.druid.filter.stat:name=statFilter,type=StatFilter
spring.datasource.druid.filter.stat.enabled=false
