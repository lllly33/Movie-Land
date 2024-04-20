# 毕业设计

## 启动项目

### 前期准备

```bash
cd film
npm install
cd ../film_admin
npm install
cd ../film_api
npm install
```

**用 `run.bat`来打开前端，后端，接口**

> run.bat

```batch
@REM 用来批处理前端，后端，接口的打开
cd film
start npm start
cd ..
cd film_admin
start npm start
cd ..
cd film_api
start nodemon app.js
```
