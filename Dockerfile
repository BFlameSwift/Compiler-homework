FROM openjdk:16-alpine
# 向容器内复制文件
COPY ./lab01 /app/lab01
# 编译程序
WORKDIR /app/
RUN javac -encoding UTF-8 -d ./output ./lab01/*.java

# 将当前目录设为 /app/output
WORKDIR /app/output