declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@a = dso_local global i32 [8 x i32 ][ i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ]
@b = dso_local constant i32 [8 x i32 ][ i32 9, i32 2, i32 3, i32 4, i32 1, i32 5, i32 4, i32 0 ]
@c = dso_local global i32 [8 x i32 ][ i32 1, i32 2, i32 3, i32 4, i32 6, i32 3, i32 7, i32 8 ]
@e = dso_local global i32 [8 x i32 ][ i32 6, i32 7, i32 4, i32 5, i32 5, i32 6, i32 9, i32 10 ]
define dso_local i32@main(){
%1 = alloca [ 8 x i32 ]
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
%10 = alloca [ 8 x i32 ]
%11 = getelementptri32.i32* %10, i32 0, i32 0
store i32 1, i32* %11
%12 = getelementptri32.i32* %10, i32 0, i32 1
store i32 2, i32* %12
%13 = getelementptri32.i32* %10, i32 0, i32 2
store i32 3, i32* %13
%14 = getelementptri32.i32* %10, i32 0, i32 3
store i32 4, i32* %14
%15 = getelementptri32.i32* %10, i32 0, i32 4
store i32 5, i32* %15
%16 = getelementptri32.i32* %10, i32 0, i32 5
store i32 6, i32* %16
%17 = getelementptri32.i32* %10, i32 0, i32 6
store i32 7, i32* %17
%18 = getelementptri32.i32* %10, i32 0, i32 7
store i32 8, i32* %18
%19 = alloca [ 8 x i32 ]
%20 = getelementptri32.i32* %19, i32 0, i32 0
store i32 1, i32* %20
%21 = getelementptri32.i32* %19, i32 0, i32 1
store i32 2, i32* %21
%22 = getelementptri32.i32* %19, i32 0, i32 2
store i32 3, i32* %22
%23 = getelementptri32.i32* %19, i32 0, i32 3
store i32 4, i32* %23
%24 = getelementptri32.i32* %19, i32 0, i32 4
store i32 5, i32* %24
%25 = getelementptri32.i32* %19, i32 0, i32 5
store i32 6, i32* %25
%26 = getelementptri32.i32* %19, i32 0, i32 6
store i32 7, i32* %26
%27 = getelementptri32.i32* %19, i32 0, i32 7
store i32 8, i32* %27
call void @putch( i32 10)
%28 = alloca [ 8 x i32 ]
%29 = getelementptri32.i32* %28, i32 0, i32 0
store i32 4, i32* %29
%30 = getelementptri32.i32* %28, i32 0, i32 1
store i32 0, i32* %30
%31 = getelementptri32.i32* %28, i32 0, i32 2
store i32 3, i32* %31
%32 = getelementptri32.i32* %28, i32 0, i32 3
store i32 4, i32* %32
%33 = getelementptri32.i32* %28, i32 0, i32 4
store i32 5, i32* %33
%34 = getelementptri32.i32* %28, i32 0, i32 5
store i32 6, i32* %34
%35 = getelementptri32.i32* %28, i32 0, i32 6
store i32 7, i32* %35
%36 = getelementptri32.i32* %28, i32 0, i32 7
store i32 8, i32* %36
call void @putint( i32 23)
ret i32 0
}
