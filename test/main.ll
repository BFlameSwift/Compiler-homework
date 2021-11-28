declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
define dso_local i32@gcd(i32 %0, i32 %1){
%3 = alloca i32 
store i32 %0, i32* %3
%4 = alloca i32 
store i32 %1, i32* %4
%5 = load i32, i32* %4
%6 = icmp eq i32 %5, 0
br i1 %6, label %7, label %10
7:
%8 = load i32, i32* %3
ret i32 %8
9:
br label %10
10:
%11 = load i32, i32* %4
%12 = load i32, i32* %3
%13 = load i32, i32* %4
%14 = srem i32 %12, %13
%15 = call i32 @gcd(i32 %11, i32 %14)
ret i32 %15
}
define dso_local i32@main(){
%1 = alloca i32 
store i32 100, i32* %1
%2 = alloca i32 
store i32 48, i32* %2
%3 = load i32, i32* %1
%4 = load i32, i32* %2
%5 = call i32 @gcd(i32 %3, i32 %4)
call void @putint(i32 %5)
ret i32 0
}
