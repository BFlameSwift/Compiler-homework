declare i32 @getint()
declare void @putint(i32)
declare i32 @getch()
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
@TAPE_LEN = dso_local global i32 65536
@BUFFER_LEN = dso_local global i32 32768
@tape = dso_local global [65536 x i32] zeroinitializer
@program = dso_local global [32768 x i32] zeroinitializer
@ptr = dso_local global i32 0
define dso_local i32
@main
(
)
{
%1 = alloca i32
%2 = add i32 0, 0
store i32 %2, i32 *%1
%3 = alloca i32
%4 = call i32 @getint()
store i32 %4, i32 *%3
br label %pym1
pym1:
%5 = load i32, i32 *%1
%6 = load i32, i32 *%3
%7 = icmp slt i32 %5, %6
br i1 %7,label %pym2, label %pym3
pym2:
%8 = load i32, i32 *%1
%9 = mul i32 %8, 1
%10 = add i32 0, %9
%11 = getelementptr [32768 x i32], [32768 x i32] *@program, i32 0, i32 %10
%12 = call i32 @getch()
store i32 %12, i32 *%11
%13 = load i32, i32 *%1
%14 = add i32 0, 1
%15 = add i32 %13, %14
store i32 %15, i32 *%1
br label %pym1
pym3:
%16 = load i32, i32 *%1
%17 = mul i32 %16, 1
%18 = add i32 0, %17
%19 = getelementptr [32768 x i32], [32768 x i32] *@program, i32 0, i32 %18
%20 = add i32 0, 0
store i32 %20, i32 *%19
%21 = alloca i32
%22 = alloca i32
%23 = add i32 0, 0
store i32 %23, i32 *%1
br label %pym4
pym4:
%24 = load i32, i32 *%1
%25 = mul i32 %24, 1
%26 = add i32 0, %25
%27 = getelementptr [32768 x i32], [32768 x i32] *@program, i32 0, i32 %26
%28 = load i32, i32 *%27
%29 = icmp ne i32 %28, 0
br i1 %29,label %pym5, label %pym6
pym5:
%30 = load i32, i32 *%1
%31 = mul i32 %30, 1
%32 = add i32 0, %31
%33 = getelementptr [32768 x i32], [32768 x i32] *@program, i32 0, i32 %32
%34 = load i32, i32 *%33
store i32 %34, i32 *%21
%35 = load i32, i32 *%21
%36 = add i32 0, 62
%37 = icmp eq i32 %35, %36
br i1 %37,label %pym8, label %pym9
pym8:
%38 = load i32, i32 *@ptr
%39 = add i32 0, 1
%40 = add i32 %38, %39
store i32 %40, i32 *@ptr
br label %pym7
pym9:
%41 = load i32, i32 *%21
%42 = add i32 0, 60
%43 = icmp eq i32 %41, %42
br i1 %43,label %pym10, label %pym11
pym10:
%44 = load i32, i32 *@ptr
%45 = add i32 0, 1
%46 = sub i32 %44, %45
store i32 %46, i32 *@ptr
br label %pym7
pym11:
%47 = load i32, i32 *%21
%48 = add i32 0, 43
%49 = icmp eq i32 %47, %48
br i1 %49,label %pym12, label %pym13
pym12:
%50 = load i32, i32 *@ptr
%51 = mul i32 %50, 1
%52 = add i32 0, %51
%53 = getelementptr [65536 x i32], [65536 x i32] *@tape, i32 0, i32 %52
%54 = load i32, i32 *@ptr
%55 = mul i32 %54, 1
%56 = add i32 0, %55
%57 = getelementptr [65536 x i32], [65536 x i32] *@tape, i32 0, i32 %56
%58 = load i32, i32 *%57
%59 = add i32 0, 1
%60 = add i32 %58, %59
store i32 %60, i32 *%53
br label %pym7
pym13:
%61 = load i32, i32 *%21
%62 = add i32 0, 45
%63 = icmp eq i32 %61, %62
br i1 %63,label %pym14, label %pym15
pym14:
%64 = load i32, i32 *@ptr
%65 = mul i32 %64, 1
%66 = add i32 0, %65
%67 = getelementptr [65536 x i32], [65536 x i32] *@tape, i32 0, i32 %66
%68 = load i32, i32 *@ptr
%69 = mul i32 %68, 1
%70 = add i32 0, %69
%71 = getelementptr [65536 x i32], [65536 x i32] *@tape, i32 0, i32 %70
%72 = load i32, i32 *%71
%73 = add i32 0, 1
%74 = sub i32 %72, %73
store i32 %74, i32 *%67
br label %pym7
pym15:
%75 = load i32, i32 *%21
%76 = add i32 0, 46
%77 = icmp eq i32 %75, %76
br i1 %77,label %pym16, label %pym17
pym16:
%78 = load i32, i32 *@ptr
%79 = mul i32 %78, 1
%80 = add i32 0, %79
%81 = getelementptr [65536 x i32], [65536 x i32] *@tape, i32 0, i32 %80
%82 = load i32, i32 *%81
call void @putch(i32 %82)
br label %pym7
pym17:
%83 = load i32, i32 *%21
%84 = add i32 0, 44
%85 = icmp eq i32 %83, %84
br i1 %85,label %pym18, label %pym19
pym18:
%86 = load i32, i32 *@ptr
%87 = mul i32 %86, 1
%88 = add i32 0, %87
%89 = getelementptr [65536 x i32], [65536 x i32] *@tape, i32 0, i32 %88
%90 = call i32 @getch()
store i32 %90, i32 *%89
br label %pym7
pym19:
%91 = load i32, i32 *%21
%92 = add i32 0, 93
%93 = icmp eq i32 %91, %92
%94 = load i32, i32 *@ptr
%95 = mul i32 %94, 1
%96 = add i32 0, %95
%97 = getelementptr [65536 x i32], [65536 x i32] *@tape, i32 0, i32 %96
%98 = load i32, i32 *%97
%99 = icmp ne i32 %98, 0
%100 = and i1 %93, %99
br i1 %100,label %pym20, label %pym21
pym20:
%101 = add i32 0, 1
store i32 %101, i32 *%22
br label %pym22
pym22:
%102 = load i32, i32 *%22
%103 = add i32 0, 0
%104 = icmp sgt i32 %102, %103
br i1 %104,label %pym23, label %pym24
pym23:
%105 = load i32, i32 *%1
%106 = add i32 0, 1
%107 = sub i32 %105, %106
store i32 %107, i32 *%1
%108 = load i32, i32 *%1
%109 = mul i32 %108, 1
%110 = add i32 0, %109
%111 = getelementptr [32768 x i32], [32768 x i32] *@program, i32 0, i32 %110
%112 = load i32, i32 *%111
store i32 %112, i32 *%21
%113 = load i32, i32 *%21
%114 = add i32 0, 91
%115 = icmp eq i32 %113, %114
br i1 %115,label %pym26, label %pym27
pym26:
%116 = load i32, i32 *%22
%117 = add i32 0, 1
%118 = sub i32 %116, %117
store i32 %118, i32 *%22
br label %pym25
pym27:
%119 = load i32, i32 *%21
%120 = add i32 0, 93
%121 = icmp eq i32 %119, %120
br i1 %121,label %pym28, label %pym29
pym28:
%122 = load i32, i32 *%22
%123 = add i32 0, 1
%124 = add i32 %122, %123
store i32 %124, i32 *%22
br label %pym25
pym29:
br label %pym25
pym25:
br label %pym22
pym24:
br label %pym7
pym21:
br label %pym7
pym7:
%125 = load i32, i32 *%1
%126 = add i32 0, 1
%127 = add i32 %125, %126
store i32 %127, i32 *%1
br label %pym4
pym6:
%128 = add i32 0, 0
ret i32 %128
}