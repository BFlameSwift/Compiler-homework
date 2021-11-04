FROM openjdk:16
# 向容器内复制文件

# 编译程序
WORKDIR /app/
COPY src ./
RUN javac -encoding UTF-8   -d ./output ./src/Main.java

# 将当前目录设为 /app/output
WORKDIR /app/output/