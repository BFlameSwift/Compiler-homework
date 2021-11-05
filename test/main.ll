declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32@main(){
%1 = alloca i32
store i32 10, i32* %1
%2 = load i32, i32* %1
%3 = icmp eq i32 %2, 0
%4= zext i1 %3 to i32
%5 = icmp ne i32 %4, 0
br i1 %5, label %6, label %7
6:
store i32 -1, i32* %1
br label %8
7:
store i32 0, i32* %1
br label %8
%9 = load i32, i32* %1
call void @putint( i32 %9)
ret i32 0
}
