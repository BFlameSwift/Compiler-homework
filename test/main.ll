declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
@arr = dso_local global [25 x i32 ] [ i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ]
define dso_local i32 @foo(i32* %0){
%2 = alloca i32* 
store i32* %0, i32* * %2
%3 = load i32* , i32* * %2
%4 = getelementptr i32, i32* %3, i32 1
store i32 1, i32* %4
ret i32 2
}
define dso_local i32 @main(){
%1 = getelementptr[ 25 x i32 ],[25 x i32 ]* @arr, i32 0, i32 0
%2 = call i32 @foo(i32 * %1)
ret i32 0
}
