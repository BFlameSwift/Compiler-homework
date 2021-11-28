declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
@n = common dso_local global i32 0, align 4
define dso_local i32 @Merge(i32* %0, i32 %1, i32 %2, i32 %3){
%5 = alloca i32* 
store i32* %0, i32* * %5
%6 = alloca i32 
store i32 %1, i32* %6
%7 = alloca i32 
store i32 %2, i32* %7
%8 = alloca i32 
store i32 %3, i32* %8
%9 = alloca i32 
%10 = load i32, i32* %7
%11 = load i32, i32* %6
%12 = sub i32 %10, %11
%13 = add i32 %12, 1
store i32 %13, i32* %9
%14 = alloca i32 
%15 = load i32, i32* %8
%16 = load i32, i32* %7
%17 = sub i32 %15, %16
store i32 %17, i32* %14
%18 = alloca [ 10 x i32 ]
%19 = alloca [ 10 x i32 ]
%20 = alloca i32 
store i32 0, i32* %20
%21 = alloca i32 
store i32 0, i32* %21
br label %22
22:
%23 = load i32, i32* %20
%24 = load i32, i32* %9
%25 = icmp slt i32 %23, %24
br i1 %25, label %26, label %39
26:
%27 = load i32, i32* %20
%28 = add i32 %27, 0
%29 = load i32, i32* %20
%30 = load i32, i32* %6
%31 = add i32 %29, %30
%32 = add i32 %31, 0
%33 = load i32* , i32* * %5
%34 = getelementptr i32, i32* %33, i32 %32
%35 = getelementptr[ 10 x i32 ],[10 x i32 ]* %18, i32 0, i32 %28
%36 = load i32, i32* %34
store i32 %36, i32* %35
%37 = load i32, i32* %20
%38 = add i32 %37, 1
store i32 %38, i32* %20
br label %22
39:
br label %40
40:
%41 = load i32, i32* %21
%42 = load i32, i32* %14
%43 = icmp slt i32 %41, %42
br i1 %43, label %44, label %58
44:
%45 = load i32, i32* %21
%46 = add i32 %45, 0
%47 = load i32, i32* %21
%48 = load i32, i32* %7
%49 = add i32 %47, %48
%50 = add i32 %49, 1
%51 = add i32 %50, 0
%52 = load i32* , i32* * %5
%53 = getelementptr i32, i32* %52, i32 %51
%54 = getelementptr[ 10 x i32 ],[10 x i32 ]* %19, i32 0, i32 %46
%55 = load i32, i32* %53
store i32 %55, i32* %54
%56 = load i32, i32* %21
%57 = add i32 %56, 1
store i32 %57, i32* %21
br label %40
58:
store i32 0, i32* %20
store i32 0, i32* %21
%59 = alloca i32 
%60 = load i32, i32* %6
store i32 %60, i32* %59
br label %61
61:
%62 = load i32, i32* %20
%63 = load i32, i32* %9
%64 = icmp ne i32 %62, %63
%65 = load i32, i32* %21
%66 = load i32, i32* %14
%67 = icmp ne i32 %65, %66
%68 = and i1 %64, %67
br i1 %68, label %69, label %107
69:
%70 = load i32, i32* %20
%71 = add i32 %70, 0
%72 = getelementptr[ 10 x i32 ],[10 x i32 ]* %18, i32 0, i32 %71
%73 = load i32, i32* %21
%74 = add i32 %73, 0
%75 = getelementptr[ 10 x i32 ],[10 x i32 ]* %19, i32 0, i32 %74
%76 = load i32, i32* %75
%77 = add i32 %76, 1
%78 = load i32, i32* %72
%79 = icmp slt i32 %78, %77
br i1 %79, label %80, label %93
80:
%81 = load i32, i32* %59
%82 = add i32 %81, 0
%83 = load i32, i32* %20
%84 = add i32 %83, 0
%85 = getelementptr[ 10 x i32 ],[10 x i32 ]* %18, i32 0, i32 %84
%86 = load i32* , i32* * %5
%87 = getelementptr i32, i32* %86, i32 %82
%88 = load i32, i32* %85
store i32 %88, i32* %87
%89 = load i32, i32* %59
%90 = add i32 %89, 1
store i32 %90, i32* %59
%91 = load i32, i32* %20
%92 = add i32 %91, 1
store i32 %92, i32* %20
br label %106
93:
%94 = load i32, i32* %59
%95 = add i32 %94, 0
%96 = load i32, i32* %21
%97 = add i32 %96, 0
%98 = getelementptr[ 10 x i32 ],[10 x i32 ]* %19, i32 0, i32 %97
%99 = load i32* , i32* * %5
%100 = getelementptr i32, i32* %99, i32 %95
%101 = load i32, i32* %98
store i32 %101, i32* %100
%102 = load i32, i32* %59
%103 = add i32 %102, 1
store i32 %103, i32* %59
%104 = load i32, i32* %21
%105 = add i32 %104, 1
store i32 %105, i32* %21
br label %106
106:
br label %61
107:
br label %108
108:
%109 = load i32, i32* %20
%110 = load i32, i32* %9
%111 = icmp slt i32 %109, %110
br i1 %111, label %112, label %125
112:
%113 = load i32, i32* %59
%114 = add i32 %113, 0
%115 = load i32, i32* %20
%116 = add i32 %115, 0
%117 = getelementptr[ 10 x i32 ],[10 x i32 ]* %18, i32 0, i32 %116
%118 = load i32* , i32* * %5
%119 = getelementptr i32, i32* %118, i32 %114
%120 = load i32, i32* %117
store i32 %120, i32* %119
%121 = load i32, i32* %59
%122 = add i32 %121, 1
store i32 %122, i32* %59
%123 = load i32, i32* %20
%124 = add i32 %123, 1
store i32 %124, i32* %20
br label %108
125:
br label %126
126:
%127 = load i32, i32* %21
%128 = load i32, i32* %14
%129 = icmp slt i32 %127, %128
br i1 %129, label %130, label %143
130:
%131 = load i32, i32* %59
%132 = add i32 %131, 0
%133 = load i32, i32* %21
%134 = add i32 %133, 0
%135 = getelementptr[ 10 x i32 ],[10 x i32 ]* %19, i32 0, i32 %134
%136 = load i32* , i32* * %5
%137 = getelementptr i32, i32* %136, i32 %132
%138 = load i32, i32* %135
store i32 %138, i32* %137
%139 = load i32, i32* %59
%140 = add i32 %139, 1
store i32 %140, i32* %59
%141 = load i32, i32* %21
%142 = add i32 %141, 1
store i32 %142, i32* %21
br label %126
143:
ret i32 0
}
define dso_local i32 @MergeSort(i32* %0, i32 %1, i32 %2){
%4 = alloca i32* 
store i32* %0, i32* * %4
%5 = alloca i32 
store i32 %1, i32* %5
%6 = alloca i32 
store i32 %2, i32* %6
%7 = load i32, i32* %5
%8 = load i32, i32* %6
%9 = icmp slt i32 %7, %8
br i1 %9, label %10, label %35
10:
%11 = alloca i32 
%12 = load i32, i32* %5
%13 = load i32, i32* %6
%14 = add i32 %12, %13
%15 = sdiv i32 %14, 2
store i32 %15, i32* %11
%16 = alloca i32 
%17 = load i32* , i32* * %4
%18 = getelementptr i32, i32* %17, i32 0
%19 = load i32, i32* %5
%20 = load i32, i32* %11
%21 = call i32 @MergeSort(i32 * %18, i32 %19, i32 %20)
store i32 %21, i32* %16
%22 = load i32, i32* %11
%23 = add i32 %22, 1
store i32 %23, i32* %16
%24 = load i32* , i32* * %4
%25 = getelementptr i32, i32* %24, i32 0
%26 = load i32, i32* %16
%27 = load i32, i32* %6
%28 = call i32 @MergeSort(i32 * %25, i32 %26, i32 %27)
store i32 %28, i32* %16
%29 = load i32* , i32* * %4
%30 = getelementptr i32, i32* %29, i32 0
%31 = load i32, i32* %5
%32 = load i32, i32* %11
%33 = load i32, i32* %6
%34 = call i32 @Merge(i32 * %30, i32 %31, i32 %32, i32 %33)
store i32 %34, i32* %16
br label %35
35:
ret i32 0
}
define dso_local i32 @main(){
%1 = alloca [ 10 x i32 ]
%2 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%3 = call i32 @getarray(i32 * %2)
store i32 %3, i32* @n
%4 = alloca i32 
store i32 0, i32* %4
%5 = alloca i32 
%6 = load i32, i32* @n
%7 = sub i32 %6, 1
store i32 %7, i32* %5
%8 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%9 = load i32, i32* %4
%10 = load i32, i32* %5
%11 = call i32 @MergeSort(i32 * %8, i32 %9, i32 %10)
store i32 %11, i32* %4
%12 = load i32, i32* @n
%13 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
call void @putarray(i32 %12, i32 * %13)
ret i32 0
}
