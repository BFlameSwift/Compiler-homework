declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32@main(){
%1 = alloca i32
store i32 1, i32* %1
%2 = load i32, i32* %1
%3 = alloca [ 4 x i32 ]
%4 = getelementptri32.i32* %3, i32 0, i32 0
store i32 %2, i32* %4
%5 = getelementptri32.i32* %3, i32 0, i32 1
store i32 0, i32* %5
%6 = getelementptri32.i32* %3, i32 0, i32 2
store i32 0, i32* %6
%7 = getelementptri32.i32* %3, i32 0, i32 3
store i32 0, i32* %7
ret i32 0
}
