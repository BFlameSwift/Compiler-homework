; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ints = dso_local global [10000 x i32] zeroinitializer
@intt = common dso_local global i32 0, align 4
@chas = dso_local global [10000 x i32] zeroinitializer
@chat = common dso_local global i32 0, align 4
@i = dso_local global i32 0, align 4
@ii = dso_local global i32 1, align 4
@c = common dso_local global i32 0, align 4
@get = dso_local global [10000 x i32] zeroinitializer
@get2 = dso_local global [10000 x i32] zeroinitializer
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define dso_local i32 @isdigit(i32 %0) {
  %2 = alloca i32
  store i32 %0, i32* %2
  %3 = load i32, i32* %2
  %4 = icmp sge i32 %3, 48
  %5 = load i32, i32* %2
  %6 = icmp sle i32 %5, 57
  %7 = and i1 %4, %6
  br i1 %7, label %8, label %10

8:                                                ; preds = %1
  ret i32 1

9:                                                ; No predecessors!
  br label %10

10:                                               ; preds = %9, %1
  ret i32 0
}

define dso_local i32 @power(i32 %0, i32 %1) {
  %3 = alloca i32
  store i32 %0, i32* %3
  %4 = alloca i32
  store i32 %1, i32* %4
  %5 = alloca i32
  store i32 1, i32* %5
  br label %6

6:                                                ; preds = %9, %2
  %7 = load i32, i32* %4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %15

9:                                                ; preds = %6
  %10 = load i32, i32* %5
  %11 = load i32, i32* %3
  %12 = mul i32 %10, %11
  store i32 %12, i32* %5
  %13 = load i32, i32* %4
  %14 = sub i32 %13, 1
  store i32 %14, i32* %4
  br label %6

15:                                               ; preds = %6
  %16 = load i32, i32* %5
  ret i32 %16
}

define dso_local i32 @getstr(i32* %0) {
  %2 = alloca i32*
  store i32* %0, i32** %2
  %3 = call i32 @getch()
  %4 = alloca i32
  store i32 %3, i32* %4
  %5 = alloca i32
  store i32 0, i32* %5
  br label %6

6:                                                ; preds = %12, %1
  %7 = load i32, i32* %4
  %8 = icmp ne i32 %7, 13
  %9 = load i32, i32* %4
  %10 = icmp ne i32 %9, 10
  %11 = and i1 %8, %10
  br i1 %11, label %12, label %21

12:                                               ; preds = %6
  %13 = load i32, i32* %5
  %14 = add i32 %13, 0
  %15 = load i32, i32* %4
  %16 = load i32*, i32** %2
  %17 = getelementptr i32, i32* %16, i32 %14
  store i32 %15, i32* %17
  %18 = load i32, i32* %5
  %19 = add i32 %18, 1
  store i32 %19, i32* %5
  %20 = call i32 @getch()
  store i32 %20, i32* %4
  br label %6

21:                                               ; preds = %6
  %22 = load i32, i32* %5
  ret i32 %22
}

define dso_local void @intpush(i32 %0) {
  %2 = alloca i32
  store i32 %0, i32* %2
  %3 = load i32, i32* @intt
  %4 = add i32 %3, 1
  store i32 %4, i32* @intt
  %5 = load i32, i32* @intt
  %6 = add i32 %5, 0
  %7 = load i32, i32* %2
  %8 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %6
  store i32 %7, i32* %8
  ret void
}

define dso_local void @chapush(i32 %0) {
  %2 = alloca i32
  store i32 %0, i32* %2
  %3 = load i32, i32* @chat
  %4 = add i32 %3, 1
  store i32 %4, i32* @chat
  %5 = load i32, i32* @chat
  %6 = add i32 %5, 0
  %7 = load i32, i32* %2
  %8 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %6
  store i32 %7, i32* %8
  ret void
}

define dso_local i32 @intpop() {
  %1 = load i32, i32* @intt
  %2 = sub i32 %1, 1
  store i32 %2, i32* @intt
  %3 = load i32, i32* @intt
  %4 = add i32 %3, 1
  %5 = add i32 %4, 0
  %6 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %5
  %7 = load i32, i32* %6
  ret i32 %7
}

define dso_local i32 @chapop() {
  %1 = load i32, i32* @chat
  %2 = sub i32 %1, 1
  store i32 %2, i32* @chat
  %3 = load i32, i32* @chat
  %4 = add i32 %3, 1
  %5 = add i32 %4, 0
  %6 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %5
  %7 = load i32, i32* %6
  ret i32 %7
}

define dso_local void @intadd(i32 %0) {
  %2 = alloca i32
  store i32 %0, i32* %2
  %3 = load i32, i32* @intt
  %4 = add i32 %3, 0
  %5 = load i32, i32* @intt
  %6 = add i32 %5, 0
  %7 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %6
  %8 = load i32, i32* %7
  %9 = mul i32 %8, 10
  %10 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %4
  store i32 %9, i32* %10
  %11 = load i32, i32* @intt
  %12 = add i32 %11, 0
  %13 = load i32, i32* @intt
  %14 = add i32 %13, 0
  %15 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %14
  %16 = load i32, i32* %2
  %17 = load i32, i32* %15
  %18 = add i32 %17, %16
  %19 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %12
  store i32 %18, i32* %19
  ret void
}

define dso_local i32 @find() {
  %1 = call i32 @chapop()
  store i32 %1, i32* @c
  %2 = load i32, i32* @ii
  %3 = add i32 %2, 0
  %4 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %3
  store i32 32, i32* %4
  %5 = load i32, i32* @ii
  %6 = add i32 %5, 1
  %7 = add i32 %6, 0
  %8 = load i32, i32* @c
  %9 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %7
  store i32 %8, i32* %9
  %10 = load i32, i32* @ii
  %11 = add i32 %10, 2
  store i32 %11, i32* @ii
  %12 = load i32, i32* @chat
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %0
  ret i32 0

15:                                               ; No predecessors!
  br label %16

16:                                               ; preds = %15, %0
  ret i32 1
}

define dso_local i32 @main() {
  store i32 0, i32* @intt
  store i32 0, i32* @chat
  %1 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 0
  %2 = call i32 @getstr(i32* %1)
  %3 = alloca i32
  store i32 %2, i32* %3
  br label %4

4:                                                ; preds = %283, %0
  %5 = load i32, i32* @i
  %6 = load i32, i32* %3
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %286

8:                                                ; preds = %4
  %9 = load i32, i32* @i
  %10 = add i32 %9, 0
  %11 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %10
  %12 = load i32, i32* %11
  %13 = call i32 @isdigit(i32 %12)
  %14 = icmp eq i32 %13, 1
  br i1 %14, label %15, label %25

15:                                               ; preds = %8
  %16 = load i32, i32* @ii
  %17 = add i32 %16, 0
  %18 = load i32, i32* @i
  %19 = add i32 %18, 0
  %20 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %19
  %21 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %17
  %22 = load i32, i32* %20
  store i32 %22, i32* %21
  %23 = load i32, i32* @ii
  %24 = add i32 %23, 1
  store i32 %24, i32* @ii
  br label %283

25:                                               ; preds = %8
  %26 = load i32, i32* @i
  %27 = add i32 %26, 0
  %28 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %27
  %29 = load i32, i32* %28
  %30 = icmp eq i32 %29, 40
  br i1 %30, label %31, label %32

31:                                               ; preds = %25
  call void @chapush(i32 40)
  br label %32

32:                                               ; preds = %31, %25
  %33 = load i32, i32* @i
  %34 = add i32 %33, 0
  %35 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %34
  %36 = load i32, i32* %35
  %37 = icmp eq i32 %36, 94
  br i1 %37, label %38, label %39

38:                                               ; preds = %32
  call void @chapush(i32 94)
  br label %39

39:                                               ; preds = %38, %32
  %40 = load i32, i32* @i
  %41 = add i32 %40, 0
  %42 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %41
  %43 = load i32, i32* %42
  %44 = icmp eq i32 %43, 41
  br i1 %44, label %45, label %63

45:                                               ; preds = %39
  %46 = call i32 @chapop()
  store i32 %46, i32* @c
  br label %47

47:                                               ; preds = %50, %45
  %48 = load i32, i32* @c
  %49 = icmp ne i32 %48, 40
  br i1 %49, label %50, label %62

50:                                               ; preds = %47
  %51 = load i32, i32* @ii
  %52 = add i32 %51, 0
  %53 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %52
  store i32 32, i32* %53
  %54 = load i32, i32* @ii
  %55 = add i32 %54, 1
  %56 = add i32 %55, 0
  %57 = load i32, i32* @c
  %58 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %56
  store i32 %57, i32* %58
  %59 = load i32, i32* @ii
  %60 = add i32 %59, 2
  store i32 %60, i32* @ii
  %61 = call i32 @chapop()
  store i32 %61, i32* @c
  br label %47

62:                                               ; preds = %47
  br label %63

63:                                               ; preds = %62, %39
  %64 = load i32, i32* @i
  %65 = add i32 %64, 0
  %66 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %65
  %67 = load i32, i32* %66
  %68 = icmp eq i32 %67, 43
  br i1 %68, label %69, label %113

69:                                               ; preds = %63
  br label %70

70:                                               ; preds = %111, %69
  %71 = load i32, i32* @chat
  %72 = add i32 %71, 0
  %73 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %72
  %74 = load i32, i32* %73
  %75 = icmp eq i32 %74, 43
  %76 = load i32, i32* @chat
  %77 = add i32 %76, 0
  %78 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %77
  %79 = load i32, i32* %78
  %80 = icmp eq i32 %79, 45
  %81 = or i1 %75, %80
  %82 = load i32, i32* @chat
  %83 = add i32 %82, 0
  %84 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %83
  %85 = load i32, i32* %84
  %86 = icmp eq i32 %85, 42
  %87 = or i1 %81, %86
  %88 = load i32, i32* @chat
  %89 = add i32 %88, 0
  %90 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %89
  %91 = load i32, i32* %90
  %92 = icmp eq i32 %91, 47
  %93 = or i1 %87, %92
  %94 = load i32, i32* @chat
  %95 = add i32 %94, 0
  %96 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %95
  %97 = load i32, i32* %96
  %98 = icmp eq i32 %97, 37
  %99 = or i1 %93, %98
  %100 = load i32, i32* @chat
  %101 = add i32 %100, 0
  %102 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %101
  %103 = load i32, i32* %102
  %104 = icmp eq i32 %103, 94
  %105 = or i1 %99, %104
  br i1 %105, label %106, label %112

106:                                              ; preds = %70
  %107 = call i32 @find()
  %108 = icmp eq i32 %107, 0
  br i1 %108, label %109, label %111

109:                                              ; preds = %106
  br label %112

110:                                              ; No predecessors!
  br label %111

111:                                              ; preds = %110, %106
  br label %70

112:                                              ; preds = %109, %70
  call void @chapush(i32 43)
  br label %113

113:                                              ; preds = %112, %63
  %114 = load i32, i32* @i
  %115 = add i32 %114, 0
  %116 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %115
  %117 = load i32, i32* %116
  %118 = icmp eq i32 %117, 45
  br i1 %118, label %119, label %163

119:                                              ; preds = %113
  br label %120

120:                                              ; preds = %161, %119
  %121 = load i32, i32* @chat
  %122 = add i32 %121, 0
  %123 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %122
  %124 = load i32, i32* %123
  %125 = icmp eq i32 %124, 43
  %126 = load i32, i32* @chat
  %127 = add i32 %126, 0
  %128 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %127
  %129 = load i32, i32* %128
  %130 = icmp eq i32 %129, 45
  %131 = or i1 %125, %130
  %132 = load i32, i32* @chat
  %133 = add i32 %132, 0
  %134 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %133
  %135 = load i32, i32* %134
  %136 = icmp eq i32 %135, 42
  %137 = or i1 %131, %136
  %138 = load i32, i32* @chat
  %139 = add i32 %138, 0
  %140 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %139
  %141 = load i32, i32* %140
  %142 = icmp eq i32 %141, 47
  %143 = or i1 %137, %142
  %144 = load i32, i32* @chat
  %145 = add i32 %144, 0
  %146 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %145
  %147 = load i32, i32* %146
  %148 = icmp eq i32 %147, 37
  %149 = or i1 %143, %148
  %150 = load i32, i32* @chat
  %151 = add i32 %150, 0
  %152 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %151
  %153 = load i32, i32* %152
  %154 = icmp eq i32 %153, 94
  %155 = or i1 %149, %154
  br i1 %155, label %156, label %162

156:                                              ; preds = %120
  %157 = call i32 @find()
  %158 = icmp eq i32 %157, 0
  br i1 %158, label %159, label %161

159:                                              ; preds = %156
  br label %162

160:                                              ; No predecessors!
  br label %161

161:                                              ; preds = %160, %156
  br label %120

162:                                              ; preds = %159, %120
  call void @chapush(i32 45)
  br label %163

163:                                              ; preds = %162, %113
  %164 = load i32, i32* @i
  %165 = add i32 %164, 0
  %166 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %165
  %167 = load i32, i32* %166
  %168 = icmp eq i32 %167, 42
  br i1 %168, label %169, label %201

169:                                              ; preds = %163
  br label %170

170:                                              ; preds = %199, %169
  %171 = load i32, i32* @chat
  %172 = add i32 %171, 0
  %173 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %172
  %174 = load i32, i32* %173
  %175 = icmp eq i32 %174, 42
  %176 = load i32, i32* @chat
  %177 = add i32 %176, 0
  %178 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %177
  %179 = load i32, i32* %178
  %180 = icmp eq i32 %179, 47
  %181 = or i1 %175, %180
  %182 = load i32, i32* @chat
  %183 = add i32 %182, 0
  %184 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %183
  %185 = load i32, i32* %184
  %186 = icmp eq i32 %185, 37
  %187 = or i1 %181, %186
  %188 = load i32, i32* @chat
  %189 = add i32 %188, 0
  %190 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %189
  %191 = load i32, i32* %190
  %192 = icmp eq i32 %191, 94
  %193 = or i1 %187, %192
  br i1 %193, label %194, label %200

194:                                              ; preds = %170
  %195 = call i32 @find()
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %197, label %199

197:                                              ; preds = %194
  br label %200

198:                                              ; No predecessors!
  br label %199

199:                                              ; preds = %198, %194
  br label %170

200:                                              ; preds = %197, %170
  call void @chapush(i32 42)
  br label %201

201:                                              ; preds = %200, %163
  %202 = load i32, i32* @i
  %203 = add i32 %202, 0
  %204 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %203
  %205 = load i32, i32* %204
  %206 = icmp eq i32 %205, 47
  br i1 %206, label %207, label %239

207:                                              ; preds = %201
  br label %208

208:                                              ; preds = %237, %207
  %209 = load i32, i32* @chat
  %210 = add i32 %209, 0
  %211 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %210
  %212 = load i32, i32* %211
  %213 = icmp eq i32 %212, 42
  %214 = load i32, i32* @chat
  %215 = add i32 %214, 0
  %216 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %215
  %217 = load i32, i32* %216
  %218 = icmp eq i32 %217, 47
  %219 = or i1 %213, %218
  %220 = load i32, i32* @chat
  %221 = add i32 %220, 0
  %222 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %221
  %223 = load i32, i32* %222
  %224 = icmp eq i32 %223, 37
  %225 = or i1 %219, %224
  %226 = load i32, i32* @chat
  %227 = add i32 %226, 0
  %228 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %227
  %229 = load i32, i32* %228
  %230 = icmp eq i32 %229, 94
  %231 = or i1 %225, %230
  br i1 %231, label %232, label %238

232:                                              ; preds = %208
  %233 = call i32 @find()
  %234 = icmp eq i32 %233, 0
  br i1 %234, label %235, label %237

235:                                              ; preds = %232
  br label %238

236:                                              ; No predecessors!
  br label %237

237:                                              ; preds = %236, %232
  br label %208

238:                                              ; preds = %235, %208
  call void @chapush(i32 47)
  br label %239

239:                                              ; preds = %238, %201
  %240 = load i32, i32* @i
  %241 = add i32 %240, 0
  %242 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %241
  %243 = load i32, i32* %242
  %244 = icmp eq i32 %243, 37
  br i1 %244, label %245, label %277

245:                                              ; preds = %239
  br label %246

246:                                              ; preds = %275, %245
  %247 = load i32, i32* @chat
  %248 = add i32 %247, 0
  %249 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %248
  %250 = load i32, i32* %249
  %251 = icmp eq i32 %250, 42
  %252 = load i32, i32* @chat
  %253 = add i32 %252, 0
  %254 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %253
  %255 = load i32, i32* %254
  %256 = icmp eq i32 %255, 47
  %257 = or i1 %251, %256
  %258 = load i32, i32* @chat
  %259 = add i32 %258, 0
  %260 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %259
  %261 = load i32, i32* %260
  %262 = icmp eq i32 %261, 37
  %263 = or i1 %257, %262
  %264 = load i32, i32* @chat
  %265 = add i32 %264, 0
  %266 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %265
  %267 = load i32, i32* %266
  %268 = icmp eq i32 %267, 94
  %269 = or i1 %263, %268
  br i1 %269, label %270, label %276

270:                                              ; preds = %246
  %271 = call i32 @find()
  %272 = icmp eq i32 %271, 0
  br i1 %272, label %273, label %275

273:                                              ; preds = %270
  br label %276

274:                                              ; No predecessors!
  br label %275

275:                                              ; preds = %274, %270
  br label %246

276:                                              ; preds = %273, %246
  call void @chapush(i32 37)
  br label %277

277:                                              ; preds = %276, %239
  %278 = load i32, i32* @ii
  %279 = add i32 %278, 0
  %280 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %279
  store i32 32, i32* %280
  %281 = load i32, i32* @ii
  %282 = add i32 %281, 1
  store i32 %282, i32* @ii
  br label %283

283:                                              ; preds = %277, %15
  %284 = load i32, i32* @i
  %285 = add i32 %284, 1
  store i32 %285, i32* @i
  br label %4

286:                                              ; preds = %4
  br label %287

287:                                              ; preds = %290, %286
  %288 = load i32, i32* @chat
  %289 = icmp sgt i32 %288, 0
  br i1 %289, label %290, label %303

290:                                              ; preds = %287
  %291 = call i32 @chapop()
  %292 = alloca i32
  store i32 %291, i32* %292
  %293 = load i32, i32* @ii
  %294 = add i32 %293, 0
  %295 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %294
  store i32 32, i32* %295
  %296 = load i32, i32* @ii
  %297 = add i32 %296, 1
  %298 = add i32 %297, 0
  %299 = load i32, i32* %292
  %300 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %298
  store i32 %299, i32* %300
  %301 = load i32, i32* @ii
  %302 = add i32 %301, 2
  store i32 %302, i32* @ii
  br label %287

303:                                              ; preds = %287
  %304 = load i32, i32* @ii
  %305 = add i32 %304, 0
  %306 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %305
  store i32 64, i32* %306
  store i32 1, i32* @i
  br label %307

307:                                              ; preds = %452, %303
  %308 = load i32, i32* @i
  %309 = add i32 %308, 0
  %310 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %309
  %311 = load i32, i32* %310
  %312 = icmp ne i32 %311, 64
  br i1 %312, label %313, label %455

313:                                              ; preds = %307
  %314 = load i32, i32* @i
  %315 = add i32 %314, 0
  %316 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %315
  %317 = load i32, i32* %316
  %318 = icmp eq i32 %317, 43
  %319 = load i32, i32* @i
  %320 = add i32 %319, 0
  %321 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %320
  %322 = load i32, i32* %321
  %323 = icmp eq i32 %322, 45
  %324 = or i1 %318, %323
  %325 = load i32, i32* @i
  %326 = add i32 %325, 0
  %327 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %326
  %328 = load i32, i32* %327
  %329 = icmp eq i32 %328, 42
  %330 = or i1 %324, %329
  %331 = load i32, i32* @i
  %332 = add i32 %331, 0
  %333 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %332
  %334 = load i32, i32* %333
  %335 = icmp eq i32 %334, 47
  %336 = or i1 %330, %335
  %337 = load i32, i32* @i
  %338 = add i32 %337, 0
  %339 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %338
  %340 = load i32, i32* %339
  %341 = icmp eq i32 %340, 37
  %342 = or i1 %336, %341
  %343 = load i32, i32* @i
  %344 = add i32 %343, 0
  %345 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %344
  %346 = load i32, i32* %345
  %347 = icmp eq i32 %346, 94
  %348 = or i1 %342, %347
  br i1 %348, label %349, label %416

349:                                              ; preds = %313
  %350 = call i32 @intpop()
  %351 = alloca i32
  store i32 %350, i32* %351
  %352 = call i32 @intpop()
  %353 = alloca i32
  store i32 %352, i32* %353
  %354 = alloca i32
  %355 = load i32, i32* @i
  %356 = add i32 %355, 0
  %357 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %356
  %358 = load i32, i32* %357
  %359 = icmp eq i32 %358, 43
  br i1 %359, label %360, label %364

360:                                              ; preds = %349
  %361 = load i32, i32* %351
  %362 = load i32, i32* %353
  %363 = add i32 %361, %362
  store i32 %363, i32* %354
  br label %364

364:                                              ; preds = %360, %349
  %365 = load i32, i32* @i
  %366 = add i32 %365, 0
  %367 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %366
  %368 = load i32, i32* %367
  %369 = icmp eq i32 %368, 45
  br i1 %369, label %370, label %374

370:                                              ; preds = %364
  %371 = load i32, i32* %353
  %372 = load i32, i32* %351
  %373 = sub i32 %371, %372
  store i32 %373, i32* %354
  br label %374

374:                                              ; preds = %370, %364
  %375 = load i32, i32* @i
  %376 = add i32 %375, 0
  %377 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %376
  %378 = load i32, i32* %377
  %379 = icmp eq i32 %378, 42
  br i1 %379, label %380, label %384

380:                                              ; preds = %374
  %381 = load i32, i32* %351
  %382 = load i32, i32* %353
  %383 = mul i32 %381, %382
  store i32 %383, i32* %354
  br label %384

384:                                              ; preds = %380, %374
  %385 = load i32, i32* @i
  %386 = add i32 %385, 0
  %387 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %386
  %388 = load i32, i32* %387
  %389 = icmp eq i32 %388, 47
  br i1 %389, label %390, label %394

390:                                              ; preds = %384
  %391 = load i32, i32* %353
  %392 = load i32, i32* %351
  %393 = sdiv i32 %391, %392
  store i32 %393, i32* %354
  br label %394

394:                                              ; preds = %390, %384
  %395 = load i32, i32* @i
  %396 = add i32 %395, 0
  %397 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %396
  %398 = load i32, i32* %397
  %399 = icmp eq i32 %398, 37
  br i1 %399, label %400, label %404

400:                                              ; preds = %394
  %401 = load i32, i32* %353
  %402 = load i32, i32* %351
  %403 = srem i32 %401, %402
  store i32 %403, i32* %354
  br label %404

404:                                              ; preds = %400, %394
  %405 = load i32, i32* @i
  %406 = add i32 %405, 0
  %407 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %406
  %408 = load i32, i32* %407
  %409 = icmp eq i32 %408, 94
  br i1 %409, label %410, label %414

410:                                              ; preds = %404
  %411 = load i32, i32* %353
  %412 = load i32, i32* %351
  %413 = call i32 @power(i32 %411, i32 %412)
  store i32 %413, i32* %354
  br label %414

414:                                              ; preds = %410, %404
  %415 = load i32, i32* %354
  call void @intpush(i32 %415)
  br label %452

416:                                              ; preds = %313
  %417 = load i32, i32* @i
  %418 = add i32 %417, 0
  %419 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %418
  %420 = load i32, i32* %419
  %421 = icmp ne i32 %420, 32
  br i1 %421, label %422, label %451

422:                                              ; preds = %416
  %423 = load i32, i32* @i
  %424 = add i32 %423, 0
  %425 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %424
  %426 = load i32, i32* %425
  %427 = sub i32 %426, 48
  call void @intpush(i32 %427)
  store i32 1, i32* @ii
  br label %428

428:                                              ; preds = %436, %422
  %429 = load i32, i32* @i
  %430 = load i32, i32* @ii
  %431 = add i32 %429, %430
  %432 = add i32 %431, 0
  %433 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %432
  %434 = load i32, i32* %433
  %435 = icmp ne i32 %434, 32
  br i1 %435, label %436, label %446

436:                                              ; preds = %428
  %437 = load i32, i32* @i
  %438 = load i32, i32* @ii
  %439 = add i32 %437, %438
  %440 = add i32 %439, 0
  %441 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %440
  %442 = load i32, i32* %441
  %443 = sub i32 %442, 48
  call void @intadd(i32 %443)
  %444 = load i32, i32* @ii
  %445 = add i32 %444, 1
  store i32 %445, i32* @ii
  br label %428

446:                                              ; preds = %428
  %447 = load i32, i32* @i
  %448 = load i32, i32* @ii
  %449 = add i32 %447, %448
  %450 = sub i32 %449, 1
  store i32 %450, i32* @i
  br label %451

451:                                              ; preds = %446, %416
  br label %452

452:                                              ; preds = %451, %414
  %453 = load i32, i32* @i
  %454 = add i32 %453, 1
  store i32 %454, i32* @i
  br label %307

455:                                              ; preds = %307
  %456 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 1
  %457 = load i32, i32* %456
  call void @putint(i32 %457)
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
