declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32@main(){
%1 = call i32 @getint()
%2 = alloca i32
%3 = alloca i32
%4 = alloca i32
%5 = load i32, i32* %2
%6 = icmp eq i32 %5, 0
%7= zext i1 %6 to i32
%8 = icmp ne i32 %7, 0
br i1 %8, label %9, label %10
9:
store i32 1, i32* %3
store i32 2, i32* %4
br label %17
10:
%11 = load i32, i32* %2
%12 = icmp eq i32 %11, 1
%13= zext i1 %12 to i32
%14 = icmp ne i32 %13, 0
br i1 %14, label %15, label %16
15:
store i32 1, i32* %4
store i32 2, i32* %3
br label %16
16:
br label %17
%18 = load i32, i32* %3
%19 = mul i32 %18, 10
%20 = load i32, i32* %4
%21 = add i32 %19, %20
call void @putint( i32 %21)
ret i32 0
}
