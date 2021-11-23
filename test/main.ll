declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@a = dso_local global [8 x i32 ] [ i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ]
@b = dso_local constant [8 x i32 ] [ i32 9, i32 2, i32 3, i32 4, i32 1, i32 5, i32 4, i32 0 ]
@c = dso_local global [8 x i32 ] [ i32 1, i32 2, i32 3, i32 4, i32 6, i32 3, i32 7, i32 8 ]
@e = dso_local global [8 x i32 ] [ i32 6, i32 7, i32 4, i32 5, i32 5, i32 6, i32 9, i32 10 ]
define dso_local i32@main(){
%1 = getelementptr[ 8 x i32 ],[8 x i32 ]* @e, i32 0, i32 0
%2 = getelementptr i32,i32* %1, i32 0
%3 = getelementptr[ 8 x i32 ],[8 x i32 ]* @e, i32 0, i32 0
%4 = getelementptr i32,i32* %3, i32 0
%5 = add i32 %2, %4
%6 = getelementptr[ 8 x i32 ],[8 x i32 ]* @e, i32 0, i32 0
%7 = getelementptr i32,i32* %6, i32 0
%8 = sub i32 %5, %7
%9 = getelementptr[ 8 x i32 ],[8 x i32 ]* @a, i32 0, i32 0
%10 = getelementptr i32,i32* %9, i32 0
%11 = add i32 %8, %10
call void @putint( i32 %11)
%12 = alloca [ 8 x i32 ]
%13 = getelementptr[ 8 x i32 ],[8 x i32 ]* %12, i32 0, i32 0
%14 = getelementptr i32,i32* %13, i32 0
store i32 0, i32* %14
%15 = getelementptr i32,i32* %13, i32 1
store i32 0, i32* %15
%16 = getelementptr i32,i32* %13, i32 2
store i32 0, i32* %16
%17 = getelementptr i32,i32* %13, i32 3
store i32 0, i32* %17
%18 = getelementptr i32,i32* %13, i32 4
store i32 0, i32* %18
%19 = getelementptr i32,i32* %13, i32 5
store i32 0, i32* %19
%20 = getelementptr i32,i32* %13, i32 6
store i32 0, i32* %20
%21 = getelementptr i32,i32* %13, i32 7
store i32 0, i32* %21
%22 = alloca [ 8 x i32 ]
%23 = getelementptr[ 8 x i32 ],[8 x i32 ]* %22, i32 0, i32 0
%24 = getelementptr i32,i32* %23, i32 0
store i32 1, i32* %24
%25 = getelementptr i32,i32* %23, i32 1
store i32 2, i32* %25
%26 = getelementptr i32,i32* %23, i32 2
store i32 3, i32* %26
%27 = getelementptr i32,i32* %23, i32 3
store i32 4, i32* %27
%28 = getelementptr i32,i32* %23, i32 4
store i32 5, i32* %28
%29 = getelementptr i32,i32* %23, i32 5
store i32 6, i32* %29
%30 = getelementptr i32,i32* %23, i32 6
store i32 7, i32* %30
%31 = getelementptr i32,i32* %23, i32 7
store i32 8, i32* %31
%32 = alloca [ 8 x i32 ]
%33 = getelementptr[ 8 x i32 ],[8 x i32 ]* %32, i32 0, i32 0
%34 = getelementptr i32,i32* %33, i32 0
store i32 1, i32* %34
%35 = getelementptr i32,i32* %33, i32 1
store i32 2, i32* %35
%36 = getelementptr i32,i32* %33, i32 2
store i32 3, i32* %36
%37 = getelementptr i32,i32* %33, i32 3
store i32 4, i32* %37
%38 = getelementptr i32,i32* %33, i32 4
store i32 5, i32* %38
%39 = getelementptr i32,i32* %33, i32 5
store i32 6, i32* %39
%40 = getelementptr i32,i32* %33, i32 6
store i32 7, i32* %40
%41 = getelementptr i32,i32* %33, i32 7
store i32 8, i32* %41
call void @putch( i32 10)
%42 = getelementptr[ 8 x i32 ],[8 x i32 ]* @b, i32 0, i32 0
%43 = getelementptr i32,i32* %42, i32 0
%44 = getelementptr[ 8 x i32 ],[8 x i32 ]* @b, i32 0, i32 0
%45 = getelementptr i32,i32* %44, i32 0
%46 = alloca [ 8 x i32 ]
%47 = getelementptr[ 8 x i32 ],[8 x i32 ]* %46, i32 0, i32 0
%48 = getelementptr i32,i32* %47, i32 0
store i32 %43, i32* %48
%49 = getelementptr i32,i32* %47, i32 1
store i32 %45, i32* %49
%50 = getelementptr i32,i32* %47, i32 2
store i32 3, i32* %50
%51 = getelementptr i32,i32* %47, i32 3
store i32 4, i32* %51
%52 = getelementptr i32,i32* %47, i32 4
store i32 5, i32* %52
%53 = getelementptr i32,i32* %47, i32 5
store i32 6, i32* %53
%54 = getelementptr i32,i32* %47, i32 6
store i32 7, i32* %54
%55 = getelementptr i32,i32* %47, i32 7
store i32 8, i32* %55
%56 = getelementptr[ 8 x i32 ],[8 x i32 ]* @e, i32 0, i32 0
%57 = getelementptr i32,i32* %56, i32 0
%58 = getelementptr[ 8 x i32 ],[8 x i32 ]* @e, i32 0, i32 0
%59 = getelementptr i32,i32* %58, i32 0
%60 = add i32 %57, %59
%61 = getelementptr[ 8 x i32 ],[8 x i32 ]* @e, i32 0, i32 0
%62 = getelementptr i32,i32* %61, i32 0
%63 = add i32 %60, %62
%64 = getelementptr[ 8 x i32 ],[8 x i32 ]* @a, i32 0, i32 0
%65 = getelementptr i32,i32* %64, i32 0
%66 = add i32 %63, %65
call void @putint( i32 %66)
ret i32 0
}
