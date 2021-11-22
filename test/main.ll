declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32@main(){
%1 = alloca [ 12 x i32 ]
%2 = getelementptri32.i32* %1, i32 0, i32 0
store i32 0, i32* %2
%3 = getelementptri32.i32* %1, i32 0, i32 1
store i32 0, i32* %3
%4 = getelementptri32.i32* %1, i32 0, i32 2
store i32 0, i32* %4
%5 = getelementptri32.i32* %1, i32 0, i32 3
store i32 0, i32* %5
%6 = getelementptri32.i32* %1, i32 0, i32 4
store i32 0, i32* %6
%7 = getelementptri32.i32* %1, i32 0, i32 5
store i32 0, i32* %7
%8 = getelementptri32.i32* %1, i32 0, i32 6
store i32 0, i32* %8
%9 = getelementptri32.i32* %1, i32 0, i32 7
store i32 0, i32* %9
%10 = getelementptri32.i32* %1, i32 0, i32 8
store i32 0, i32* %10
%11 = getelementptri32.i32* %1, i32 0, i32 9
store i32 0, i32* %11
%12 = getelementptri32.i32* %1, i32 0, i32 10
store i32 0, i32* %12
%13 = getelementptri32.i32* %1, i32 0, i32 11
store i32 0, i32* %13
ret i32 2
}
