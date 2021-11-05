; ModuleID = './test/main.c'
source_filename = "./test/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 1, i32* %2, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %6, label %48

6:                                                ; preds = %0
  store i32 0, i32* %3, align 4
  %7 = load i32, i32* %2, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %2, align 4
  %9 = load i32, i32* %3, align 4
  %10 = load i32, i32* %2, align 4
  %11 = add nsw i32 %9, %10
  store i32 %11, i32* %3, align 4
  %12 = load i32, i32* %2, align 4
  %13 = icmp eq i32 %12, 2
  br i1 %13, label %14, label %47

14:                                               ; preds = %6
  %15 = load i32, i32* %2, align 4
  %16 = add nsw i32 %15, 2
  store i32 %16, i32* %2, align 4
  %17 = load i32, i32* %3, align 4
  %18 = load i32, i32* %2, align 4
  %19 = sub nsw i32 %17, %18
  store i32 %19, i32* %3, align 4
  %20 = load i32, i32* %2, align 4
  %21 = icmp eq i32 %20, 4
  br i1 %21, label %22, label %46

22:                                               ; preds = %14
  %23 = load i32, i32* %2, align 4
  %24 = add nsw i32 %23, 4
  store i32 %24, i32* %2, align 4
  %25 = load i32, i32* %3, align 4
  %26 = load i32, i32* %2, align 4
  %27 = add nsw i32 %25, %26
  store i32 %27, i32* %3, align 4
  %28 = load i32, i32* %2, align 4
  %29 = icmp ne i32 %28, 8
  br i1 %29, label %30, label %45

30:                                               ; preds = %22
  %31 = load i32, i32* %2, align 4
  %32 = add nsw i32 %31, 8
  store i32 %32, i32* %2, align 4
  %33 = load i32, i32* %3, align 4
  %34 = load i32, i32* %2, align 4
  %35 = sub nsw i32 %33, %34
  store i32 %35, i32* %3, align 4
  %36 = load i32, i32* %2, align 4
  %37 = icmp eq i32 %36, 16
  br i1 %37, label %38, label %44

38:                                               ; preds = %30
  %39 = load i32, i32* %2, align 4
  %40 = add nsw i32 %39, 16
  store i32 %40, i32* %2, align 4
  %41 = load i32, i32* %3, align 4
  %42 = load i32, i32* %2, align 4
  %43 = add nsw i32 %41, %42
  store i32 %43, i32* %3, align 4
  br label %44

44:                                               ; preds = %38, %30
  br label %45

45:                                               ; preds = %44, %22
  br label %46

46:                                               ; preds = %45, %14
  br label %47

47:                                               ; preds = %46, %6
  br label %48

48:                                               ; preds = %47, %0
  %49 = load i32, i32* %2, align 4
  %50 = call i32 (i32, ...) bitcast (i32 (...)* @putint to i32 (i32, ...)*)(i32 %49)
  %51 = load i32, i32* %3, align 4
  %52 = call i32 (i32, ...) bitcast (i32 (...)* @putint to i32 (i32, ...)*)(i32 %51)
  ret i32 0
}

declare dso_local i32 @putint(...) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
