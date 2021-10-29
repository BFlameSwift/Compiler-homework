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
  %19 = load i32, i32* %5, align 4
  %20 = load i32, i32* %6, align 4
  %21 = srem i32 %19, %20
  %22 = add nsw i32 %18, %21
  ret i32 %22
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
ret i32 %-99997
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = load i32, i32* %2
ret i32 %%2
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = load i32, i32* %2
ret i32 %2
}
define dso_local i32
@main
()
{
ret i32 3
}
define dso_local i32
@main
()
{
ret i32 -99995
}
define dso_local i32
@main
()
{
ret i32 -99995
}
define dso_local i32
@main
()
{
ret i32 -99995
}
define dso_local i32
@main
()
{
ret i32 -99995
}
define dso_local i32
@main
()
{
ret i32 -99995
}
define dso_local i32
@main
()
{
ret i32 5
}
define dso_local i32
@main
()
{
ret i32 5
}
define dso_local i32
@main
()
{
ret i32 2
}
define dso_local i32
@main
()
{
ret i32 1
}
define dso_local i32
@main
()
{
ret i32 1
}
define dso_local i32
@main
()
{
%-99993 = sub i32 %-99995, %-99994
%-99992 = sdiv i32 %-99996, %-99995
%-99991 = mul i32 %-99997, %-99992
%-99990 = add i32 1, %-99991
ret i32 1
}
define dso_local i32
@main
()
{
%-99993 = sub i32 %-99995, %-99994
%-99992 = sdiv i32 %-99996, %-99995
%-99991 = mul i32 %-99997, %-99992
%-99990 = add i32 1, %-99991
ret i32 1
}
define dso_local i32
@main
()
{
ret i32 1
}
define dso_local i32
@main
()
{
ret i32 7
}
define dso_local i32
@main
()
{
ret i32 7
}
