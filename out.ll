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
  %3 = alloca i32
  %4 = alloca i32
  %5 = alloca i32
  %6 = alloca i32
  %7 = alloca i32
  %8 = alloca i32
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
  %33 = call i32 @getint()
  store i32 %33, i32* %32
  %34 = load i32, i32* %32
  %35 = load i32, i32* %32
  %36 = add i32 %35, 1
  store i32 %36, i32* %32
  store i32 0, i32* %2
  %37 = load i32, i32* %2
  %38 = load i32, i32* %2
  %39 = add i32 %38, 1
  store i32 %39, i32* %3
  %40 = load i32, i32* %3
  %41 = load i32, i32* %3
  %42 = add i32 %41, 1
  store i32 %42, i32* %4
  %43 = load i32, i32* %4
  %44 = load i32, i32* %4
  %45 = add i32 %44, 1
  store i32 %45, i32* %5
  %46 = load i32, i32* %5
  %47 = load i32, i32* %5
  %48 = add i32 %47, 1
  store i32 %48, i32* %6
  %49 = load i32, i32* %6
  %50 = load i32, i32* %6
  %51 = add i32 %50, 1
  store i32 %51, i32* %7
  %52 = load i32, i32* %7
  %53 = load i32, i32* %7
  %54 = add i32 %53, 1
  store i32 %54, i32* %8
  %55 = load i32, i32* %8
  %56 = load i32, i32* %8
  %57 = add i32 %56, 1
  store i32 %57, i32* %9
  %58 = load i32, i32* %9
  %59 = load i32, i32* %9
  %60 = add i32 %59, 1
  store i32 %60, i32* %10
  %61 = load i32, i32* %10
  %62 = load i32, i32* %10
  %63 = add i32 %62, 1
  store i32 %63, i32* %11
  %64 = load i32, i32* %11
  %65 = load i32, i32* %11
  %66 = add i32 %65, 1
  store i32 %66, i32* %12
  %67 = load i32, i32* %12
  %68 = load i32, i32* %12
  %69 = add i32 %68, 1
  store i32 %69, i32* %13
  %70 = load i32, i32* %13
  %71 = load i32, i32* %13
  %72 = add i32 %71, 1
  store i32 %72, i32* %14
  %73 = load i32, i32* %14
  %74 = load i32, i32* %14
  %75 = add i32 %74, 1
  store i32 %75, i32* %15
  %76 = load i32, i32* %15
  %77 = load i32, i32* %15
  %78 = add i32 %77, 1
  store i32 %78, i32* %16
  %79 = load i32, i32* %16
  %80 = load i32, i32* %16
  %81 = add i32 %80, 1
  store i32 %81, i32* %17
  %82 = load i32, i32* %17
  %83 = load i32, i32* %17
  %84 = add i32 %83, 1
  store i32 %84, i32* %18
  %85 = load i32, i32* %18
  %86 = load i32, i32* %18
  %87 = add i32 %86, 1
  store i32 %87, i32* %19
  %88 = load i32, i32* %19
  %89 = load i32, i32* %19
  %90 = add i32 %89, 1
  store i32 %90, i32* %20
  %91 = load i32, i32* %20
  %92 = load i32, i32* %20
  %93 = add i32 %92, 1
  store i32 %93, i32* %21
  %94 = load i32, i32* %21
  %95 = load i32, i32* %21
  %96 = add i32 %95, 1
  store i32 %96, i32* %22
  %97 = load i32, i32* %22
  %98 = load i32, i32* %22
  %99 = add i32 %98, 1
  store i32 %99, i32* %23
  %100 = load i32, i32* %23
  %101 = load i32, i32* %23
  %102 = add i32 %101, 1
  store i32 %102, i32* %24
  %103 = load i32, i32* %24
  %104 = load i32, i32* %24
  %105 = add i32 %104, 1
  store i32 %105, i32* %25
  %106 = load i32, i32* %25
  %107 = load i32, i32* %25
  %108 = add i32 %107, 1
  store i32 %108, i32* %26
  %109 = load i32, i32* %26
  %110 = load i32, i32* %26
  %111 = add i32 %110, 1
  store i32 %111, i32* %27
  %112 = load i32, i32* %27
  %113 = load i32, i32* %27
  %114 = add i32 %113, 1
  store i32 %114, i32* %28
  %115 = load i32, i32* %28
  %116 = load i32, i32* %28
  %117 = add i32 %116, 1
  store i32 %117, i32* %29
  %118 = load i32, i32* %29
  %119 = load i32, i32* %29
  %120 = add i32 %119, 1
  store i32 %120, i32* %30
  %121 = load i32, i32* %30
  %122 = load i32, i32* %30
  %123 = add i32 %122, 1
  store i32 %123, i32* %31
  %124 = alloca i32
  %125 = load i32, i32* %2
  %126 = load i32, i32* %2
  call void @putint(i32 %126)
  %127 = load i32, i32* %3
  %128 = load i32, i32* %3
  call void @putint(i32 %128)
  %129 = load i32, i32* %4
  %130 = load i32, i32* %4
  call void @putint(i32 %130)
  %131 = load i32, i32* %5
  %132 = load i32, i32* %5
  call void @putint(i32 %132)
  %133 = load i32, i32* %6
  %134 = load i32, i32* %6
  call void @putint(i32 %134)
  %135 = load i32, i32* %7
  %136 = load i32, i32* %7
  call void @putint(i32 %136)
  %137 = load i32, i32* %8
  %138 = load i32, i32* %8
  call void @putint(i32 %138)
  %139 = load i32, i32* %9
  %140 = load i32, i32* %9
  call void @putint(i32 %140)
  %141 = load i32, i32* %10
  %142 = load i32, i32* %10
  call void @putint(i32 %142)
  %143 = load i32, i32* %11
  %144 = load i32, i32* %11
  call void @putint(i32 %144)
  %145 = load i32, i32* %12
  %146 = load i32, i32* %12
  call void @putint(i32 %146)
  %147 = load i32, i32* %13
  %148 = load i32, i32* %13
  call void @putint(i32 %148)
  %149 = load i32, i32* %14
  %150 = load i32, i32* %14
  call void @putint(i32 %150)
  %151 = load i32, i32* %15
  %152 = load i32, i32* %15
  call void @putint(i32 %152)
  %153 = load i32, i32* %16
  %154 = load i32, i32* %16
  call void @putint(i32 %154)
  %155 = load i32, i32* %17
  %156 = load i32, i32* %17
  call void @putint(i32 %156)
  %157 = load i32, i32* %18
  %158 = load i32, i32* %18
  call void @putint(i32 %158)
  %159 = load i32, i32* %19
  %160 = load i32, i32* %19
  call void @putint(i32 %160)
  %161 = load i32, i32* %20
  %162 = load i32, i32* %20
  call void @putint(i32 %162)
  %163 = load i32, i32* %21
  %164 = load i32, i32* %21
  call void @putint(i32 %164)
  %165 = load i32, i32* %22
  %166 = load i32, i32* %22
  call void @putint(i32 %166)
  %167 = load i32, i32* %23
  %168 = load i32, i32* %23
  call void @putint(i32 %168)
  %169 = load i32, i32* %24
  %170 = load i32, i32* %24
  call void @putint(i32 %170)
  %171 = load i32, i32* %25
  %172 = load i32, i32* %25
  call void @putint(i32 %172)
  %173 = load i32, i32* %26
  %174 = load i32, i32* %26
  call void @putint(i32 %174)
  %175 = load i32, i32* %27
  %176 = load i32, i32* %27
  call void @putint(i32 %176)
  %177 = load i32, i32* %28
  %178 = load i32, i32* %28
  call void @putint(i32 %178)
  %179 = load i32, i32* %29
  %180 = load i32, i32* %29
  call void @putint(i32 %180)
  %181 = load i32, i32* %30
  %182 = load i32, i32* %30
  call void @putint(i32 %182)
  %183 = load i32, i32* %31
  %184 = load i32, i32* %31
  call void @putint(i32 %184)
  %185 = alloca i32
  store i32 10, i32* %185
  %186 = load i32, i32* %185
  %187 = load i32, i32* %185
  call void @putch(i32 %187)
  %188 = load i32, i32* %32
  %189 = load i32, i32* %32
  call void @putint(i32 %189)
  %190 = load i32, i32* %185
  %191 = load i32, i32* %185
  call void @putch(i32 %191)
  %192 = load i32, i32* %27
  %193 = load i32, i32* %27
  call void @putint(i32 %193)
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
