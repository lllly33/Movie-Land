# Movie-Land

> ### 后台

## 目录

    |-- .gitignore  #git中忽略的文件
    |-- index.html  #根文件
    |-- package.json  #项目描述文件
    |-- README.md  #项目介绍文件
    |-- build  #webpack开发和打包的配置文件
    |-- config  #vue-cli的配置文件
    |-- src  #资源文件夹
    |   |-- App.vue  #页面入口文件
    |   |-- main.js  #程序入口文件
    |   |-- api  #请求接口文件
    |   |   |-- ajax.js  #基于axios封装ajax文件
    |   |   |-- index.js  #调用接口文件
    |   |-- common  #公共资源文件
    |   |   |-- css
    |   |       |-- style.css  #字体图标样式文件
    |   |       |-- fonts  #字体图标文件
    |   |-- components  #组件文件
    |   |-- pages  #页面文件
    |   |   |-- Home  #主页
    |   |   |   |-- Home.vue
    |   |   |   |-- children
    |   |   |       |-- CinemaManage.vue  #影院管理页
    |   |   |       |-- CommentManage.vue  #评论管理页
    |   |   |       |-- HallManage.vue  #影厅管理页
    |   |   |       |-- MovieManage.vue  #电影管理页
    |   |   |       |-- MovieSchedule.vue  #电影排片页
    |   |   |       |-- OrderManage.vue  #订单管理页
    |   |   |       |-- UserManage.vue  #用户管理页
    |   |   |-- Login  #登录页
    |   |       |-- Login.vue
    |   |-- router  #路由
    |       |-- index.js  #路由配置
    |-- static  #静态文件
        |-- css
            |-- reset.css  #兼容性样式
