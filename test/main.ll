declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
@maxn = dso_local constant i32 18, align 4
@mod = dso_local constant i32 1000000007, align 4
@dp = dso_local global [13226976 x i32 ]  zeroinitializer 
@list = dso_local global [200 x i32 ]  zeroinitializer 
@cns = dso_local global [20 x i32 ]  zeroinitializer 
define dso_local i32 @equal(i32 %0, i32 %1){
%3 = alloca i32 
store i32 %0, i32* %3
%4 = alloca i32 
store i32 %1, i32* %4
%5 = load i32, i32* %3
%6 = load i32, i32* %4
%7 = icmp eq i32 %5, %6
br i1 %7, label %8, label %10
8:
ret i32 1
9:
br label %10
10:
ret i32 0
}
define dso_local i32 @dfs(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5){
%7 = alloca i32 
store i32 %0, i32* %7
%8 = alloca i32 
store i32 %1, i32* %8
%9 = alloca i32 
store i32 %2, i32* %9
%10 = alloca i32 
store i32 %3, i32* %10
%11 = alloca i32 
store i32 %4, i32* %11
%12 = alloca i32 
store i32 %5, i32* %12
%13 = load i32, i32* %7
%14 = load i32, i32* %8
%15 = load i32, i32* %9
%16 = load i32, i32* %10
%17 = load i32, i32* %11
%18 = load i32, i32* %12
%19 = mul i32 %13, 734832
%20 = add i32 %19, 0
%21 = mul i32 %14, 40824
%22 = add i32 %21, %20
%23 = mul i32 %15, 2268
%24 = add i32 %23, %22
%25 = mul i32 %16, 126
%26 = add i32 %25, %24
%27 = mul i32 %17, 7
%28 = add i32 %27, %26
%29 = add i32 %18, %28
%30 = getelementptr[ 13226976 x i32 ],[13226976 x i32 ]* @dp, i32 0, i32 %29
%31 = load i32, i32* %30
%32 = icmp ne i32 %31, -1
br i1 %32, label %33, label %54
33:
%34 = load i32, i32* %7
%35 = load i32, i32* %8
%36 = load i32, i32* %9
%37 = load i32, i32* %10
%38 = load i32, i32* %11
%39 = load i32, i32* %12
%40 = mul i32 %34, 734832
%41 = add i32 %40, 0
%42 = mul i32 %35, 40824
%43 = add i32 %42, %41
%44 = mul i32 %36, 2268
%45 = add i32 %44, %43
%46 = mul i32 %37, 126
%47 = add i32 %46, %45
%48 = mul i32 %38, 7
%49 = add i32 %48, %47
%50 = add i32 %39, %49
%51 = getelementptr[ 13226976 x i32 ],[13226976 x i32 ]* @dp, i32 0, i32 %50
%52 = load i32, i32* %51
ret i32 %52
53:
br label %54
54:
%55 = load i32, i32* %7
%56 = load i32, i32* %8
%57 = add i32 %55, %56
%58 = load i32, i32* %9
%59 = add i32 %57, %58
%60 = load i32, i32* %10
%61 = add i32 %59, %60
%62 = load i32, i32* %11
%63 = add i32 %61, %62
%64 = icmp eq i32 %63, 0
br i1 %64, label %65, label %67
65:
ret i32 1
66:
br label %67
67:
%68 = alloca i32 
store i32 0, i32* %68
%69 = load i32, i32* %7
%70 = icmp ne i32 %69, 0
br i1 %70, label %71, label %87
71:
%72 = load i32, i32* %68
%73 = load i32, i32* %7
%74 = load i32, i32* %12
%75 = call i32 @equal(i32 %74, i32 2)
%76 = sub i32 %73, %75
%77 = load i32, i32* %7
%78 = sub i32 %77, 1
%79 = load i32, i32* %8
%80 = load i32, i32* %9
%81 = load i32, i32* %10
%82 = load i32, i32* %11
%83 = call i32 @dfs(i32 %78, i32 %79, i32 %80, i32 %81, i32 %82, i32 1)
%84 = mul i32 %76, %83
%85 = add i32 %72, %84
%86 = srem i32 %85, 1000000007
store i32 %86, i32* %68
br label %87
87:
%88 = load i32, i32* %8
%89 = icmp ne i32 %88, 0
br i1 %89, label %90, label %107
90:
%91 = load i32, i32* %68
%92 = load i32, i32* %8
%93 = load i32, i32* %12
%94 = call i32 @equal(i32 %93, i32 3)
%95 = sub i32 %92, %94
%96 = load i32, i32* %7
%97 = add i32 %96, 1
%98 = load i32, i32* %8
%99 = sub i32 %98, 1
%100 = load i32, i32* %9
%101 = load i32, i32* %10
%102 = load i32, i32* %11
%103 = call i32 @dfs(i32 %97, i32 %99, i32 %100, i32 %101, i32 %102, i32 2)
%104 = mul i32 %95, %103
%105 = add i32 %91, %104
%106 = srem i32 %105, 1000000007
store i32 %106, i32* %68
br label %107
107:
%108 = load i32, i32* %9
%109 = icmp ne i32 %108, 0
br i1 %109, label %110, label %127
110:
%111 = load i32, i32* %68
%112 = load i32, i32* %9
%113 = load i32, i32* %12
%114 = call i32 @equal(i32 %113, i32 4)
%115 = sub i32 %112, %114
%116 = load i32, i32* %7
%117 = load i32, i32* %8
%118 = add i32 %117, 1
%119 = load i32, i32* %9
%120 = sub i32 %119, 1
%121 = load i32, i32* %10
%122 = load i32, i32* %11
%123 = call i32 @dfs(i32 %116, i32 %118, i32 %120, i32 %121, i32 %122, i32 3)
%124 = mul i32 %115, %123
%125 = add i32 %111, %124
%126 = srem i32 %125, 1000000007
store i32 %126, i32* %68
br label %127
127:
%128 = load i32, i32* %10
%129 = icmp ne i32 %128, 0
br i1 %129, label %130, label %147
130:
%131 = load i32, i32* %68
%132 = load i32, i32* %10
%133 = load i32, i32* %12
%134 = call i32 @equal(i32 %133, i32 5)
%135 = sub i32 %132, %134
%136 = load i32, i32* %7
%137 = load i32, i32* %8
%138 = load i32, i32* %9
%139 = add i32 %138, 1
%140 = load i32, i32* %10
%141 = sub i32 %140, 1
%142 = load i32, i32* %11
%143 = call i32 @dfs(i32 %136, i32 %137, i32 %139, i32 %141, i32 %142, i32 4)
%144 = mul i32 %135, %143
%145 = add i32 %131, %144
%146 = srem i32 %145, 1000000007
store i32 %146, i32* %68
br label %147
147:
%148 = load i32, i32* %11
%149 = icmp ne i32 %148, 0
br i1 %149, label %150, label %164
150:
%151 = load i32, i32* %68
%152 = load i32, i32* %11
%153 = load i32, i32* %7
%154 = load i32, i32* %8
%155 = load i32, i32* %9
%156 = load i32, i32* %10
%157 = add i32 %156, 1
%158 = load i32, i32* %11
%159 = sub i32 %158, 1
%160 = call i32 @dfs(i32 %153, i32 %154, i32 %155, i32 %157, i32 %159, i32 5)
%161 = mul i32 %152, %160
%162 = add i32 %151, %161
%163 = srem i32 %162, 1000000007
store i32 %163, i32* %68
br label %164
164:
%165 = load i32, i32* %7
%166 = load i32, i32* %8
%167 = load i32, i32* %9
%168 = load i32, i32* %10
%169 = load i32, i32* %11
%170 = load i32, i32* %12
%171 = mul i32 %165, 734832
%172 = add i32 %171, 0
%173 = mul i32 %166, 40824
%174 = add i32 %173, %172
%175 = mul i32 %167, 2268
%176 = add i32 %175, %174
%177 = mul i32 %168, 126
%178 = add i32 %177, %176
%179 = mul i32 %169, 7
%180 = add i32 %179, %178
%181 = add i32 %170, %180
%182 = load i32, i32* %68
%183 = srem i32 %182, 1000000007
%184 = getelementptr[ 13226976 x i32 ],[13226976 x i32 ]* @dp, i32 0, i32 %181
store i32 %183, i32* %184
%185 = load i32, i32* %7
%186 = load i32, i32* %8
%187 = load i32, i32* %9
%188 = load i32, i32* %10
%189 = load i32, i32* %11
%190 = load i32, i32* %12
%191 = mul i32 %185, 734832
%192 = add i32 %191, 0
%193 = mul i32 %186, 40824
%194 = add i32 %193, %192
%195 = mul i32 %187, 2268
%196 = add i32 %195, %194
%197 = mul i32 %188, 126
%198 = add i32 %197, %196
%199 = mul i32 %189, 7
%200 = add i32 %199, %198
%201 = add i32 %190, %200
%202 = getelementptr[ 13226976 x i32 ],[13226976 x i32 ]* @dp, i32 0, i32 %201
%203 = load i32, i32* %202
ret i32 %203
}
define dso_local i32 @main(){
%1 = call i32 @getint()
%2 = alloca i32 
store i32 %1, i32* %2
%3 = alloca i32 
store i32 0, i32* %3
br label %4
4:
%5 = load i32, i32* %3
%6 = icmp slt i32 %5, 18
br i1 %6, label %7, label %68
7:
%8 = alloca i32 
store i32 0, i32* %8
br label %9
9:
%10 = load i32, i32* %8
%11 = icmp slt i32 %10, 18
br i1 %11, label %12, label %65
12:
%13 = alloca i32 
store i32 0, i32* %13
br label %14
14:
%15 = load i32, i32* %13
%16 = icmp slt i32 %15, 18
br i1 %16, label %17, label %62
17:
%18 = alloca i32 
store i32 0, i32* %18
br label %19
19:
%20 = load i32, i32* %18
%21 = icmp slt i32 %20, 18
br i1 %21, label %22, label %59
22:
%23 = alloca i32 
store i32 0, i32* %23
br label %24
24:
%25 = load i32, i32* %23
%26 = icmp slt i32 %25, 18
br i1 %26, label %27, label %56
27:
%28 = alloca i32 
store i32 0, i32* %28
br label %29
29:
%30 = load i32, i32* %28
%31 = icmp slt i32 %30, 7
br i1 %31, label %32, label %53
32:
%33 = load i32, i32* %3
%34 = load i32, i32* %8
%35 = load i32, i32* %13
%36 = load i32, i32* %18
%37 = load i32, i32* %23
%38 = load i32, i32* %28
%39 = mul i32 %33, 734832
%40 = add i32 %39, 0
%41 = mul i32 %34, 40824
%42 = add i32 %41, %40
%43 = mul i32 %35, 2268
%44 = add i32 %43, %42
%45 = mul i32 %36, 126
%46 = add i32 %45, %44
%47 = mul i32 %37, 7
%48 = add i32 %47, %46
%49 = add i32 %38, %48
%50 = getelementptr[ 13226976 x i32 ],[13226976 x i32 ]* @dp, i32 0, i32 %49
store i32 -1, i32* %50
%51 = load i32, i32* %28
%52 = add i32 %51, 1
store i32 %52, i32* %28
br label %29
53:
%54 = load i32, i32* %23
%55 = add i32 %54, 1
store i32 %55, i32* %23
br label %24
56:
%57 = load i32, i32* %18
%58 = add i32 %57, 1
store i32 %58, i32* %18
br label %19
59:
%60 = load i32, i32* %13
%61 = add i32 %60, 1
store i32 %61, i32* %13
br label %14
62:
%63 = load i32, i32* %8
%64 = add i32 %63, 1
store i32 %64, i32* %8
br label %9
65:
%66 = load i32, i32* %3
%67 = add i32 %66, 1
store i32 %67, i32* %3
br label %4
68:
store i32 0, i32* %3
br label %69
69:
%70 = load i32, i32* %3
%71 = load i32, i32* %2
%72 = icmp slt i32 %70, %71
br i1 %72, label %73, label %94
73:
%74 = load i32, i32* %3
%75 = add i32 %74, 0
%76 = call i32 @getint()
%77 = getelementptr[ 200 x i32 ],[200 x i32 ]* @list, i32 0, i32 %75
store i32 %76, i32* %77
%78 = load i32, i32* %3
%79 = add i32 %78, 0
%80 = getelementptr[ 200 x i32 ],[200 x i32 ]* @list, i32 0, i32 %79
%81 = load i32, i32* %80
%82 = add i32 %81, 0
%83 = load i32, i32* %3
%84 = add i32 %83, 0
%85 = getelementptr[ 200 x i32 ],[200 x i32 ]* @list, i32 0, i32 %84
%86 = load i32, i32* %85
%87 = add i32 %86, 0
%88 = getelementptr[ 20 x i32 ],[20 x i32 ]* @cns, i32 0, i32 %87
%89 = load i32, i32* %88
%90 = add i32 %89, 1
%91 = getelementptr[ 20 x i32 ],[20 x i32 ]* @cns, i32 0, i32 %82
store i32 %90, i32* %91
%92 = load i32, i32* %3
%93 = add i32 %92, 1
store i32 %93, i32* %3
br label %69
94:
%95 = getelementptr[ 20 x i32 ],[20 x i32 ]* @cns, i32 0, i32 1
%96 = load i32, i32* %95
%97 = getelementptr[ 20 x i32 ],[20 x i32 ]* @cns, i32 0, i32 2
%98 = load i32, i32* %97
%99 = getelementptr[ 20 x i32 ],[20 x i32 ]* @cns, i32 0, i32 3
%100 = load i32, i32* %99
%101 = getelementptr[ 20 x i32 ],[20 x i32 ]* @cns, i32 0, i32 4
%102 = load i32, i32* %101
%103 = getelementptr[ 20 x i32 ],[20 x i32 ]* @cns, i32 0, i32 5
%104 = load i32, i32* %103
%105 = call i32 @dfs(i32 %96, i32 %98, i32 %100, i32 %102, i32 %104, i32 0)
%106 = alloca i32 
store i32 %105, i32* %106
%107 = load i32, i32* %106
call void @putint(i32 %107)
ret i32 0
}
