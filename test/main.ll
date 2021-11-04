declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32@main(){
%1 = alloca i32
%2 = alloca i32
store i32 56, i32* %1
store i32 4, i32* %2
%3 = load i32, i32* %1
%4 = sub i32 %3, -4
%5 = load i32, i32* %2
%6 = add i32 %4, 4
store i32 %6, i32* %1
%7 = load i32, i32* %1
%8 = icmp ne i32 %7, 0
br i1 %8, label %9, label %10
9:
store i32 -1, i32* %1
br label %12
10:
%11 = load i32, i32* %2
store i32 4, i32* %1
br label %12
ret i32 0
}
