declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@n = common dso_local global i32 0, align 4
define dso_local i32@main(){
store i32 10, i32* @n
%1 = alloca [ 10 x i32 ]
%2 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%3 = getelementptr i32,i32* %2, i32 0
store i32 4, i32* %3
%4 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%5 = getelementptr i32,i32* %4, i32 1
store i32 3, i32* %5
%6 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%7 = getelementptr i32,i32* %6, i32 2
store i32 9, i32* %7
%8 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%9 = getelementptr i32,i32* %8, i32 3
store i32 2, i32* %9
%10 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%11 = getelementptr i32,i32* %10, i32 4
store i32 0, i32* %11
%12 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%13 = getelementptr i32,i32* %12, i32 5
store i32 1, i32* %13
%14 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%15 = getelementptr i32,i32* %14, i32 6
store i32 6, i32* %15
%16 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%17 = getelementptr i32,i32* %16, i32 7
store i32 5, i32* %17
%18 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%19 = getelementptr i32,i32* %18, i32 8
store i32 7, i32* %19
%20 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%21 = getelementptr i32,i32* %20, i32 9
store i32 8, i32* %21
%22 = alloca [ 10 x i32 ]
%23 = alloca [ 10 x i32 ]
%24 = alloca i32
%25 = alloca i32
%26 = alloca i32
store i32 0, i32* %26
store i32 0, i32* %24
store i32 0, i32* %25
br label %27
27:
%28 = load i32, i32* %26
%29 = icmp slt i32 %28, 10
br i1 %29, label %30, label %37
30:
%31 = load i32, i32* %26
%32 = add i32 %31, 0
%33 = getelementptr[ 10 x i32 ],[10 x i32 ]* %23, i32 0, i32 0
%34 = getelementptr i32,i32* %33, i32 %32
store i32 0, i32* %34
%35 = load i32, i32* %26
%36 = add i32 %35, 1
store i32 %36, i32* %26
br label %27
37:
br label %38
38:
%39 = load i32, i32* %24
%40 = load i32, i32* @n
%41 = icmp slt i32 %39, %40
br i1 %41, label %42, label %63
42:
%43 = load i32, i32* %24
%44 = add i32 %43, 0
%45 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%46 = getelementptr i32,i32* %45, i32 %44
%47 = load i32, i32* %46
%48 = add i32 %47, 0
%49 = load i32, i32* %24
%50 = add i32 %49, 0
%51 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%52 = getelementptr i32,i32* %51, i32 %50
%53 = load i32, i32* %52
%54 = add i32 %53, 0
%55 = getelementptr[ 10 x i32 ],[10 x i32 ]* %23, i32 0, i32 0
%56 = getelementptr i32,i32* %55, i32 %54
%57 = load i32, i32* %56
%58 = add i32 %57, 1
%59 = getelementptr[ 10 x i32 ],[10 x i32 ]* %23, i32 0, i32 0
%60 = getelementptr i32,i32* %59, i32 %48
store i32 %58, i32* %60
%61 = load i32, i32* %24
%62 = add i32 %61, 1
store i32 %62, i32* %24
br label %38
63:
store i32 1, i32* %26
br label %64
64:
%65 = load i32, i32* %26
%66 = icmp slt i32 %65, 10
br i1 %66, label %67, label %86
67:
%68 = load i32, i32* %26
%69 = add i32 %68, 0
%70 = load i32, i32* %26
%71 = add i32 %70, 0
%72 = getelementptr[ 10 x i32 ],[10 x i32 ]* %23, i32 0, i32 0
%73 = getelementptr i32,i32* %72, i32 %71
%74 = load i32, i32* %26
%75 = sub i32 %74, 1
%76 = add i32 %75, 0
%77 = getelementptr[ 10 x i32 ],[10 x i32 ]* %23, i32 0, i32 0
%78 = getelementptr i32,i32* %77, i32 %76
%79 = load i32, i32* %73
%80 = load i32, i32* %78
%81 = add i32 %79, %80
%82 = getelementptr[ 10 x i32 ],[10 x i32 ]* %23, i32 0, i32 0
%83 = getelementptr i32,i32* %82, i32 %69
store i32 %81, i32* %83
%84 = load i32, i32* %26
%85 = add i32 %84, 1
store i32 %85, i32* %26
br label %64
86:
%87 = load i32, i32* @n
store i32 %87, i32* %25
br label %88
88:
%89 = load i32, i32* %25
%90 = icmp sgt i32 %89, 0
br i1 %90, label %91, label %133
91:
%92 = load i32, i32* %25
%93 = sub i32 %92, 1
%94 = add i32 %93, 0
%95 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%96 = getelementptr i32,i32* %95, i32 %94
%97 = load i32, i32* %96
%98 = add i32 %97, 0
%99 = load i32, i32* %25
%100 = sub i32 %99, 1
%101 = add i32 %100, 0
%102 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%103 = getelementptr i32,i32* %102, i32 %101
%104 = load i32, i32* %103
%105 = add i32 %104, 0
%106 = getelementptr[ 10 x i32 ],[10 x i32 ]* %23, i32 0, i32 0
%107 = getelementptr i32,i32* %106, i32 %105
%108 = load i32, i32* %107
%109 = sub i32 %108, 1
%110 = getelementptr[ 10 x i32 ],[10 x i32 ]* %23, i32 0, i32 0
%111 = getelementptr i32,i32* %110, i32 %98
store i32 %109, i32* %111
%112 = load i32, i32* %25
%113 = sub i32 %112, 1
%114 = add i32 %113, 0
%115 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%116 = getelementptr i32,i32* %115, i32 %114
%117 = load i32, i32* %116
%118 = add i32 %117, 0
%119 = getelementptr[ 10 x i32 ],[10 x i32 ]* %23, i32 0, i32 0
%120 = getelementptr i32,i32* %119, i32 %118
%121 = load i32, i32* %120
%122 = add i32 %121, 0
%123 = load i32, i32* %25
%124 = sub i32 %123, 1
%125 = add i32 %124, 0
%126 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%127 = getelementptr i32,i32* %126, i32 %125
%128 = getelementptr[ 10 x i32 ],[10 x i32 ]* %22, i32 0, i32 0
%129 = getelementptr i32,i32* %128, i32 %122
%130 = load i32, i32* %127
store i32 %130, i32* %129
%131 = load i32, i32* %25
%132 = sub i32 %131, 1
store i32 %132, i32* %25
br label %88
133:
store i32 0, i32* %24
br label %134
134:
%135 = load i32, i32* %24
%136 = load i32, i32* @n
%137 = icmp slt i32 %135, %136
br i1 %137, label %138, label %149
138:
%139 = alloca i32
%140 = load i32, i32* %24
%141 = add i32 %140, 0
%142 = getelementptr[ 10 x i32 ],[10 x i32 ]* %22, i32 0, i32 0
%143 = getelementptr i32,i32* %142, i32 %141
%144 = load i32, i32* %143
store i32 %144, i32* %139
%145 = load i32, i32* %139
call void @putint( i32 %145)
store i32 10, i32* %139
%146 = load i32, i32* %139
call void @putch( i32 %146)
%147 = load i32, i32* %24
%148 = add i32 %147, 1
store i32 %148, i32* %24
br label %134
149:
ret i32 0
}
