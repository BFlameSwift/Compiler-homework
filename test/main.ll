declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
define dso_local i32 @exgcd(i32 %0, i32 %1, i32* %2, i32* %3){
%5 = alloca i32 
store i32 %0, i32* %5
%6 = alloca i32 
store i32 %1, i32* %6
%7 = alloca i32* 
store i32* %2, i32* * %7
%8 = alloca i32* 
store i32* %3, i32* * %8
%9 = load i32, i32* %6
%10 = icmp eq i32 %9, 0
br i1 %10, label %11, label %18
11:
%12 = load i32* , i32* * %7
%13 = getelementptr i32, i32* %12, i32 0
store i32 1, i32* %13
%14 = load i32* , i32* * %8
%15 = getelementptr i32, i32* %14, i32 0
store i32 0, i32* %15
%16 = load i32, i32* %5
ret i32 %16
17:
br label %51
18:
%19 = load i32, i32* %6
%20 = load i32, i32* %5
%21 = load i32, i32* %6
%22 = srem i32 %20, %21
%23 = load i32* , i32* * %7
%24 = getelementptr i32, i32* %23, i32 0
%25 = load i32* , i32* * %8
%26 = getelementptr i32, i32* %25, i32 0
%27 = call i32 @exgcd(i32 %19, i32 %22, i32 * %24, i32 * %26)
%28 = alloca i32 
store i32 %27, i32* %28
%29 = load i32* , i32* * %7
%30 = getelementptr i32, i32* %29, i32 0
%31 = alloca i32 
%32 = load i32, i32* %30
store i32 %32, i32* %31
%33 = load i32* , i32* * %8
%34 = getelementptr i32, i32* %33, i32 0
%35 = load i32* , i32* * %7
%36 = getelementptr i32, i32* %35, i32 0
%37 = load i32, i32* %34
store i32 %37, i32* %36
%38 = load i32, i32* %31
%39 = load i32, i32* %5
%40 = load i32, i32* %6
%41 = sdiv i32 %39, %40
%42 = load i32* , i32* * %8
%43 = getelementptr i32, i32* %42, i32 0
%44 = load i32, i32* %43
%45 = mul i32 %41, %44
%46 = sub i32 %38, %45
%47 = load i32* , i32* * %8
%48 = getelementptr i32, i32* %47, i32 0
store i32 %46, i32* %48
%49 = load i32, i32* %28
ret i32 %49
50:
br label %51
51:
ret i32 0
}
