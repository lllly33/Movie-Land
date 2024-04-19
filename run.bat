@REM 用来批处理前端，后端，接口的打开
cd film
start npm start
cd ..
cd film_admin
start npm start
cd ..
cd film_api
start nodemon app.js
