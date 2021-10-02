FROM openjdk:16-alpine
# 向容器内复制文件
COPY ./*  /app/
# 编译程序
WORKDIR /app/
RUN javac -d ./output ./src/Main.java
# 将当前目录设为 /app/output
WORKDIR /app/output