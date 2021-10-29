; ModuleID = './lab03/main.c'
source_filename = "./lab03/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 8, i32* %2, align 4
  store i32 456, i32* %3, align 4
  store i32 8456, i32* %4, align 4
  %7 = load i32, i32* %4, align 4
  %8 = load i32, i32* %3, align 4
  %9 = sub nsw i32 %7, %8
  %10 = sdiv i32 %9, 1000
  %11 = sub nsw i32 %10, 8
  store i32 %11, i32* %5, align 4
  store i32 2, i32* %6, align 4
  %12 = load i32, i32* %5, align 4
  %13 = load i32, i32* %6, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, i32* %5, align 4
  %15 = load i32, i32* %5, align 4
  %16 = load i32, i32* %6, align 4
  %17 = sub nsw i32 %15, %16
  %18 = add nsw i32 %17, 0
  ret i32 %18
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 -1239032, 456
%7 = sdiv i32 -1239488, 1000
%8 = load i32, i32* %0
%9 = sub i32 -1239, 8
store i32 %3, i32* %3
%10 = alloca i32
%11 = load i32, i32* %3
%12 = load i32, i32* %10
%13 = sub i32 -1247, -1239032
%14 = add i32 1237785, 0
ret i32 %14
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 -1239032, 456
%7 = sdiv i32 -1239488, 1000
%8 = load i32, i32* %0
%9 = sub i32 -1239, 8
store i32 %3, i32* %3
%10 = alloca i32
%11 = load i32, i32* %3
%12 = load i32, i32* %10
%13 = sub i32 -1247, -1239032
%14 = add i32 1237785, 0
ret i32 %14
}
define dso_local i32
@main
()
{
%1 = alloca i32
%2 = sub i32 123, 122
store i32 %1, i32* %1
%3 = load i32, i32* %1
ret i32 %3
}
define dso_local i32
@main
()
{
%1 = alloca i32
%2 = sub i32 123, 122
store i32 %2, i32* %1
%3 = load i32, i32* %1
ret i32 %3
}
define dso_local i32
@main
()
{
%1 = alloca i32
%2 = sub i32 123, 122
store i32 %2, i32* %1
%3 = load i32, i32* %1
ret i32 %3
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 -1239032, 456
%7 = sdiv i32 -1239488, 1000
%8 = load i32, i32* %0
%9 = sub i32 -1239, 8
store i32 %9, i32* %3
%10 = alloca i32
%11 = load i32, i32* %3
%12 = load i32, i32* %10
%13 = sub i32 -1247, -1239032
%14 = add i32 1237785, 0
ret i32 %14
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 -1239032, 456
%7 = sdiv i32 -1239488, 1000
%8 = load i32, i32* %0
%9 = sub i32 -1239, 8
store i32 %9, i32* %3
%10 = alloca i32
%11 = load i32, i32* %3
%12 = load i32, i32* %10
%13 = sub i32 -1247, -1239032
%14 = add i32 1237785, 0
ret i32 %14
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 -1239032, 456
%7 = sdiv i32 -1239488, 1000
%8 = load i32, i32* %0
%9 = sub i32 -1239, 8
store i32 %9, i32* %3
%10 = alloca i32
%11 = load i32, i32* %3
%12 = load i32, i32* %10
%13 = sub i32 -1247, -1239032
%14 = add i32 1237785, 0
ret i32 %14
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
in stmt
in stmt
in stmt
in stmt
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 -1239032, 456
%7 = sdiv i32 -1239488, 1000
%8 = load i32, i32* %0
%9 = sub i32 -1239, 8
store i32 %9, i32* %3
%10 = alloca i32
in stmt
in stmt
in stmt
in stmt
in stmt
in stmt
in stmt
in stmt
in stmt
in stmt
in stmt
%11 = load i32, i32* %3
%12 = load i32, i32* %10
%13 = sub i32 -1247, -1239032
%14 = add i32 1237785, 0
ret i32 %14
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 -1239032, 456
%7 = sdiv i32 -1239488, 1000
%8 = load i32, i32* %0
%9 = sub i32 -1239, 8
store i32 %9, i32* %3
%10 = alloca i32
%11 = load i32, i32* %3
%12 = load i32, i32* %10
%13 = sub i32 -1247, -1239032
%14 = add i32 1237785, 0
ret i32 %14
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = load i32, i32* %1
ret i32 %2
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
store i32 %2, i32* %2
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 8456, 456
%7 = sdiv i32 8000, 1000
%8 = load i32, i32* %0
%9 = sub i32 8, 8
store i32 %9, i32* %3
%10 = alloca i32
store i32 %10, i32* %10
%11 = load i32, i32* %3
%12 = load i32, i32* %10
%13 = add i32 0, 2
store i32 %13, i32* %3
%14 = load i32, i32* %3
%15 = load i32, i32* %10
%16 = sub i32 2, 2
%17 = add i32 0, 0
ret i32 %17
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
store i32 %2, i32* %2
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 8456, 456
%7 = sdiv i32 8000, 1000
%8 = load i32, i32* %0
%9 = sub i32 8, 8
store i32 %9, i32* %3
%10 = alloca i32
store i32 %10, i32* %10
%11 = load i32, i32* %3
%12 = load i32, i32* %10
%13 = add i32 0, 2
store i32 %13, i32* %3
%14 = load i32, i32* %3
%15 = load i32, i32* %10
%16 = sub i32 2, 2
%17 = add i32 0, 0
ret i32 %17
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
store i32 %2, i32* %2
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 8456, 456
%7 = sdiv i32 8000, 1000
%8 = load i32, i32* %0
%9 = sub i32 8, 8
store i32 %9, i32* %3
%10 = alloca i32
store i32 %10, i32* %10
%11 = load i32, i32* %3
%12 = load i32, i32* %10
%13 = add i32 0, 2
store i32 %13, i32* %3
%14 = load i32, i32* %3
%15 = load i32, i32* %10
%16 = sub i32 2, 2
%17 = add i32 0, 0
ret i32 %17
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
store i32 %2, i32* %2
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 8456, 456
%7 = sdiv i32 8000, 1000
%8 = load i32, i32* %0
%9 = sub i32 8, 8
store i32 %9, i32* %3
%10 = alloca i32
store i32 %10, i32* %10
%11 = load i32, i32* %3
%12 = load i32, i32* %10
%13 = add i32 0, 2
store i32 %13, i32* %3
%14 = load i32, i32* %3
%15 = load i32, i32* %10
%16 = sub i32 2, 2
%17 = add i32 0, 0
ret i32 %17
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
store i32 %2, i32* %2
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 8456, 456
%7 = sdiv i32 8000, 1000
%8 = load i32, i32* %0
%9 = sub i32 8, 8
store i32 %9, i32* %3
%10 = alloca i32
store i32 %10, i32* %10
%11 = load i32, i32* %3
%12 = load i32, i32* %10
%13 = add i32 0, 2
store i32 %13, i32* %3
%14 = load i32, i32* %3
%15 = load i32, i32* %10
%16 = sub i32 2, 2
%17 = add i32 0, 0
ret i32 %17
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
store i32 %2, i32* %2
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 8456, 456
%7 = sdiv i32 8000, 1000
%8 = load i32, i32* %0
%9 = sub i32 8, 8
store i32 %9, i32* %3
%10 = alloca i32
store i32 %10, i32* %10
%11 = load i32, i32* %3
%12 = load i32, i32* %10
%13 = add i32 0, 2
store i32 %13, i32* %3
%14 = load i32, i32* %3
%15 = load i32, i32* %10
%16 = sub i32 2, 2
%17 = add i32 0, 0
ret i32 %17
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
store i32 %2, i32* %2
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 8456, 456
%7 = sdiv i32 8000, 1000
%8 = sub i32 8, 8
store i32 %8, i32* %3
%9 = alloca i32
store i32 %9, i32* %9
%10 = load i32, i32* %3
%11 = load i32, i32* %9
%12 = add i32 0, 2
store i32 %12, i32* %3
%13 = load i32, i32* %3
%14 = load i32, i32* %9
%15 = sub i32 2, 2
%16 = add i32 0, 0
ret i32 %16
}
