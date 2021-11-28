declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
@n = common dso_local global i32 0, align 4
define dso_local i32 @swap(i32* %0, i32 %1, i32 %2){
%4 = alloca i32* 
store i32* %0, i32* * %4
%5 = alloca i32 
store i32 %1, i32* %5
%6 = alloca i32 
store i32 %2, i32* %6
%7 = alloca i32 
%8 = load i32, i32* %5
%9 = add i32 %8, 0
%10 = load i32* , i32* * %4
%11 = getelementptr i32, i32* %10, i32 %9
%12 = load i32, i32* %11
store i32 %12, i32* %7
%13 = load i32, i32* %5
%14 = add i32 %13, 0
%15 = load i32, i32* %6
%16 = add i32 %15, 0
%17 = load i32* , i32* * %4
%18 = getelementptr i32, i32* %17, i32 %16
%19 = load i32* , i32* * %4
%20 = getelementptr i32, i32* %19, i32 %14
%21 = load i32, i32* %18
store i32 %21, i32* %20
%22 = load i32, i32* %6
%23 = add i32 %22, 0
%24 = load i32, i32* %7
%25 = load i32* , i32* * %4
%26 = getelementptr i32, i32* %25, i32 %23
store i32 %24, i32* %26
ret i32 0
}
define dso_local i32 @heap_ajust(i32* %0, i32 %1, i32 %2){
%4 = alloca i32* 
store i32* %0, i32* * %4
%5 = alloca i32 
store i32 %1, i32* %5
%6 = alloca i32 
store i32 %2, i32* %6
%7 = alloca i32 
%8 = load i32, i32* %5
store i32 %8, i32* %7
%9 = alloca i32 
%10 = load i32, i32* %7
%11 = mul i32 %10, 2
%12 = add i32 %11, 1
store i32 %12, i32* %9
br label %13
13:
%14 = load i32, i32* %9
%15 = load i32, i32* %6
%16 = add i32 %15, 1
%17 = icmp slt i32 %14, %16
br i1 %17, label %18, label %62
18:
%19 = load i32, i32* %9
%20 = load i32, i32* %6
%21 = icmp slt i32 %19, %20
%22 = load i32, i32* %9
%23 = add i32 %22, 0
%24 = load i32* , i32* * %4
%25 = getelementptr i32, i32* %24, i32 %23
%26 = load i32, i32* %9
%27 = add i32 %26, 1
%28 = add i32 %27, 0
%29 = load i32* , i32* * %4
%30 = getelementptr i32, i32* %29, i32 %28
%31 = load i32, i32* %25
%32 = load i32, i32* %30
%33 = icmp slt i32 %31, %32
%34 = and i1 %21, %33
br i1 %34, label %35, label %38
35:
%36 = load i32, i32* %9
%37 = add i32 %36, 1
store i32 %37, i32* %9
br label %38
38:
%39 = load i32, i32* %7
%40 = add i32 %39, 0
%41 = load i32* , i32* * %4
%42 = getelementptr i32, i32* %41, i32 %40
%43 = load i32, i32* %9
%44 = add i32 %43, 0
%45 = load i32* , i32* * %4
%46 = getelementptr i32, i32* %45, i32 %44
%47 = load i32, i32* %42
%48 = load i32, i32* %46
%49 = icmp sgt i32 %47, %48
br i1 %49, label %50, label %52
50:
ret i32 0
51:
br label %61
52:
%53 = load i32*, i32* * %4
%54 = load i32, i32* %7
%55 = load i32, i32* %9
%56 = call i32 @swap(i32 * %53, i32 %54, i32 %55)
store i32 %56, i32* %7
%57 = load i32, i32* %9
store i32 %57, i32* %7
%58 = load i32, i32* %7
%59 = mul i32 %58, 2
%60 = add i32 %59, 1
store i32 %60, i32* %9
br label %61
61:
br label %13
62:
ret i32 0
}
define dso_local i32 @heap_sort(i32* %0, i32 %1){
%3 = alloca i32* 
store i32* %0, i32* * %3
%4 = alloca i32 
store i32 %1, i32* %4
%5 = alloca i32 
%6 = alloca i32 
%7 = load i32, i32* %4
%8 = sdiv i32 %7, 2
%9 = sub i32 %8, 1
store i32 %9, i32* %5
br label %10
10:
%11 = load i32, i32* %5
%12 = icmp sgt i32 %11, -1
br i1 %12, label %13, label %22
13:
%14 = load i32, i32* %4
%15 = sub i32 %14, 1
store i32 %15, i32* %6
%16 = load i32*, i32* * %3
%17 = load i32, i32* %5
%18 = load i32, i32* %6
%19 = call i32 @heap_ajust(i32 * %16, i32 %17, i32 %18)
store i32 %19, i32* %6
%20 = load i32, i32* %5
%21 = sub i32 %20, 1
store i32 %21, i32* %5
br label %10
22:
%23 = load i32, i32* %4
%24 = sub i32 %23, 1
store i32 %24, i32* %5
br label %25
25:
%26 = load i32, i32* %5
%27 = icmp sgt i32 %26, 0
br i1 %27, label %28, label %42
28:
%29 = alloca i32 
store i32 0, i32* %29
%30 = load i32*, i32* * %3
%31 = load i32, i32* %29
%32 = load i32, i32* %5
%33 = call i32 @swap(i32 * %30, i32 %31, i32 %32)
store i32 %33, i32* %6
%34 = load i32, i32* %5
%35 = sub i32 %34, 1
store i32 %35, i32* %6
%36 = load i32*, i32* * %3
%37 = load i32, i32* %29
%38 = load i32, i32* %6
%39 = call i32 @heap_ajust(i32 * %36, i32 %37, i32 %38)
store i32 %39, i32* %6
%40 = load i32, i32* %5
%41 = sub i32 %40, 1
store i32 %41, i32* %5
br label %25
42:
ret i32 0
}
define dso_local i32 @main(){
%1 = alloca [ 10 x i32 ]
%2 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%3 = call i32 @getarray(i32 * %2)
store i32 %3, i32* @n
%4 = alloca i32 
store i32 0, i32* %4
%5 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%6 = load i32, i32* @n
%7 = call i32 @heap_sort(i32 * %5, i32 %6)
store i32 %7, i32* %4
%8 = load i32, i32* @n
%9 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
call void @putarray(i32 %8, i32 * %9)
ret i32 0
}
