declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32@main(){
%1 = alloca i32
store i32 5, i32* %1
%2 = alloca i32
store i32 10, i32* %2
%3 = load i32, i32* %1
%4 = icmp eq i32 %3, 6
%5 = load i32, i32* %2
%6 = icmp eq i32 %5, 11
%7= zext i1 %4 to i32
%8= zext i1 %6 to i32
%9 = or i32 %7, %8
%10 = icmp ne i32 %9, 0
br i1 %10, label %11, label %13
11:
%12 = load i32, i32* %1
ret i32 %12
13:
%14 = load i32, i32* %2
%15 = icmp eq i32 %14, 10
%16 = load i32, i32* %1
%17 = icmp eq i32 %16, 1
%18= zext i1 %15 to i32
%19= zext i1 %17 to i32
%20 = and i32 %18, %19
%21 = icmp ne i32 %20, 0
br i1 %21, label %22, label %23
22:
store i32 25, i32* %1
br label %39
23:
%24 = load i32, i32* %2
%25 = icmp eq i32 %24, 10
%26 = load i32, i32* %1
%27 = icmp eq i32 %26, -5
%28= zext i1 %25 to i32
%29= zext i1 %27 to i32
%30 = and i32 %28, %29
%31 = icmp ne i32 %30, 0
br i1 %31, label %32, label %35
32:
%33 = load i32, i32* %1
%34 = add i32 %33, 15
store i32 %34, i32* %1
br label %38
35:
%36 = load i32, i32* %1
%37 = mul i32 %36, -1
store i32 %37, i32* %1
br label %38
38:
br label %39
39:
br label %40
40:
%41 = load i32, i32* %1
call void @putint( i32 %41)
ret i32 0
}
