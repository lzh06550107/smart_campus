# 智慧校园
## 项目介绍
智慧校园是一款基于 ThinkPhp6 + Vue + ElementUI研发的前后端分离框架，随着系统框架的精细化发展，越来越多的项目采用前后端分离的架构，因此我们重点打造了一款前后端分离架构的PHP框架，为了简化开发，框架集成了完整的权限架构体系以及常规基础模块如：用户管理、角色管理、菜单管理、职级管理、岗位管理、日志管理以及广告管理、页面布局管理、字典管理、配置管理等等，前端UI支持多主题切换，可以设置自己喜欢的样式风格，同时框架集成了代码生成器可以一键生成CURD所有模块文件及代码(同时会自动生成前端UI代码)，以便开发者快速构建自己的应用。专注于为中小企业提供最佳的行业基础后台框架解决方案，提高执行效率、扩展性、稳定性值得信赖，操作体验流畅，欢迎大家使用！！
 

## 环境要求:
* PHP >= 7.1
* PDO PHP Extension
* MBstring PHP Extension
* CURL PHP Extension
* 开启静态重写
* 要求环境支持pathinfo
* 要求安装Zip扩展(插件/模块市场需要)


### 功能特性
- **严谨规范：** 提供一套有利于团队协作的结构设计、编码、数据等规范。
- **高效灵活：** 清晰的分层设计、钩子行为扩展机制，解耦设计更能灵活应对需求变更。
- **严谨安全：** 清晰的系统执行流程，严谨的异常检测和安全机制，详细的日志统计，为系统保驾护航。
- **组件化：** 完善的组件化设计，丰富的表单组件，让开发列表和表单更得心应手。无需前端开发，省时省力。
- **简单上手快：** 结构清晰、代码规范、在开发快速的同时还兼顾性能的极致追求。
- **自身特色：** 权限管理、组件丰富、第三方应用多、分层解耦化设计和先进的设计思想。
- **高级进阶：** 分布式、负载均衡、集群、Redis、分库分表。 
- **命令行：** 命令行功能，一键管理应用扩展。 


## 开发部署配置

- 修改setting.js文件中baseURL: `'http://localhost:8080/api'`
- 修改vue.config.js文件中为如下：

```javascript
devServer: {
        proxy: {
            "/api": {
                target: "http://admin.rxthinkcmftp6pro.cn", // 这里是后台api域名地址
                pathRewrite: {'^/api' : ''}, // 去除/api前缀
                changeOrigin: true, // 跨域
                cookieDomainRewrite: "admin.rxthinkcmftp6pro.cn", // 这里是后台api域名地址
                cookiePathRewrite: "/"
                // onProxyRes: function (proxyRes) {
                //     var cookies = proxyRes.headers['set-cookie'];
                //     var cookieRegex = /Path=\/XXX\//i;
                //     //修改cookie Path
                //     if (cookies) {
                //         var newCookie = cookies.map(function (cookie) {
                //             if (cookieRegex.test(cookie)) {
                //                 return cookie.replace(cookieRegex, 'Path=/');
                //             }
                //             return cookie;
                //         });
                //         //修改cookie path
                //         delete proxyRes.headers['set-cookie'];
                //         proxyRes.headers['set-cookie'] = newCookie;
                //     }
                // }
            }
        }
    }
```

