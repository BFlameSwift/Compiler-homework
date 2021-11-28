; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@n = common dso_local global i32 0, align 4
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define dso_local i32 @swap(i32* %0, i32 %1, i32 %2) {
  %4 = alloca i32*
  store i32* %0, i32** %4
  %5 = alloca i32
  store i32 %1, i32* %5
  %6 = alloca i32
  store i32 %2, i32* %6
  %7 = alloca i32
  %8 = load i32, i32* %5
  %9 = add i32 %8, 0
  %10 = load i32*, i32** %4
  %11 = getelementptr i32, i32* %10, i32 %9
  %12 = load i32, i32* %11
  store i32 %12, i32* %7
  %13 = load i32, i32* %5
  %14 = add i32 %13, 0
  %15 = load i32, i32* %6
  %16 = add i32 %15, 0
  %17 = load i32*, i32** %4
  %18 = getelementptr i32, i32* %17, i32 %16
  %19 = load i32*, i32** %4
  %20 = getelementptr i32, i32* %19, i32 %14
  %21 = load i32, i32* %18
  store i32 %21, i32* %20
  %22 = load i32, i32* %6
  %23 = add i32 %22, 0
  %24 = load i32, i32* %7
  %25 = load i32*, i32** %4
  %26 = getelementptr i32, i32* %25, i32 %23
  store i32 %24, i32* %26
  ret i32 0
}

define dso_local i32 @heap_ajust(i32* %0, i32 %1, i32 %2) {
  %4 = alloca i32*
  store i32* %0, i32** %4
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

13:                                               ; preds = %61, %3
  %14 = load i32, i32* %9
  %15 = load i32, i32* %6
  %16 = add i32 %15, 1
  %17 = icmp slt i32 %14, %16
  br i1 %17, label %18, label %62

18:                                               ; preds = %13
  %19 = load i32, i32* %9
  %20 = load i32, i32* %6
  %21 = icmp slt i32 %19, %20
  %22 = load i32, i32* %9
  %23 = add i32 %22, 0
  %24 = load i32*, i32** %4
  %25 = getelementptr i32, i32* %24, i32 %23
  %26 = load i32, i32* %9
  %27 = add i32 %26, 1
  %28 = add i32 %27, 0
  %29 = load i32*, i32** %4
  %30 = getelementptr i32, i32* %29, i32 %28
  %31 = load i32, i32* %25
  %32 = load i32, i32* %30
  %33 = icmp slt i32 %31, %32
  %34 = and i1 %21, %33
  br i1 %34, label %35, label %38

35:                                               ; preds = %18
  %36 = load i32, i32* %9
  %37 = add i32 %36, 1
  store i32 %37, i32* %9
  br label %38

38:                                               ; preds = %35, %18
  %39 = load i32, i32* %7
  %40 = add i32 %39, 0
  %41 = load i32*, i32** %4
  %42 = getelementptr i32, i32* %41, i32 %40
  %43 = load i32, i32* %9
  %44 = add i32 %43, 0
  %45 = load i32*, i32** %4
  %46 = getelementptr i32, i32* %45, i32 %44
  %47 = load i32, i32* %42
  %48 = load i32, i32* %46
  %49 = icmp sgt i32 %47, %48
  br i1 %49, label %50, label %52

50:                                               ; preds = %38
  ret i32 0

51:                                               ; No predecessors!
  br label %61

52:                                               ; preds = %38
  %53 = load i32*, i32** %4
  %54 = load i32, i32* %7
  %55 = load i32, i32* %9
  %56 = call i32 @swap(i32* %53, i32 %54, i32 %55)
  store i32 %56, i32* %7
  %57 = load i32, i32* %9
  store i32 %57, i32* %7
  %58 = load i32, i32* %7
  %59 = mul i32 %58, 2
  %60 = add i32 %59, 1
  store i32 %60, i32* %9
  br label %61

61:                                               ; preds = %52, %51
  br label %13

62:                                               ; preds = %13
  ret i32 0
}

define dso_local i32 @heap_sort(i32* %0, i32 %1) {
  %3 = alloca i32*
  store i32* %0, i32** %3
  %4 = alloca i32
  store i32 %1, i32* %4
  %5 = alloca i32
  %6 = alloca i32
  %7 = load i32, i32* %4
  %8 = sdiv i32 %7, 2
  %9 = sub i32 %8, 1
  store i32 %9, i32* %5
  br label %10

10:                                               ; preds = %13, %2
  %11 = load i32, i32* %5
  %12 = icmp sgt i32 %11, -1
  br i1 %12, label %13, label %22

13:                                               ; preds = %10
  %14 = load i32, i32* %4
  %15 = sub i32 %14, 1
  store i32 %15, i32* %6
  %16 = load i32*, i32** %3
  %17 = load i32, i32* %5
  %18 = load i32, i32* %6
  %19 = call i32 @heap_ajust(i32* %16, i32 %17, i32 %18)
  store i32 %19, i32* %6
  %20 = load i32, i32* %5
  %21 = sub i32 %20, 1
  store i32 %21, i32* %5
  br label %10

22:                                               ; preds = %10
  %23 = load i32, i32* %4
  %24 = sub i32 %23, 1
  store i32 %24, i32* %5
  br label %25

25:                                               ; preds = %28, %22
  %26 = load i32, i32* %5
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %28, label %42

28:                                               ; preds = %25
  %29 = alloca i32
  store i32 0, i32* %29
  %30 = load i32*, i32** %3
  %31 = load i32, i32* %29
  %32 = load i32, i32* %5
  %33 = call i32 @swap(i32* %30, i32 %31, i32 %32)
  store i32 %33, i32* %6
  %34 = load i32, i32* %5
  %35 = sub i32 %34, 1
  store i32 %35, i32* %6
  %36 = load i32*, i32** %3
  %37 = load i32, i32* %29
  %38 = load i32, i32* %6
  %39 = call i32 @heap_ajust(i32* %36, i32 %37, i32 %38)
  store i32 %39, i32* %6
  %40 = load i32, i32* %5
  %41 = sub i32 %40, 1
  store i32 %41, i32* %5
  br label %25

42:                                               ; preds = %25
  ret i32 0
}

define dso_local i32 @main() {
  %1 = alloca [10 x i32]
  %2 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i32 0
  %3 = call i32 @getarray(i32* %2)
  store i32 %3, i32* @n
  %4 = alloca i32
  store i32 0, i32* %4
  %5 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i32 0
  %6 = load i32, i32* @n
  %7 = call i32 @heap_sort(i32* %5, i32 %6)
  store i32 %7, i32* %4
  %8 = load i32, i32* @n
  %9 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i32 0
  call void @putarray(i32 %8, i32* %9)
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
