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
%5 = load i32, i32* %2
%6 = load i32, i32* %4
%7 = add i32 %5, %6
%8 = getelementptr[ 8 x i32 ],[8 x i32 ]* @e, i32 0, i32 0
%9 = getelementptr i32,i32* %8, i32 0
%10 = load i32, i32* %9
%11 = sub i32 %7, %10
%12 = getelementptr[ 8 x i32 ],[8 x i32 ]* @a, i32 0, i32 0
%13 = getelementptr i32,i32* %12, i32 0
%14 = load i32, i32* %13
%15 = add i32 %11, %14
call void @putint( i32 %15)
%16 = alloca [ 8 x i32 ]
%17 = getelementptr[ 8 x i32 ],[8 x i32 ]* %16, i32 0, i32 0
%18 = getelementptr i32,i32* %17, i32 0
store i32 0, i32* %18
%19 = getelementptr i32,i32* %17, i32 1
store i32 0, i32* %19
%20 = getelementptr i32,i32* %17, i32 2
store i32 0, i32* %20
%21 = getelementptr i32,i32* %17, i32 3
store i32 0, i32* %21
%22 = getelementptr i32,i32* %17, i32 4
store i32 0, i32* %22
%23 = getelementptr i32,i32* %17, i32 5
store i32 0, i32* %23
%24 = getelementptr i32,i32* %17, i32 6
store i32 0, i32* %24
%25 = getelementptr i32,i32* %17, i32 7
store i32 0, i32* %25
%26 = alloca [ 8 x i32 ]
%27 = getelementptr[ 8 x i32 ],[8 x i32 ]* %26, i32 0, i32 0
%28 = getelementptr i32,i32* %27, i32 0
store i32 1, i32* %28
%29 = getelementptr i32,i32* %27, i32 1
store i32 2, i32* %29
%30 = getelementptr i32,i32* %27, i32 2
store i32 3, i32* %30
%31 = getelementptr i32,i32* %27, i32 3
store i32 4, i32* %31
%32 = getelementptr i32,i32* %27, i32 4
store i32 5, i32* %32
%33 = getelementptr i32,i32* %27, i32 5
store i32 6, i32* %33
%34 = getelementptr i32,i32* %27, i32 6
store i32 7, i32* %34
%35 = getelementptr i32,i32* %27, i32 7
store i32 8, i32* %35
%36 = alloca [ 8 x i32 ]
%37 = getelementptr[ 8 x i32 ],[8 x i32 ]* %36, i32 0, i32 0
%38 = getelementptr i32,i32* %37, i32 0
store i32 1, i32* %38
%39 = getelementptr i32,i32* %37, i32 1
store i32 2, i32* %39
%40 = getelementptr i32,i32* %37, i32 2
store i32 3, i32* %40
%41 = getelementptr i32,i32* %37, i32 3
store i32 4, i32* %41
%42 = getelementptr i32,i32* %37, i32 4
store i32 5, i32* %42
%43 = getelementptr i32,i32* %37, i32 5
store i32 6, i32* %43
%44 = getelementptr i32,i32* %37, i32 6
store i32 7, i32* %44
%45 = getelementptr i32,i32* %37, i32 7
store i32 8, i32* %45
call void @putch( i32 10)
%46 = getelementptr[ 8 x i32 ],[8 x i32 ]* @b, i32 0, i32 0
%47 = getelementptr i32,i32* %46, i32 0
%48 = getelementptr[ 8 x i32 ],[8 x i32 ]* @b, i32 0, i32 0
%49 = getelementptr i32,i32* %48, i32 0
%50 = alloca [ 8 x i32 ]
%51 = getelementptr[ 8 x i32 ],[8 x i32 ]* %50, i32 0, i32 0
%52 = getelementptr i32,i32* %51, i32 0
%53 = load i32, i32* %47
store i32 %53, i32* %52
%54 = getelementptr i32,i32* %51, i32 1
%55 = load i32, i32* %49
store i32 %55, i32* %54
%56 = getelementptr i32,i32* %51, i32 2
store i32 3, i32* %56
%57 = getelementptr i32,i32* %51, i32 3
store i32 4, i32* %57
%58 = getelementptr i32,i32* %51, i32 4
store i32 5, i32* %58
%59 = getelementptr i32,i32* %51, i32 5
store i32 6, i32* %59
%60 = getelementptr i32,i32* %51, i32 6
store i32 7, i32* %60
%61 = getelementptr i32,i32* %51, i32 7
store i32 8, i32* %61
%62 = getelementptr[ 8 x i32 ],[8 x i32 ]* @e, i32 0, i32 0
%63 = getelementptr i32,i32* %62, i32 0
%64 = getelementptr[ 8 x i32 ],[8 x i32 ]* @e, i32 0, i32 0
%65 = getelementptr i32,i32* %64, i32 0
%66 = load i32, i32* %63
%67 = load i32, i32* %65
%68 = add i32 %66, %67
%69 = getelementptr[ 8 x i32 ],[8 x i32 ]* @e, i32 0, i32 0
%70 = getelementptr i32,i32* %69, i32 0
%71 = load i32, i32* %70
%72 = add i32 %68, %71
%73 = getelementptr[ 8 x i32 ],[8 x i32 ]* @a, i32 0, i32 0
%74 = getelementptr i32,i32* %73, i32 0
%75 = load i32, i32* %74
%76 = add i32 %72, %75
call void @putint( i32 %76)
ret i32 0
}
