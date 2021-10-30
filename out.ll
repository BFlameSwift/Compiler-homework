; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define dso_local i32 @main() {
  %1 = alloca i32
  %2 = alloca i32
  store i32 1, i32* %1
  %3 = load i32, i32* %1
  %4 = add i32 %3, 18
  store i32 %4, i32* %2
  %5 = alloca i32
  %6 = load i32, i32* %1
  %7 = load i32, i32* %2
  %8 = add i32 %6, %7
  store i32 %8, i32* %5
  %9 = alloca i32
  %10 = alloca i32
  %11 = alloca i32
  %12 = alloca i32
  %13 = alloca i32
  %14 = alloca i32
  %15 = alloca i32
  %16 = alloca i32
  %17 = alloca i32
  %18 = alloca i32
  %19 = alloca i32
  %20 = alloca i32
  %21 = alloca i32
  %22 = alloca i32
  %23 = alloca i32
  %24 = alloca i32
  %25 = alloca i32
  %26 = alloca i32
  %27 = alloca i32
  %28 = alloca i32
  %29 = alloca i32
  %30 = alloca i32
  %31 = alloca i32
  %32 = alloca i32
  %33 = alloca i32
  %34 = alloca i32
  %35 = alloca i32
  %36 = alloca i32
  %37 = alloca i32
  %38 = alloca i32
  %39 = alloca i32
  %40 = alloca i32
  %41 = alloca i32
  %42 = alloca i32
  %43 = alloca i32
  %44 = alloca i32
  store i32 1, i32* %9
  store i32 2, i32* %10
  store i32 3, i32* %11
  store i32 4, i32* %12
  %45 = load i32, i32* %9
  %46 = add i32 1, %45
  store i32 %46, i32* %13
  %47 = load i32, i32* %10
  %48 = add i32 2, %47
  store i32 %48, i32* %14
  %49 = load i32, i32* %11
  %50 = add i32 3, %49
  store i32 %50, i32* %15
  %51 = load i32, i32* %12
  %52 = add i32 4, %51
  store i32 %52, i32* %16
  %53 = load i32, i32* %13
  %54 = add i32 1, %53
  store i32 %54, i32* %17
  %55 = load i32, i32* %14
  %56 = add i32 2, %55
  store i32 %56, i32* %18
  %57 = load i32, i32* %15
  %58 = add i32 3, %57
  store i32 %58, i32* %19
  %59 = load i32, i32* %16
  %60 = add i32 4, %59
  store i32 %60, i32* %20
  %61 = load i32, i32* %17
  %62 = add i32 1, %61
  store i32 %62, i32* %21
  %63 = load i32, i32* %18
  %64 = add i32 2, %63
  store i32 %64, i32* %22
  %65 = load i32, i32* %19
  %66 = add i32 3, %65
  store i32 %66, i32* %23
  %67 = load i32, i32* %20
  %68 = add i32 4, %67
  store i32 %68, i32* %24
  %69 = load i32, i32* %21
  %70 = add i32 1, %69
  store i32 %70, i32* %25
  %71 = load i32, i32* %22
  %72 = add i32 2, %71
  store i32 %72, i32* %26
  %73 = load i32, i32* %23
  %74 = add i32 3, %73
  store i32 %74, i32* %27
  %75 = load i32, i32* %24
  %76 = add i32 4, %75
  store i32 %76, i32* %28
  %77 = load i32, i32* %25
  %78 = add i32 1, %77
  store i32 %78, i32* %29
  %79 = load i32, i32* %26
  %80 = add i32 2, %79
  store i32 %80, i32* %30
  %81 = load i32, i32* %27
  %82 = add i32 3, %81
  store i32 %82, i32* %31
  %83 = load i32, i32* %28
  %84 = add i32 4, %83
  store i32 %84, i32* %32
  %85 = load i32, i32* %29
  %86 = add i32 1, %85
  store i32 %86, i32* %33
  %87 = load i32, i32* %30
  %88 = add i32 2, %87
  store i32 %88, i32* %34
  %89 = load i32, i32* %31
  %90 = add i32 3, %89
  store i32 %90, i32* %35
  %91 = load i32, i32* %32
  %92 = add i32 4, %91
  store i32 %92, i32* %36
  %93 = load i32, i32* %33
  %94 = add i32 1, %93
  store i32 %94, i32* %37
  %95 = load i32, i32* %34
  %96 = add i32 2, %95
  store i32 %96, i32* %38
  %97 = load i32, i32* %35
  %98 = add i32 3, %97
  store i32 %98, i32* %39
  %99 = load i32, i32* %36
  %100 = add i32 4, %99
  store i32 %100, i32* %40
  %101 = load i32, i32* %37
  %102 = add i32 1, %101
  store i32 %102, i32* %41
  %103 = load i32, i32* %38
  %104 = add i32 2, %103
  store i32 %104, i32* %42
  %105 = load i32, i32* %39
  %106 = add i32 3, %105
  store i32 %106, i32* %43
  %107 = load i32, i32* %40
  %108 = add i32 4, %107
  store i32 %108, i32* %44
  %109 = load i32, i32* %1
  %110 = load i32, i32* %2
  %111 = sub i32 %109, %110
  %112 = add i32 %111, 10
  store i32 %112, i32* %5
  %113 = load i32, i32* %37
  %114 = add i32 1, %113
  store i32 %114, i32* %41
  %115 = load i32, i32* %38
  %116 = add i32 2, %115
  store i32 %116, i32* %42
  %117 = load i32, i32* %39
  %118 = add i32 3, %117
  store i32 %118, i32* %43
  %119 = load i32, i32* %40
  %120 = add i32 4, %119
  store i32 %120, i32* %44
  %121 = load i32, i32* %33
  %122 = add i32 1, %121
  store i32 %122, i32* %37
  %123 = load i32, i32* %34
  %124 = add i32 2, %123
  store i32 %124, i32* %38
  %125 = load i32, i32* %35
  %126 = add i32 3, %125
  store i32 %126, i32* %39
  %127 = load i32, i32* %36
  %128 = add i32 4, %127
  store i32 %128, i32* %40
  %129 = load i32, i32* %29
  %130 = add i32 1, %129
  store i32 %130, i32* %33
  %131 = load i32, i32* %30
  %132 = add i32 2, %131
  store i32 %132, i32* %34
  %133 = load i32, i32* %31
  %134 = add i32 3, %133
  store i32 %134, i32* %35
  %135 = load i32, i32* %32
  %136 = add i32 4, %135
  store i32 %136, i32* %36
  %137 = load i32, i32* %25
  %138 = add i32 1, %137
  store i32 %138, i32* %29
  %139 = load i32, i32* %26
  %140 = add i32 2, %139
  store i32 %140, i32* %30
  %141 = load i32, i32* %27
  %142 = add i32 3, %141
  store i32 %142, i32* %31
  %143 = load i32, i32* %28
  %144 = add i32 4, %143
  store i32 %144, i32* %32
  %145 = load i32, i32* %21
  %146 = add i32 1, %145
  store i32 %146, i32* %25
  %147 = load i32, i32* %22
  %148 = add i32 2, %147
  store i32 %148, i32* %26
  %149 = load i32, i32* %23
  %150 = add i32 3, %149
  store i32 %150, i32* %27
  %151 = load i32, i32* %24
  %152 = add i32 4, %151
  store i32 %152, i32* %28
  %153 = load i32, i32* %17
  %154 = add i32 1, %153
  store i32 %154, i32* %21
  %155 = load i32, i32* %18
  %156 = add i32 2, %155
  store i32 %156, i32* %22
  %157 = load i32, i32* %19
  %158 = add i32 3, %157
  store i32 %158, i32* %23
  %159 = load i32, i32* %20
  %160 = add i32 4, %159
  store i32 %160, i32* %24
  %161 = load i32, i32* %13
  %162 = add i32 1, %161
  store i32 %162, i32* %17
  %163 = load i32, i32* %14
  %164 = add i32 2, %163
  store i32 %164, i32* %18
  %165 = load i32, i32* %15
  %166 = add i32 3, %165
  store i32 %166, i32* %19
  %167 = load i32, i32* %16
  %168 = add i32 4, %167
  store i32 %168, i32* %20
  %169 = load i32, i32* %9
  %170 = add i32 1, %169
  store i32 %170, i32* %13
  %171 = load i32, i32* %10
  %172 = add i32 2, %171
  store i32 %172, i32* %14
  %173 = load i32, i32* %11
  %174 = add i32 3, %173
  store i32 %174, i32* %15
  %175 = load i32, i32* %12
  %176 = add i32 4, %175
  store i32 %176, i32* %16
  %177 = load i32, i32* %41
  %178 = add i32 1, %177
  store i32 %178, i32* %9
  %179 = load i32, i32* %42
  %180 = add i32 2, %179
  store i32 %180, i32* %10
  %181 = load i32, i32* %43
  %182 = add i32 3, %181
  store i32 %182, i32* %11
  %183 = load i32, i32* %44
  %184 = add i32 4, %183
  store i32 %184, i32* %12
  %185 = load i32, i32* %5
  %186 = load i32, i32* %9
  %187 = add i32 %185, %186
  %188 = load i32, i32* %10
  %189 = add i32 %187, %188
  %190 = load i32, i32* %11
  %191 = add i32 %189, %190
  %192 = load i32, i32* %12
  %193 = add i32 %191, %192
  %194 = load i32, i32* %13
  %195 = sub i32 %193, %194
  %196 = load i32, i32* %14
  %197 = sub i32 %195, %196
  %198 = load i32, i32* %15
  %199 = sub i32 %197, %198
  %200 = load i32, i32* %16
  %201 = sub i32 %199, %200
  %202 = load i32, i32* %17
  %203 = add i32 %201, %202
  %204 = load i32, i32* %18
  %205 = add i32 %203, %204
  %206 = load i32, i32* %19
  %207 = add i32 %205, %206
  %208 = load i32, i32* %20
  %209 = add i32 %207, %208
  %210 = load i32, i32* %21
  %211 = sub i32 %209, %210
  %212 = load i32, i32* %22
  %213 = sub i32 %211, %212
  %214 = load i32, i32* %23
  %215 = sub i32 %213, %214
  %216 = load i32, i32* %24
  %217 = sub i32 %215, %216
  %218 = load i32, i32* %25
  %219 = add i32 %217, %218
  %220 = load i32, i32* %26
  %221 = add i32 %219, %220
  %222 = load i32, i32* %27
  %223 = add i32 %221, %222
  %224 = load i32, i32* %28
  %225 = add i32 %223, %224
  %226 = load i32, i32* %29
  %227 = sub i32 %225, %226
  %228 = load i32, i32* %30
  %229 = sub i32 %227, %228
  %230 = load i32, i32* %31
  %231 = sub i32 %229, %230
  %232 = load i32, i32* %32
  %233 = sub i32 %231, %232
  %234 = load i32, i32* %33
  %235 = add i32 %233, %234
  %236 = load i32, i32* %34
  %237 = add i32 %235, %236
  %238 = load i32, i32* %35
  %239 = add i32 %237, %238
  %240 = load i32, i32* %36
  %241 = add i32 %239, %240
  %242 = load i32, i32* %37
  %243 = sub i32 %241, %242
  %244 = load i32, i32* %38
  %245 = sub i32 %243, %244
  %246 = load i32, i32* %39
  %247 = sub i32 %245, %246
  %248 = load i32, i32* %40
  %249 = sub i32 %247, %248
  %250 = load i32, i32* %41
  %251 = add i32 %249, %250
  %252 = load i32, i32* %42
  %253 = add i32 %251, %252
  %254 = load i32, i32* %43
  %255 = add i32 %253, %254
  %256 = load i32, i32* %44
  %257 = add i32 %255, %256
  call void @putint(i32 %257)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getint() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %1)
  %3 = load i32, i32* %1, align 4
  ret i32 %3
}

declare dso_local i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getch() #0 {
  %1 = alloca i8, align 1
  %2 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8* %1)
  %3 = load i8, i8* %1, align 1
  %4 = sext i8 %3 to i32
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getarray(i32* %0) #0 {
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32* %0, i32** %2, align 8
  %5 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %3)
  store i32 0, i32* %4, align 4
  br label %6

6:                                                ; preds = %16, %1
  %7 = load i32, i32* %4, align 4
  %8 = load i32, i32* %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %19

10:                                               ; preds = %6
  %11 = load i32*, i32** %2, align 8
  %12 = load i32, i32* %4, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32* %11, i64 %13
  %15 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %14)
  br label %16

16:                                               ; preds = %10
  %17 = load i32, i32* %4, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %4, align 4
  br label %6

19:                                               ; preds = %6
  %20 = load i32, i32* %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putint(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %3)
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putch(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putarray(i32 %0, i32* %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32* %1, i32** %4, align 8
  %6 = load i32, i32* %3, align 4
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %6)
  store i32 0, i32* %5, align 4
  br label %8

8:                                                ; preds = %19, %2
  %9 = load i32, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %22

12:                                               ; preds = %8
  %13 = load i32*, i32** %4, align 8
  %14 = load i32, i32* %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32* %13, i64 %15
  %17 = load i32, i32* %16, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %17)
  br label %19

19:                                               ; preds = %12
  %20 = load i32, i32* %5, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %5, align 4
  br label %8

22:                                               ; preds = %8
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 10.0.0-4ubuntu1 "}
!1 = !{i32 1, !"wchar_size", i32 4}
