FROM openjdk:16-
# 向容器内复制文件

# 编译程序
WORKDIR /app/
COPY lab01 ./lab01
RUN javac -encoding UTF-8   -d ./output ./lab01/*.java

# 将当前目录设为 /app/output
WORKDIR /app/output