declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
@a = common dso_local global i32 0, align 4
@r = common dso_local global i32 0, align 4
define dso_local i32 @fac(i32 %0){
%2 = alloca i32 
store i32 %0, i32* %2
%3 = load i32, i32* %2
%4 = icmp slt i32 %3, 2
br i1 %4, label %5, label %7
5:
ret i32 1
6:
br label %7
7:
%8 = load i32, i32* %2
%9 = sub i32 %8, 1
store i32 %9, i32* @a
%10 = load i32, i32* @a
%11 = call i32 @fac(i32 %10)
store i32 %11, i32* @r
%12 = load i32, i32* %2
%13 = load i32, i32* @r
%14 = mul i32 %12, %13
store i32 %14, i32* @r
%15 = load i32, i32* @r
ret i32 %15
}
define dso_local i32 @main(){
%1 = alloca i32 
store i32 5, i32* %1
%2 = load i32, i32* %1
%3 = call i32 @fac(i32 %2)
call void @putint(i32 %3)
ret i32 0
}
