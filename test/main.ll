declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
define dso_local i32@main(i32 %0, i32* %1){
%2 = alloca i32
%3 = alloca i32
%4 = load i32, i32* %1
%5 = alloca i32
store i32 1, i32* %5
ret i32 1
}
