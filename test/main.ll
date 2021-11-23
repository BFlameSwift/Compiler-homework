declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@a = common dso_local global [12 x i32 ]  zeroinitializer 
define dso_local i32@main(){
%1 = alloca i32
store i32 0, i32* %1
%2 = alloca i32
store i32 0, i32* %2
br label %3
3:
%4 = load i32, i32* %1
%5 = icmp sle i32 %4, 5
br i1 %5, label %6, label %42
6:
%7 = load i32, i32* %1
%8 = alloca i32
store i32 %7, i32* %8
br label %9
9:
%10 = load i32, i32* %8
%11 = icmp sge i32 %10, 0
br i1 %11, label %12, label %39
12:
%13 = load i32, i32* %8
%14 = icmp slt i32 %13, 4
%15 = load i32, i32* %1
%16 = load i32, i32* %8
%17 = sub i32 %15, %16
%18 = icmp slt i32 %17, 3
%19= zext i1 %14 to i32
%20= zext i1 %18 to i32
%21 = and i32 %19, %20
%22 = icmp ne i32 %21, 0
br i1 %22, label %23, label %36
23:
%24 = load i32, i32* %1
%25 = load i32, i32* %8
%26 = sub i32 %24, %25
%27 = load i32, i32* %8
%28 = mul i32 %26, 4
%29 = add i32 %28, 0
%30 = add i32 %27, %29
%31 = load i32, i32* %2
%32 = getelementptr[ 12 x i32 ],[12 x i32 ]* @a, i32 0, i32 0
%33 = getelementptr i32,i32* %32, i32 %30
store i32 %31, i32* %33
%34 = load i32, i32* %2
%35 = add i32 %34, 1
store i32 %35, i32* %2
br label %36
36:
%37 = load i32, i32* %8
%38 = sub i32 %37, 1
store i32 %38, i32* %8
br label %9
39:
%40 = load i32, i32* %1
%41 = add i32 %40, 1
store i32 %41, i32* %1
br label %3
42:
store i32 0, i32* %1
%43 = alloca i32
store i32 0, i32* %43
br label %44
44:
%45 = load i32, i32* %1
%46 = icmp slt i32 %45, 3
br i1 %46, label %47, label %65
47:
store i32 0, i32* %43
br label %48
48:
%49 = load i32, i32* %43
%50 = icmp slt i32 %49, 4
br i1 %50, label %51, label %62
51:
%52 = load i32, i32* %1
%53 = load i32, i32* %43
%54 = mul i32 %52, 4
%55 = add i32 %54, 0
%56 = add i32 %53, %55
%57 = getelementptr[ 12 x i32 ],[12 x i32 ]* @a, i32 0, i32 0
%58 = getelementptr i32,i32* %57, i32 %56
%59 = load i32, i32* %58
call void @putint( i32 %59)
call void @putch( i32 32)
%60 = load i32, i32* %43
%61 = add i32 %60, 1
store i32 %61, i32* %43
br label %48
62:
call void @putch( i32 10)
%63 = load i32, i32* %1
%64 = add i32 %63, 1
store i32 %64, i32* %1
br label %44
65:
ret i32 0
}
