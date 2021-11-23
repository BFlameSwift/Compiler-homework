; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = dso_local global [8 x i32] zeroinitializer
@b = dso_local constant [8 x i32] [i32 9, i32 2, i32 3, i32 4, i32 1, i32 5, i32 4, i32 0]
@c = dso_local global [8 x i32] [i32 1, i32 2, i32 3, i32 4, i32 6, i32 3, i32 7, i32 8]
@e = dso_local global [8 x i32] [i32 6, i32 7, i32 4, i32 5, i32 5, i32 6, i32 9, i32 10]
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define dso_local i32 @main() {
  %1 = getelementptr [8 x i32], [8 x i32]* @e, i32 0, i32 0
  %2 = getelementptr i32, i32* %1, i32 0
  %3 = getelementptr [8 x i32], [8 x i32]* @e, i32 0, i32 0
  %4 = getelementptr i32, i32* %3, i32 0
  %5 = load i32, i32* %2
  %6 = load i32, i32* %4
  %7 = add i32 %5, %6
  %8 = getelementptr [8 x i32], [8 x i32]* @e, i32 0, i32 0
  %9 = getelementptr i32, i32* %8, i32 0
  %10 = load i32, i32* %9
  %11 = sub i32 %7, %10
  %12 = getelementptr [8 x i32], [8 x i32]* @a, i32 0, i32 0
  %13 = getelementptr i32, i32* %12, i32 0
  %14 = load i32, i32* %13
  %15 = add i32 %11, %14
  call void @putint(i32 %15)
  %16 = alloca [8 x i32]
  %17 = getelementptr [8 x i32], [8 x i32]* %16, i32 0, i32 0
  %18 = getelementptr i32, i32* %17, i32 0
  store i32 0, i32* %18
  %19 = getelementptr i32, i32* %17, i32 1
  store i32 0, i32* %19
  %20 = getelementptr i32, i32* %17, i32 2
  store i32 0, i32* %20
  %21 = getelementptr i32, i32* %17, i32 3
  store i32 0, i32* %21
  %22 = getelementptr i32, i32* %17, i32 4
  store i32 0, i32* %22
  %23 = getelementptr i32, i32* %17, i32 5
  store i32 0, i32* %23
  %24 = getelementptr i32, i32* %17, i32 6
  store i32 0, i32* %24
  %25 = getelementptr i32, i32* %17, i32 7
  store i32 0, i32* %25
  %26 = alloca [8 x i32]
  %27 = getelementptr [8 x i32], [8 x i32]* %26, i32 0, i32 0
  %28 = getelementptr i32, i32* %27, i32 0
  store i32 1, i32* %28
  %29 = getelementptr i32, i32* %27, i32 1
  store i32 2, i32* %29
  %30 = getelementptr i32, i32* %27, i32 2
  store i32 3, i32* %30
  %31 = getelementptr i32, i32* %27, i32 3
  store i32 4, i32* %31
  %32 = getelementptr i32, i32* %27, i32 4
  store i32 5, i32* %32
  %33 = getelementptr i32, i32* %27, i32 5
  store i32 6, i32* %33
  %34 = getelementptr i32, i32* %27, i32 6
  store i32 7, i32* %34
  %35 = getelementptr i32, i32* %27, i32 7
  store i32 8, i32* %35
  %36 = alloca [8 x i32]
  %37 = getelementptr [8 x i32], [8 x i32]* %36, i32 0, i32 0
  %38 = getelementptr i32, i32* %37, i32 0
  store i32 1, i32* %38
  %39 = getelementptr i32, i32* %37, i32 1
  store i32 2, i32* %39
  %40 = getelementptr i32, i32* %37, i32 2
  store i32 3, i32* %40
  %41 = getelementptr i32, i32* %37, i32 3
  store i32 4, i32* %41
  %42 = getelementptr i32, i32* %37, i32 4
  store i32 5, i32* %42
  %43 = getelementptr i32, i32* %37, i32 5
  store i32 6, i32* %43
  %44 = getelementptr i32, i32* %37, i32 6
  store i32 7, i32* %44
  %45 = getelementptr i32, i32* %37, i32 7
  store i32 8, i32* %45
  call void @putch(i32 10)
  %46 = getelementptr [8 x i32], [8 x i32]* @b, i32 0, i32 0
  %47 = getelementptr i32, i32* %46, i32 0
  %48 = getelementptr [8 x i32], [8 x i32]* @b, i32 0, i32 0
  %49 = getelementptr i32, i32* %48, i32 0
  %50 = alloca [8 x i32]
  %51 = getelementptr [8 x i32], [8 x i32]* %50, i32 0, i32 0
  %52 = getelementptr i32, i32* %51, i32 0
  %53 = load i32, i32* %47
  store i32 %53, i32* %52
  %54 = getelementptr i32, i32* %51, i32 1
  %55 = load i32, i32* %49
  store i32 %55, i32* %54
  %56 = getelementptr i32, i32* %51, i32 2
  store i32 3, i32* %56
  %57 = getelementptr i32, i32* %51, i32 3
  store i32 4, i32* %57
  %58 = getelementptr i32, i32* %51, i32 4
  store i32 5, i32* %58
  %59 = getelementptr i32, i32* %51, i32 5
  store i32 6, i32* %59
  %60 = getelementptr i32, i32* %51, i32 6
  store i32 7, i32* %60
  %61 = getelementptr i32, i32* %51, i32 7
  store i32 8, i32* %61
  %62 = getelementptr [8 x i32], [8 x i32]* @e, i32 0, i32 0
  %63 = getelementptr i32, i32* %62, i32 0
  %64 = getelementptr [8 x i32], [8 x i32]* @e, i32 0, i32 0
  %65 = getelementptr i32, i32* %64, i32 0
  %66 = load i32, i32* %63
  %67 = load i32, i32* %65
  %68 = add i32 %66, %67
  %69 = getelementptr [8 x i32], [8 x i32]* @e, i32 0, i32 0
  %70 = getelementptr i32, i32* %69, i32 0
  %71 = load i32, i32* %70
  %72 = add i32 %68, %71
  %73 = getelementptr [8 x i32], [8 x i32]* @a, i32 0, i32 0
  %74 = getelementptr i32, i32* %73, i32 0
  %75 = load i32, i32* %74
  %76 = add i32 %72, %75
  call void @putint(i32 %76)
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
