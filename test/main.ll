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
%4 = icmp eq i32 %3, 5
%5 = zext i1 %4 to i32
%6= zext i1 %4 to i32
%7 = icmp ne i32 %6, 0
br i1 %7, label %8, label %19
8:
%9 = load i32, i32* %2
%10 = icmp eq i32 %9, 10
%11 = zext i1 %10 to i32
%12= zext i1 %10 to i32
%13 = icmp ne i32 %12, 0
br i1 %13, label %14, label %15
14:
store i32 25, i32* %1
br label %18
15:
%16 = load i32, i32* %1
%17 = add i32 %16, 15
store i32 %17, i32* %1
br label %18
br label %19
19:
%20 = load i32, i32* %1
call void @putint( i32 %20)
ret i32 0
}
