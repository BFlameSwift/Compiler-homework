declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@a = dso_local global [8 x i32 ] [ i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ]
@b = dso_local global [8 x i32 ] [ i32 9, i32 2, i32 3, i32 4, i32 1, i32 5, i32 4, i32 0 ]
@c = dso_local global [8 x i32 ] [ i32 1, i32 2, i32 3, i32 4, i32 6, i32 3, i32 7, i32 8 ]
@e = dso_local global [8 x i32 ] [ i32 6, i32 7, i32 4, i32 5, i32 5, i32 6, i32 9, i32 10 ]
define dso_local i32@main(){
%1 = alloca [ 8 x i32 ]
%2 = getelementptr[ 8 x i32 ],[8 x i32 ]* %1, i32 0, i32 0
%3 = getelementptr i32,i32* %2, i32 0
store i32 0, i32* %3
%4 = getelementptr i32,i32* %2, i32 1
store i32 0, i32* %4
%5 = getelementptr i32,i32* %2, i32 2
store i32 0, i32* %5
%6 = getelementptr i32,i32* %2, i32 3
store i32 0, i32* %6
%7 = getelementptr i32,i32* %2, i32 4
store i32 0, i32* %7
%8 = getelementptr i32,i32* %2, i32 5
store i32 0, i32* %8
%9 = getelementptr i32,i32* %2, i32 6
store i32 0, i32* %9
%10 = getelementptr i32,i32* %2, i32 7
store i32 0, i32* %10
%11 = alloca [ 8 x i32 ]
%12 = getelementptr[ 8 x i32 ],[8 x i32 ]* %11, i32 0, i32 0
%13 = getelementptr i32,i32* %12, i32 0
store i32 1, i32* %13
%14 = getelementptr i32,i32* %12, i32 1
store i32 2, i32* %14
%15 = getelementptr i32,i32* %12, i32 2
store i32 3, i32* %15
%16 = getelementptr i32,i32* %12, i32 3
store i32 4, i32* %16
%17 = getelementptr i32,i32* %12, i32 4
store i32 5, i32* %17
%18 = getelementptr i32,i32* %12, i32 5
store i32 6, i32* %18
%19 = getelementptr i32,i32* %12, i32 6
store i32 7, i32* %19
%20 = getelementptr i32,i32* %12, i32 7
store i32 8, i32* %20
%21 = alloca [ 8 x i32 ]
%22 = getelementptr[ 8 x i32 ],[8 x i32 ]* %21, i32 0, i32 0
%23 = getelementptr i32,i32* %22, i32 0
store i32 1, i32* %23
%24 = getelementptr i32,i32* %22, i32 1
store i32 2, i32* %24
%25 = getelementptr i32,i32* %22, i32 2
store i32 3, i32* %25
%26 = getelementptr i32,i32* %22, i32 3
store i32 4, i32* %26
%27 = getelementptr i32,i32* %22, i32 4
store i32 5, i32* %27
%28 = getelementptr i32,i32* %22, i32 5
store i32 6, i32* %28
%29 = getelementptr i32,i32* %22, i32 6
store i32 7, i32* %29
%30 = getelementptr i32,i32* %22, i32 7
store i32 8, i32* %30
%31 = alloca [ 8 x i32 ]
%32 = getelementptr[ 8 x i32 ],[8 x i32 ]* %31, i32 0, i32 0
%33 = getelementptr i32,i32* %32, i32 0
store i32 4, i32* %33
%34 = getelementptr i32,i32* %32, i32 1
store i32 0, i32* %34
%35 = getelementptr i32,i32* %32, i32 2
store i32 3, i32* %35
%36 = getelementptr i32,i32* %32, i32 3
store i32 4, i32* %36
%37 = getelementptr i32,i32* %32, i32 4
store i32 5, i32* %37
%38 = getelementptr i32,i32* %32, i32 5
store i32 6, i32* %38
%39 = getelementptr i32,i32* %32, i32 6
store i32 7, i32* %39
%40 = getelementptr i32,i32* %32, i32 7
store i32 8, i32* %40
ret i32 0
}
