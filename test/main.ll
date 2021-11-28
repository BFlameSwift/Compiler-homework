declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
define dso_local i32 @relu_reg(i32 %0){
%2 = alloca i32 
store i32 %0, i32* %2
%3 = load i32, i32* %2
%4 = icmp sgt i32 %3, 127
br i1 %4, label %5, label %7
5:
ret i32 127
6:
br label %7
7:
%8 = load i32, i32* %2
%9 = icmp slt i32 %8, 0
br i1 %9, label %10, label %12
10:
ret i32 0
11:
br label %12
12:
%13 = load i32, i32* %2
ret i32 %13
}
define dso_local i32 @model(i32* %0){
%2 = alloca i32* 
store i32* %0, i32* * %2
0
%3 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483635load addr-2147483635	block: 0
%4 = getelementptr i32, i32* %3, i32 0
%5 = load i32, i32* %4
%6 = mul i32 %5, 85
1
%7 = load i32* , i32* * %2
This is a const:null value = 1in address:-2147483627load addr-2147483627	block: 0
%8 = getelementptr i32, i32* %7, i32 1
%9 = load i32, i32* %8
%10 = mul i32 %9, 23
%11 = add i32 %6, %10
2
%12 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147483619load addr-2147483619	block: 0
%13 = getelementptr i32, i32* %12, i32 2
%14 = load i32, i32* %13
%15 = mul i32 %14, -82
%16 = add i32 %11, %15
3
%17 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147483610load addr-2147483610	block: 0
%18 = getelementptr i32, i32* %17, i32 3
%19 = load i32, i32* %18
%20 = mul i32 %19, -103
%21 = add i32 %16, %20
4
%22 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147483601load addr-2147483601	block: 0
%23 = getelementptr i32, i32* %22, i32 4
%24 = load i32, i32* %23
%25 = mul i32 %24, -123
%26 = add i32 %21, %25
0
%27 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483594load addr-2147483594	block: 0
%28 = getelementptr i32, i32* %27, i32 0
%29 = load i32, i32* %28
%30 = mul i32 %29, 64
%31 = add i32 %26, %30
2
%32 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147483586load addr-2147483586	block: 0
%33 = getelementptr i32, i32* %32, i32 2
%34 = load i32, i32* %33
%35 = mul i32 %34, -120
%36 = add i32 %31, %35
4
%37 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147483577load addr-2147483577	block: 0
%38 = getelementptr i32, i32* %37, i32 4
%39 = load i32, i32* %38
%40 = mul i32 %39, 50
%41 = add i32 %36, %40
6
%42 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147483569load addr-2147483569	block: 0
%43 = getelementptr i32, i32* %42, i32 6
%44 = load i32, i32* %43
%45 = mul i32 %44, -59
%46 = add i32 %41, %45
8
%47 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147483560load addr-2147483560	block: 0
%48 = getelementptr i32, i32* %47, i32 8
%49 = load i32, i32* %48
%50 = mul i32 %49, 47
%51 = add i32 %46, %50
0
%52 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483554load addr-2147483554	block: 0
%53 = getelementptr i32, i32* %52, i32 0
%54 = load i32, i32* %53
%55 = mul i32 %54, -111
%56 = add i32 %51, %55
3
%57 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147483545load addr-2147483545	block: 0
%58 = getelementptr i32, i32* %57, i32 3
%59 = load i32, i32* %58
%60 = mul i32 %59, -67
%61 = add i32 %56, %60
6
%62 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147483536load addr-2147483536	block: 0
%63 = getelementptr i32, i32* %62, i32 6
%64 = load i32, i32* %63
%65 = mul i32 %64, -106
%66 = add i32 %61, %65
9
%67 = load i32* , i32* * %2
This is a const:null value = 9in address:-2147483527load addr-2147483527	block: 0
%68 = getelementptr i32, i32* %67, i32 9
%69 = load i32, i32* %68
%70 = mul i32 %69, -75
%71 = add i32 %66, %70
12
%72 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147483518load addr-2147483518	block: 0
%73 = getelementptr i32, i32* %72, i32 12
%74 = load i32, i32* %73
%75 = mul i32 %74, -102
%76 = add i32 %71, %75
0
%77 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483511load addr-2147483511	block: 0
%78 = getelementptr i32, i32* %77, i32 0
%79 = load i32, i32* %78
%80 = mul i32 %79, 34
%81 = add i32 %76, %80
4
%82 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147483503load addr-2147483503	block: 0
%83 = getelementptr i32, i32* %82, i32 4
%84 = load i32, i32* %83
%85 = mul i32 %84, -39
%86 = add i32 %81, %85
8
%87 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147483494load addr-2147483494	block: 0
%88 = getelementptr i32, i32* %87, i32 8
%89 = load i32, i32* %88
%90 = mul i32 %89, 65
%91 = add i32 %86, %90
12
%92 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147483486load addr-2147483486	block: 0
%93 = getelementptr i32, i32* %92, i32 12
%94 = load i32, i32* %93
%95 = mul i32 %94, 47
%96 = add i32 %91, %95
16
%97 = load i32* , i32* * %2
This is a const:null value = 16in address:-2147483478load addr-2147483478	block: 0
%98 = getelementptr i32, i32* %97, i32 16
%99 = load i32, i32* %98
%100 = mul i32 %99, 113
%101 = add i32 %96, %100
0
%102 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483472load addr-2147483472	block: 0
%103 = getelementptr i32, i32* %102, i32 0
%104 = load i32, i32* %103
%105 = mul i32 %104, 110
%106 = add i32 %101, %105
5
%107 = load i32* , i32* * %2
This is a const:null value = 5in address:-2147483464load addr-2147483464	block: 0
%108 = getelementptr i32, i32* %107, i32 5
%109 = load i32, i32* %108
%110 = mul i32 %109, 47
%111 = add i32 %106, %110
10
%112 = load i32* , i32* * %2
This is a const:null value = 10in address:-2147483456load addr-2147483456	block: 0
%113 = getelementptr i32, i32* %112, i32 10
%114 = load i32, i32* %113
%115 = mul i32 %114, -4
%116 = add i32 %111, %115
15
%117 = load i32* , i32* * %2
This is a const:null value = 15in address:-2147483447load addr-2147483447	block: 0
%118 = getelementptr i32, i32* %117, i32 15
%119 = load i32, i32* %118
%120 = mul i32 %119, 80
%121 = add i32 %116, %120
20
%122 = load i32* , i32* * %2
This is a const:null value = 20in address:-2147483439load addr-2147483439	block: 0
%123 = getelementptr i32, i32* %122, i32 20
%124 = load i32, i32* %123
%125 = mul i32 %124, 46
%126 = add i32 %121, %125
%127 = call i32 @relu_reg(i32 %126)
%128 = mul i32 %127, 39
0
%129 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483432load addr-2147483432	block: 0
%130 = getelementptr i32, i32* %129, i32 0
%131 = load i32, i32* %130
%132 = mul i32 %131, -106
1
%133 = load i32* , i32* * %2
This is a const:null value = 1in address:-2147483423load addr-2147483423	block: 0
%134 = getelementptr i32, i32* %133, i32 1
%135 = load i32, i32* %134
%136 = mul i32 %135, 126
%137 = add i32 %132, %136
2
%138 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147483415load addr-2147483415	block: 0
%139 = getelementptr i32, i32* %138, i32 2
%140 = load i32, i32* %139
%141 = mul i32 %140, -18
%142 = add i32 %137, %141
3
%143 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147483406load addr-2147483406	block: 0
%144 = getelementptr i32, i32* %143, i32 3
%145 = load i32, i32* %144
%146 = mul i32 %145, -31
%147 = add i32 %142, %146
4
%148 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147483397load addr-2147483397	block: 0
%149 = getelementptr i32, i32* %148, i32 4
%150 = load i32, i32* %149
%151 = mul i32 %150, -8
%152 = add i32 %147, %151
0
%153 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483390load addr-2147483390	block: 0
%154 = getelementptr i32, i32* %153, i32 0
%155 = load i32, i32* %154
%156 = mul i32 %155, 47
%157 = add i32 %152, %156
2
%158 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147483382load addr-2147483382	block: 0
%159 = getelementptr i32, i32* %158, i32 2
%160 = load i32, i32* %159
%161 = mul i32 %160, -4
%162 = add i32 %157, %161
4
%163 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147483373load addr-2147483373	block: 0
%164 = getelementptr i32, i32* %163, i32 4
%165 = load i32, i32* %164
%166 = mul i32 %165, 67
%167 = add i32 %162, %166
6
%168 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147483365load addr-2147483365	block: 0
%169 = getelementptr i32, i32* %168, i32 6
%170 = load i32, i32* %169
%171 = mul i32 %170, -94
%172 = add i32 %167, %171
8
%173 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147483356load addr-2147483356	block: 0
%174 = getelementptr i32, i32* %173, i32 8
%175 = load i32, i32* %174
%176 = mul i32 %175, -121
%177 = add i32 %172, %176
0
%178 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483349load addr-2147483349	block: 0
%179 = getelementptr i32, i32* %178, i32 0
%180 = load i32, i32* %179
%181 = mul i32 %180, 7
%182 = add i32 %177, %181
3
%183 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147483341load addr-2147483341	block: 0
%184 = getelementptr i32, i32* %183, i32 3
%185 = load i32, i32* %184
%186 = mul i32 %185, -21
%187 = add i32 %182, %186
6
%188 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147483332load addr-2147483332	block: 0
%189 = getelementptr i32, i32* %188, i32 6
%190 = load i32, i32* %189
%191 = mul i32 %190, -60
%192 = add i32 %187, %191
9
%193 = load i32* , i32* * %2
This is a const:null value = 9in address:-2147483323load addr-2147483323	block: 0
%194 = getelementptr i32, i32* %193, i32 9
%195 = load i32, i32* %194
%196 = mul i32 %195, -43
%197 = add i32 %192, %196
12
%198 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147483314load addr-2147483314	block: 0
%199 = getelementptr i32, i32* %198, i32 12
%200 = load i32, i32* %199
%201 = mul i32 %200, 105
%202 = add i32 %197, %201
0
%203 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483308load addr-2147483308	block: 0
%204 = getelementptr i32, i32* %203, i32 0
%205 = load i32, i32* %204
%206 = mul i32 %205, -42
%207 = add i32 %202, %206
4
%208 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147483299load addr-2147483299	block: 0
%209 = getelementptr i32, i32* %208, i32 4
%210 = load i32, i32* %209
%211 = mul i32 %210, 87
%212 = add i32 %207, %211
8
%213 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147483291load addr-2147483291	block: 0
%214 = getelementptr i32, i32* %213, i32 8
%215 = load i32, i32* %214
%216 = mul i32 %215, 29
%217 = add i32 %212, %216
12
%218 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147483283load addr-2147483283	block: 0
%219 = getelementptr i32, i32* %218, i32 12
%220 = load i32, i32* %219
%221 = mul i32 %220, -106
%222 = add i32 %217, %221
16
%223 = load i32* , i32* * %2
This is a const:null value = 16in address:-2147483274load addr-2147483274	block: 0
%224 = getelementptr i32, i32* %223, i32 16
%225 = load i32, i32* %224
%226 = mul i32 %225, -31
%227 = add i32 %222, %226
0
%228 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483267load addr-2147483267	block: 0
%229 = getelementptr i32, i32* %228, i32 0
%230 = load i32, i32* %229
%231 = mul i32 %230, -110
%232 = add i32 %227, %231
5
%233 = load i32* , i32* * %2
This is a const:null value = 5in address:-2147483258load addr-2147483258	block: 0
%234 = getelementptr i32, i32* %233, i32 5
%235 = load i32, i32* %234
%236 = mul i32 %235, -100
%237 = add i32 %232, %236
10
%238 = load i32* , i32* * %2
This is a const:null value = 10in address:-2147483249load addr-2147483249	block: 0
%239 = getelementptr i32, i32* %238, i32 10
%240 = load i32, i32* %239
%241 = mul i32 %240, -22
%242 = add i32 %237, %241
15
%243 = load i32* , i32* * %2
This is a const:null value = 15in address:-2147483240load addr-2147483240	block: 0
%244 = getelementptr i32, i32* %243, i32 15
%245 = load i32, i32* %244
%246 = mul i32 %245, -75
%247 = add i32 %242, %246
20
%248 = load i32* , i32* * %2
This is a const:null value = 20in address:-2147483231load addr-2147483231	block: 0
%249 = getelementptr i32, i32* %248, i32 20
%250 = load i32, i32* %249
%251 = mul i32 %250, -125
%252 = add i32 %247, %251
%253 = call i32 @relu_reg(i32 %252)
%254 = mul i32 %253, 77
%255 = add i32 %128, %254
0
%256 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483223load addr-2147483223	block: 0
%257 = getelementptr i32, i32* %256, i32 0
%258 = load i32, i32* %257
%259 = mul i32 %258, 26
1
%260 = load i32* , i32* * %2
This is a const:null value = 1in address:-2147483215load addr-2147483215	block: 0
%261 = getelementptr i32, i32* %260, i32 1
%262 = load i32, i32* %261
%263 = mul i32 %262, 76
%264 = add i32 %259, %263
2
%265 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147483207load addr-2147483207	block: 0
%266 = getelementptr i32, i32* %265, i32 2
%267 = load i32, i32* %266
%268 = mul i32 %267, -70
%269 = add i32 %264, %268
3
%270 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147483198load addr-2147483198	block: 0
%271 = getelementptr i32, i32* %270, i32 3
%272 = load i32, i32* %271
%273 = mul i32 %272, 29
%274 = add i32 %269, %273
4
%275 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147483190load addr-2147483190	block: 0
%276 = getelementptr i32, i32* %275, i32 4
%277 = load i32, i32* %276
%278 = mul i32 %277, -95
%279 = add i32 %274, %278
0
%280 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483183load addr-2147483183	block: 0
%281 = getelementptr i32, i32* %280, i32 0
%282 = load i32, i32* %281
%283 = mul i32 %282, 96
%284 = add i32 %279, %283
2
%285 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147483175load addr-2147483175	block: 0
%286 = getelementptr i32, i32* %285, i32 2
%287 = load i32, i32* %286
%288 = mul i32 %287, 52
%289 = add i32 %284, %288
4
%290 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147483167load addr-2147483167	block: 0
%291 = getelementptr i32, i32* %290, i32 4
%292 = load i32, i32* %291
%293 = mul i32 %292, -68
%294 = add i32 %289, %293
6
%295 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147483158load addr-2147483158	block: 0
%296 = getelementptr i32, i32* %295, i32 6
%297 = load i32, i32* %296
%298 = mul i32 %297, -5
%299 = add i32 %294, %298
8
%300 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147483149load addr-2147483149	block: 0
%301 = getelementptr i32, i32* %300, i32 8
%302 = load i32, i32* %301
%303 = mul i32 %302, 34
%304 = add i32 %299, %303
0
%305 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483143load addr-2147483143	block: 0
%306 = getelementptr i32, i32* %305, i32 0
%307 = load i32, i32* %306
%308 = mul i32 %307, -34
%309 = add i32 %304, %308
3
%310 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147483134load addr-2147483134	block: 0
%311 = getelementptr i32, i32* %310, i32 3
%312 = load i32, i32* %311
%313 = mul i32 %312, 102
%314 = add i32 %309, %313
6
%315 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147483126load addr-2147483126	block: 0
%316 = getelementptr i32, i32* %315, i32 6
%317 = load i32, i32* %316
%318 = mul i32 %317, 6
%319 = add i32 %314, %318
9
%320 = load i32* , i32* * %2
This is a const:null value = 9in address:-2147483118load addr-2147483118	block: 0
%321 = getelementptr i32, i32* %320, i32 9
%322 = load i32, i32* %321
%323 = mul i32 %322, -38
%324 = add i32 %319, %323
12
%325 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147483109load addr-2147483109	block: 0
%326 = getelementptr i32, i32* %325, i32 12
%327 = load i32, i32* %326
%328 = mul i32 %327, 27
%329 = add i32 %324, %328
0
%330 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483103load addr-2147483103	block: 0
%331 = getelementptr i32, i32* %330, i32 0
%332 = load i32, i32* %331
%333 = mul i32 %332, 110
%334 = add i32 %329, %333
4
%335 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147483095load addr-2147483095	block: 0
%336 = getelementptr i32, i32* %335, i32 4
%337 = load i32, i32* %336
%338 = mul i32 %337, 116
%339 = add i32 %334, %338
8
%340 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147483087load addr-2147483087	block: 0
%341 = getelementptr i32, i32* %340, i32 8
%342 = load i32, i32* %341
%343 = mul i32 %342, 39
%344 = add i32 %339, %343
12
%345 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147483079load addr-2147483079	block: 0
%346 = getelementptr i32, i32* %345, i32 12
%347 = load i32, i32* %346
%348 = mul i32 %347, -63
%349 = add i32 %344, %348
16
%350 = load i32* , i32* * %2
This is a const:null value = 16in address:-2147483070load addr-2147483070	block: 0
%351 = getelementptr i32, i32* %350, i32 16
%352 = load i32, i32* %351
%353 = mul i32 %352, -99
%354 = add i32 %349, %353
0
%355 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483063load addr-2147483063	block: 0
%356 = getelementptr i32, i32* %355, i32 0
%357 = load i32, i32* %356
%358 = mul i32 %357, 65
%359 = add i32 %354, %358
5
%360 = load i32* , i32* * %2
This is a const:null value = 5in address:-2147483055load addr-2147483055	block: 0
%361 = getelementptr i32, i32* %360, i32 5
%362 = load i32, i32* %361
%363 = mul i32 %362, 120
%364 = add i32 %359, %363
10
%365 = load i32* , i32* * %2
This is a const:null value = 10in address:-2147483047load addr-2147483047	block: 0
%366 = getelementptr i32, i32* %365, i32 10
%367 = load i32, i32* %366
%368 = mul i32 %367, -39
%369 = add i32 %364, %368
15
%370 = load i32* , i32* * %2
This is a const:null value = 15in address:-2147483038load addr-2147483038	block: 0
%371 = getelementptr i32, i32* %370, i32 15
%372 = load i32, i32* %371
%373 = mul i32 %372, -6
%374 = add i32 %369, %373
20
%375 = load i32* , i32* * %2
This is a const:null value = 20in address:-2147483029load addr-2147483029	block: 0
%376 = getelementptr i32, i32* %375, i32 20
%377 = load i32, i32* %376
%378 = mul i32 %377, 94
%379 = add i32 %374, %378
%380 = call i32 @relu_reg(i32 %379)
%381 = mul i32 %380, 127
%382 = add i32 %255, %381
0
%383 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147483022load addr-2147483022	block: 0
%384 = getelementptr i32, i32* %383, i32 0
%385 = load i32, i32* %384
%386 = mul i32 %385, -23
1
%387 = load i32* , i32* * %2
This is a const:null value = 1in address:-2147483013load addr-2147483013	block: 0
%388 = getelementptr i32, i32* %387, i32 1
%389 = load i32, i32* %388
%390 = mul i32 %389, -63
%391 = add i32 %386, %390
2
%392 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147483004load addr-2147483004	block: 0
%393 = getelementptr i32, i32* %392, i32 2
%394 = load i32, i32* %393
%395 = mul i32 %394, 49
%396 = add i32 %391, %395
3
%397 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147482996load addr-2147482996	block: 0
%398 = getelementptr i32, i32* %397, i32 3
%399 = load i32, i32* %398
%400 = mul i32 %399, 50
%401 = add i32 %396, %400
4
%402 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482988load addr-2147482988	block: 0
%403 = getelementptr i32, i32* %402, i32 4
%404 = load i32, i32* %403
%405 = mul i32 %404, 72
%406 = add i32 %401, %405
0
%407 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482982load addr-2147482982	block: 0
%408 = getelementptr i32, i32* %407, i32 0
%409 = load i32, i32* %408
%410 = mul i32 %409, 85
%411 = add i32 %406, %410
2
%412 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147482974load addr-2147482974	block: 0
%413 = getelementptr i32, i32* %412, i32 2
%414 = load i32, i32* %413
%415 = mul i32 %414, -30
%416 = add i32 %411, %415
4
%417 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482965load addr-2147482965	block: 0
%418 = getelementptr i32, i32* %417, i32 4
%419 = load i32, i32* %418
%420 = mul i32 %419, 12
%421 = add i32 %416, %420
6
%422 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147482957load addr-2147482957	block: 0
%423 = getelementptr i32, i32* %422, i32 6
%424 = load i32, i32* %423
%425 = mul i32 %424, 125
%426 = add i32 %421, %425
8
%427 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147482949load addr-2147482949	block: 0
%428 = getelementptr i32, i32* %427, i32 8
%429 = load i32, i32* %428
%430 = mul i32 %429, -117
%431 = add i32 %426, %430
0
%432 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482942load addr-2147482942	block: 0
%433 = getelementptr i32, i32* %432, i32 0
%434 = load i32, i32* %433
%435 = mul i32 %434, -65
%436 = add i32 %431, %435
3
%437 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147482933load addr-2147482933	block: 0
%438 = getelementptr i32, i32* %437, i32 3
%439 = load i32, i32* %438
%440 = mul i32 %439, -67
%441 = add i32 %436, %440
6
%442 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147482924load addr-2147482924	block: 0
%443 = getelementptr i32, i32* %442, i32 6
%444 = load i32, i32* %443
%445 = mul i32 %444, 125
%446 = add i32 %441, %445
9
%447 = load i32* , i32* * %2
This is a const:null value = 9in address:-2147482916load addr-2147482916	block: 0
%448 = getelementptr i32, i32* %447, i32 9
%449 = load i32, i32* %448
%450 = mul i32 %449, 110
%451 = add i32 %446, %450
12
%452 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147482908load addr-2147482908	block: 0
%453 = getelementptr i32, i32* %452, i32 12
%454 = load i32, i32* %453
%455 = mul i32 %454, -31
%456 = add i32 %451, %455
0
%457 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482901load addr-2147482901	block: 0
%458 = getelementptr i32, i32* %457, i32 0
%459 = load i32, i32* %458
%460 = mul i32 %459, -123
%461 = add i32 %456, %460
4
%462 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482892load addr-2147482892	block: 0
%463 = getelementptr i32, i32* %462, i32 4
%464 = load i32, i32* %463
%465 = mul i32 %464, 83
%466 = add i32 %461, %465
8
%467 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147482884load addr-2147482884	block: 0
%468 = getelementptr i32, i32* %467, i32 8
%469 = load i32, i32* %468
%470 = mul i32 %469, 122
%471 = add i32 %466, %470
12
%472 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147482876load addr-2147482876	block: 0
%473 = getelementptr i32, i32* %472, i32 12
%474 = load i32, i32* %473
%475 = mul i32 %474, 11
%476 = add i32 %471, %475
16
%477 = load i32* , i32* * %2
This is a const:null value = 16in address:-2147482868load addr-2147482868	block: 0
%478 = getelementptr i32, i32* %477, i32 16
%479 = load i32, i32* %478
%480 = mul i32 %479, -23
%481 = add i32 %476, %480
0
%482 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482861load addr-2147482861	block: 0
%483 = getelementptr i32, i32* %482, i32 0
%484 = load i32, i32* %483
%485 = mul i32 %484, -47
%486 = add i32 %481, %485
5
%487 = load i32* , i32* * %2
This is a const:null value = 5in address:-2147482852load addr-2147482852	block: 0
%488 = getelementptr i32, i32* %487, i32 5
%489 = load i32, i32* %488
%490 = mul i32 %489, -32
%491 = add i32 %486, %490
10
%492 = load i32* , i32* * %2
This is a const:null value = 10in address:-2147482843load addr-2147482843	block: 0
%493 = getelementptr i32, i32* %492, i32 10
%494 = load i32, i32* %493
%495 = mul i32 %494, -117
%496 = add i32 %491, %495
15
%497 = load i32* , i32* * %2
This is a const:null value = 15in address:-2147482834load addr-2147482834	block: 0
%498 = getelementptr i32, i32* %497, i32 15
%499 = load i32, i32* %498
%500 = mul i32 %499, 95
%501 = add i32 %496, %500
20
%502 = load i32* , i32* * %2
This is a const:null value = 20in address:-2147482826load addr-2147482826	block: 0
%503 = getelementptr i32, i32* %502, i32 20
%504 = load i32, i32* %503
%505 = mul i32 %504, 118
%506 = add i32 %501, %505
%507 = call i32 @relu_reg(i32 %506)
%508 = mul i32 %507, -106
%509 = add i32 %382, %508
0
%510 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482818load addr-2147482818	block: 0
%511 = getelementptr i32, i32* %510, i32 0
%512 = load i32, i32* %511
%513 = mul i32 %512, 8
1
%514 = load i32* , i32* * %2
This is a const:null value = 1in address:-2147482810load addr-2147482810	block: 0
%515 = getelementptr i32, i32* %514, i32 1
%516 = load i32, i32* %515
%517 = mul i32 %516, 82
%518 = add i32 %513, %517
2
%519 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147482802load addr-2147482802	block: 0
%520 = getelementptr i32, i32* %519, i32 2
%521 = load i32, i32* %520
%522 = mul i32 %521, -104
%523 = add i32 %518, %522
3
%524 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147482793load addr-2147482793	block: 0
%525 = getelementptr i32, i32* %524, i32 3
%526 = load i32, i32* %525
%527 = mul i32 %526, 101
%528 = add i32 %523, %527
4
%529 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482785load addr-2147482785	block: 0
%530 = getelementptr i32, i32* %529, i32 4
%531 = load i32, i32* %530
%532 = mul i32 %531, -116
%533 = add i32 %528, %532
0
%534 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482778load addr-2147482778	block: 0
%535 = getelementptr i32, i32* %534, i32 0
%536 = load i32, i32* %535
%537 = mul i32 %536, -63
%538 = add i32 %533, %537
2
%539 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147482769load addr-2147482769	block: 0
%540 = getelementptr i32, i32* %539, i32 2
%541 = load i32, i32* %540
%542 = mul i32 %541, -16
%543 = add i32 %538, %542
4
%544 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482760load addr-2147482760	block: 0
%545 = getelementptr i32, i32* %544, i32 4
%546 = load i32, i32* %545
%547 = mul i32 %546, -70
%548 = add i32 %543, %547
6
%549 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147482751load addr-2147482751	block: 0
%550 = getelementptr i32, i32* %549, i32 6
%551 = load i32, i32* %550
%552 = mul i32 %551, 125
%553 = add i32 %548, %552
8
%554 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147482743load addr-2147482743	block: 0
%555 = getelementptr i32, i32* %554, i32 8
%556 = load i32, i32* %555
%557 = mul i32 %556, 75
%558 = add i32 %553, %557
0
%559 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482737load addr-2147482737	block: 0
%560 = getelementptr i32, i32* %559, i32 0
%561 = load i32, i32* %560
%562 = mul i32 %561, 66
%563 = add i32 %558, %562
3
%564 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147482729load addr-2147482729	block: 0
%565 = getelementptr i32, i32* %564, i32 3
%566 = load i32, i32* %565
%567 = mul i32 %566, -96
%568 = add i32 %563, %567
6
%569 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147482720load addr-2147482720	block: 0
%570 = getelementptr i32, i32* %569, i32 6
%571 = load i32, i32* %570
%572 = mul i32 %571, -101
%573 = add i32 %568, %572
9
%574 = load i32* , i32* * %2
This is a const:null value = 9in address:-2147482711load addr-2147482711	block: 0
%575 = getelementptr i32, i32* %574, i32 9
%576 = load i32, i32* %575
%577 = mul i32 %576, -114
%578 = add i32 %573, %577
12
%579 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147482702load addr-2147482702	block: 0
%580 = getelementptr i32, i32* %579, i32 12
%581 = load i32, i32* %580
%582 = mul i32 %581, 59
%583 = add i32 %578, %582
0
%584 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482696load addr-2147482696	block: 0
%585 = getelementptr i32, i32* %584, i32 0
%586 = load i32, i32* %585
%587 = mul i32 %586, 12
%588 = add i32 %583, %587
4
%589 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482688load addr-2147482688	block: 0
%590 = getelementptr i32, i32* %589, i32 4
%591 = load i32, i32* %590
%592 = mul i32 %591, 5
%593 = add i32 %588, %592
8
%594 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147482680load addr-2147482680	block: 0
%595 = getelementptr i32, i32* %594, i32 8
%596 = load i32, i32* %595
%597 = mul i32 %596, -95
%598 = add i32 %593, %597
12
%599 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147482671load addr-2147482671	block: 0
%600 = getelementptr i32, i32* %599, i32 12
%601 = load i32, i32* %600
%602 = mul i32 %601, 116
%603 = add i32 %598, %602
16
%604 = load i32* , i32* * %2
This is a const:null value = 16in address:-2147482663load addr-2147482663	block: 0
%605 = getelementptr i32, i32* %604, i32 16
%606 = load i32, i32* %605
%607 = mul i32 %606, -93
%608 = add i32 %603, %607
0
%609 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482656load addr-2147482656	block: 0
%610 = getelementptr i32, i32* %609, i32 0
%611 = load i32, i32* %610
%612 = mul i32 %611, 15
%613 = add i32 %608, %612
5
%614 = load i32* , i32* * %2
This is a const:null value = 5in address:-2147482648load addr-2147482648	block: 0
%615 = getelementptr i32, i32* %614, i32 5
%616 = load i32, i32* %615
%617 = mul i32 %616, 79
%618 = add i32 %613, %617
10
%619 = load i32* , i32* * %2
This is a const:null value = 10in address:-2147482640load addr-2147482640	block: 0
%620 = getelementptr i32, i32* %619, i32 10
%621 = load i32, i32* %620
%622 = mul i32 %621, 3
%623 = add i32 %618, %622
15
%624 = load i32* , i32* * %2
This is a const:null value = 15in address:-2147482632load addr-2147482632	block: 0
%625 = getelementptr i32, i32* %624, i32 15
%626 = load i32, i32* %625
%627 = mul i32 %626, 49
%628 = add i32 %623, %627
20
%629 = load i32* , i32* * %2
This is a const:null value = 20in address:-2147482624load addr-2147482624	block: 0
%630 = getelementptr i32, i32* %629, i32 20
%631 = load i32, i32* %630
%632 = mul i32 %631, -124
%633 = add i32 %628, %632
%634 = call i32 @relu_reg(i32 %633)
%635 = mul i32 %634, -3
%636 = add i32 %509, %635
0
%637 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482615load addr-2147482615	block: 0
%638 = getelementptr i32, i32* %637, i32 0
%639 = load i32, i32* %638
%640 = mul i32 %639, 81
1
%641 = load i32* , i32* * %2
This is a const:null value = 1in address:-2147482607load addr-2147482607	block: 0
%642 = getelementptr i32, i32* %641, i32 1
%643 = load i32, i32* %642
%644 = mul i32 %643, 68
%645 = add i32 %640, %644
2
%646 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147482599load addr-2147482599	block: 0
%647 = getelementptr i32, i32* %646, i32 2
%648 = load i32, i32* %647
%649 = mul i32 %648, -102
%650 = add i32 %645, %649
3
%651 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147482590load addr-2147482590	block: 0
%652 = getelementptr i32, i32* %651, i32 3
%653 = load i32, i32* %652
%654 = mul i32 %653, -74
%655 = add i32 %650, %654
4
%656 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482581load addr-2147482581	block: 0
%657 = getelementptr i32, i32* %656, i32 4
%658 = load i32, i32* %657
%659 = mul i32 %658, 121
%660 = add i32 %655, %659
0
%661 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482575load addr-2147482575	block: 0
%662 = getelementptr i32, i32* %661, i32 0
%663 = load i32, i32* %662
%664 = mul i32 %663, -15
%665 = add i32 %660, %664
2
%666 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147482566load addr-2147482566	block: 0
%667 = getelementptr i32, i32* %666, i32 2
%668 = load i32, i32* %667
%669 = mul i32 %668, 55
%670 = add i32 %665, %669
4
%671 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482558load addr-2147482558	block: 0
%672 = getelementptr i32, i32* %671, i32 4
%673 = load i32, i32* %672
%674 = mul i32 %673, 101
%675 = add i32 %670, %674
6
%676 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147482550load addr-2147482550	block: 0
%677 = getelementptr i32, i32* %676, i32 6
%678 = load i32, i32* %677
%679 = mul i32 %678, -13
%680 = add i32 %675, %679
8
%681 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147482541load addr-2147482541	block: 0
%682 = getelementptr i32, i32* %681, i32 8
%683 = load i32, i32* %682
%684 = mul i32 %683, -62
%685 = add i32 %680, %684
0
%686 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482534load addr-2147482534	block: 0
%687 = getelementptr i32, i32* %686, i32 0
%688 = load i32, i32* %687
%689 = mul i32 %688, 64
%690 = add i32 %685, %689
3
%691 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147482526load addr-2147482526	block: 0
%692 = getelementptr i32, i32* %691, i32 3
%693 = load i32, i32* %692
%694 = mul i32 %693, 114
%695 = add i32 %690, %694
6
%696 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147482518load addr-2147482518	block: 0
%697 = getelementptr i32, i32* %696, i32 6
%698 = load i32, i32* %697
%699 = mul i32 %698, 38
%700 = add i32 %695, %699
9
%701 = load i32* , i32* * %2
This is a const:null value = 9in address:-2147482510load addr-2147482510	block: 0
%702 = getelementptr i32, i32* %701, i32 9
%703 = load i32, i32* %702
%704 = mul i32 %703, -21
%705 = add i32 %700, %704
12
%706 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147482501load addr-2147482501	block: 0
%707 = getelementptr i32, i32* %706, i32 12
%708 = load i32, i32* %707
%709 = mul i32 %708, 112
%710 = add i32 %705, %709
0
%711 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482495load addr-2147482495	block: 0
%712 = getelementptr i32, i32* %711, i32 0
%713 = load i32, i32* %712
%714 = mul i32 %713, 114
%715 = add i32 %710, %714
4
%716 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482487load addr-2147482487	block: 0
%717 = getelementptr i32, i32* %716, i32 4
%718 = load i32, i32* %717
%719 = mul i32 %718, 112
%720 = add i32 %715, %719
8
%721 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147482479load addr-2147482479	block: 0
%722 = getelementptr i32, i32* %721, i32 8
%723 = load i32, i32* %722
%724 = mul i32 %723, -10
%725 = add i32 %720, %724
12
%726 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147482470load addr-2147482470	block: 0
%727 = getelementptr i32, i32* %726, i32 12
%728 = load i32, i32* %727
%729 = mul i32 %728, -16
%730 = add i32 %725, %729
16
%731 = load i32* , i32* * %2
This is a const:null value = 16in address:-2147482461load addr-2147482461	block: 0
%732 = getelementptr i32, i32* %731, i32 16
%733 = load i32, i32* %732
%734 = mul i32 %733, -50
%735 = add i32 %730, %734
0
%736 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482454load addr-2147482454	block: 0
%737 = getelementptr i32, i32* %736, i32 0
%738 = load i32, i32* %737
%739 = mul i32 %738, -112
%740 = add i32 %735, %739
5
%741 = load i32* , i32* * %2
This is a const:null value = 5in address:-2147482445load addr-2147482445	block: 0
%742 = getelementptr i32, i32* %741, i32 5
%743 = load i32, i32* %742
%744 = mul i32 %743, -116
%745 = add i32 %740, %744
10
%746 = load i32* , i32* * %2
This is a const:null value = 10in address:-2147482436load addr-2147482436	block: 0
%747 = getelementptr i32, i32* %746, i32 10
%748 = load i32, i32* %747
%749 = mul i32 %748, -54
%750 = add i32 %745, %749
15
%751 = load i32* , i32* * %2
This is a const:null value = 15in address:-2147482427load addr-2147482427	block: 0
%752 = getelementptr i32, i32* %751, i32 15
%753 = load i32, i32* %752
%754 = mul i32 %753, 82
%755 = add i32 %750, %754
20
%756 = load i32* , i32* * %2
This is a const:null value = 20in address:-2147482419load addr-2147482419	block: 0
%757 = getelementptr i32, i32* %756, i32 20
%758 = load i32, i32* %757
%759 = mul i32 %758, -72
%760 = add i32 %755, %759
%761 = call i32 @relu_reg(i32 %760)
%762 = mul i32 %761, 32
%763 = add i32 %636, %762
0
%764 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482411load addr-2147482411	block: 0
%765 = getelementptr i32, i32* %764, i32 0
%766 = load i32, i32* %765
%767 = mul i32 %766, 15
1
%768 = load i32* , i32* * %2
This is a const:null value = 1in address:-2147482403load addr-2147482403	block: 0
%769 = getelementptr i32, i32* %768, i32 1
%770 = load i32, i32* %769
%771 = mul i32 %770, -77
%772 = add i32 %767, %771
2
%773 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147482394load addr-2147482394	block: 0
%774 = getelementptr i32, i32* %773, i32 2
%775 = load i32, i32* %774
%776 = mul i32 %775, 66
%777 = add i32 %772, %776
3
%778 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147482386load addr-2147482386	block: 0
%779 = getelementptr i32, i32* %778, i32 3
%780 = load i32, i32* %779
%781 = mul i32 %780, -90
%782 = add i32 %777, %781
4
%783 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482377load addr-2147482377	block: 0
%784 = getelementptr i32, i32* %783, i32 4
%785 = load i32, i32* %784
%786 = mul i32 %785, -6
%787 = add i32 %782, %786
0
%788 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482370load addr-2147482370	block: 0
%789 = getelementptr i32, i32* %788, i32 0
%790 = load i32, i32* %789
%791 = mul i32 %790, -30
%792 = add i32 %787, %791
2
%793 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147482361load addr-2147482361	block: 0
%794 = getelementptr i32, i32* %793, i32 2
%795 = load i32, i32* %794
%796 = mul i32 %795, -8
%797 = add i32 %792, %796
4
%798 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482352load addr-2147482352	block: 0
%799 = getelementptr i32, i32* %798, i32 4
%800 = load i32, i32* %799
%801 = mul i32 %800, 81
%802 = add i32 %797, %801
6
%803 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147482344load addr-2147482344	block: 0
%804 = getelementptr i32, i32* %803, i32 6
%805 = load i32, i32* %804
%806 = mul i32 %805, 2
%807 = add i32 %802, %806
8
%808 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147482336load addr-2147482336	block: 0
%809 = getelementptr i32, i32* %808, i32 8
%810 = load i32, i32* %809
%811 = mul i32 %810, -110
%812 = add i32 %807, %811
0
%813 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482329load addr-2147482329	block: 0
%814 = getelementptr i32, i32* %813, i32 0
%815 = load i32, i32* %814
%816 = mul i32 %815, -95
%817 = add i32 %812, %816
3
%818 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147482320load addr-2147482320	block: 0
%819 = getelementptr i32, i32* %818, i32 3
%820 = load i32, i32* %819
%821 = mul i32 %820, 59
%822 = add i32 %817, %821
6
%823 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147482312load addr-2147482312	block: 0
%824 = getelementptr i32, i32* %823, i32 6
%825 = load i32, i32* %824
%826 = mul i32 %825, 52
%827 = add i32 %822, %826
9
%828 = load i32* , i32* * %2
This is a const:null value = 9in address:-2147482304load addr-2147482304	block: 0
%829 = getelementptr i32, i32* %828, i32 9
%830 = load i32, i32* %829
%831 = mul i32 %830, 15
%832 = add i32 %827, %831
12
%833 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147482296load addr-2147482296	block: 0
%834 = getelementptr i32, i32* %833, i32 12
%835 = load i32, i32* %834
%836 = mul i32 %835, 55
%837 = add i32 %832, %836
0
%838 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482290load addr-2147482290	block: 0
%839 = getelementptr i32, i32* %838, i32 0
%840 = load i32, i32* %839
%841 = mul i32 %840, -33
%842 = add i32 %837, %841
4
%843 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482281load addr-2147482281	block: 0
%844 = getelementptr i32, i32* %843, i32 4
%845 = load i32, i32* %844
%846 = mul i32 %845, 14
%847 = add i32 %842, %846
8
%848 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147482273load addr-2147482273	block: 0
%849 = getelementptr i32, i32* %848, i32 8
%850 = load i32, i32* %849
%851 = mul i32 %850, 58
%852 = add i32 %847, %851
12
%853 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147482265load addr-2147482265	block: 0
%854 = getelementptr i32, i32* %853, i32 12
%855 = load i32, i32* %854
%856 = mul i32 %855, 67
%857 = add i32 %852, %856
16
%858 = load i32* , i32* * %2
This is a const:null value = 16in address:-2147482257load addr-2147482257	block: 0
%859 = getelementptr i32, i32* %858, i32 16
%860 = load i32, i32* %859
%861 = mul i32 %860, 86
%862 = add i32 %857, %861
0
%863 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482251load addr-2147482251	block: 0
%864 = getelementptr i32, i32* %863, i32 0
%865 = load i32, i32* %864
%866 = mul i32 %865, -79
%867 = add i32 %862, %866
5
%868 = load i32* , i32* * %2
This is a const:null value = 5in address:-2147482242load addr-2147482242	block: 0
%869 = getelementptr i32, i32* %868, i32 5
%870 = load i32, i32* %869
%871 = mul i32 %870, 48
%872 = add i32 %867, %871
10
%873 = load i32* , i32* * %2
This is a const:null value = 10in address:-2147482234load addr-2147482234	block: 0
%874 = getelementptr i32, i32* %873, i32 10
%875 = load i32, i32* %874
%876 = mul i32 %875, -13
%877 = add i32 %872, %876
15
%878 = load i32* , i32* * %2
This is a const:null value = 15in address:-2147482225load addr-2147482225	block: 0
%879 = getelementptr i32, i32* %878, i32 15
%880 = load i32, i32* %879
%881 = mul i32 %880, -15
%882 = add i32 %877, %881
20
%883 = load i32* , i32* * %2
This is a const:null value = 20in address:-2147482216load addr-2147482216	block: 0
%884 = getelementptr i32, i32* %883, i32 20
%885 = load i32, i32* %884
%886 = mul i32 %885, 66
%887 = add i32 %882, %886
%888 = call i32 @relu_reg(i32 %887)
%889 = mul i32 %888, -95
%890 = add i32 %763, %889
0
%891 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482208load addr-2147482208	block: 0
%892 = getelementptr i32, i32* %891, i32 0
%893 = load i32, i32* %892
%894 = mul i32 %893, 33
1
%895 = load i32* , i32* * %2
This is a const:null value = 1in address:-2147482200load addr-2147482200	block: 0
%896 = getelementptr i32, i32* %895, i32 1
%897 = load i32, i32* %896
%898 = mul i32 %897, 82
%899 = add i32 %894, %898
2
%900 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147482192load addr-2147482192	block: 0
%901 = getelementptr i32, i32* %900, i32 2
%902 = load i32, i32* %901
%903 = mul i32 %902, 67
%904 = add i32 %899, %903
3
%905 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147482184load addr-2147482184	block: 0
%906 = getelementptr i32, i32* %905, i32 3
%907 = load i32, i32* %906
%908 = mul i32 %907, 30
%909 = add i32 %904, %908
4
%910 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482176load addr-2147482176	block: 0
%911 = getelementptr i32, i32* %910, i32 4
%912 = load i32, i32* %911
%913 = mul i32 %912, -2
%914 = add i32 %909, %913
0
%915 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482169load addr-2147482169	block: 0
%916 = getelementptr i32, i32* %915, i32 0
%917 = load i32, i32* %916
%918 = mul i32 %917, 65
%919 = add i32 %914, %918
2
%920 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147482161load addr-2147482161	block: 0
%921 = getelementptr i32, i32* %920, i32 2
%922 = load i32, i32* %921
%923 = mul i32 %922, 120
%924 = add i32 %919, %923
4
%925 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482153load addr-2147482153	block: 0
%926 = getelementptr i32, i32* %925, i32 4
%927 = load i32, i32* %926
%928 = mul i32 %927, -13
%929 = add i32 %924, %928
6
%930 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147482144load addr-2147482144	block: 0
%931 = getelementptr i32, i32* %930, i32 6
%932 = load i32, i32* %931
%933 = mul i32 %932, 18
%934 = add i32 %929, %933
8
%935 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147482136load addr-2147482136	block: 0
%936 = getelementptr i32, i32* %935, i32 8
%937 = load i32, i32* %936
%938 = mul i32 %937, 5
%939 = add i32 %934, %938
0
%940 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482130load addr-2147482130	block: 0
%941 = getelementptr i32, i32* %940, i32 0
%942 = load i32, i32* %941
%943 = mul i32 %942, 104
%944 = add i32 %939, %943
3
%945 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147482122load addr-2147482122	block: 0
%946 = getelementptr i32, i32* %945, i32 3
%947 = load i32, i32* %946
%948 = mul i32 %947, -119
%949 = add i32 %944, %948
6
%950 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147482113load addr-2147482113	block: 0
%951 = getelementptr i32, i32* %950, i32 6
%952 = load i32, i32* %951
%953 = mul i32 %952, -7
%954 = add i32 %949, %953
9
%955 = load i32* , i32* * %2
This is a const:null value = 9in address:-2147482104load addr-2147482104	block: 0
%956 = getelementptr i32, i32* %955, i32 9
%957 = load i32, i32* %956
%958 = mul i32 %957, 71
%959 = add i32 %954, %958
12
%960 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147482096load addr-2147482096	block: 0
%961 = getelementptr i32, i32* %960, i32 12
%962 = load i32, i32* %961
%963 = mul i32 %962, 107
%964 = add i32 %959, %963
0
%965 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482090load addr-2147482090	block: 0
%966 = getelementptr i32, i32* %965, i32 0
%967 = load i32, i32* %966
%968 = mul i32 %967, 24
%969 = add i32 %964, %968
4
%970 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147482082load addr-2147482082	block: 0
%971 = getelementptr i32, i32* %970, i32 4
%972 = load i32, i32* %971
%973 = mul i32 %972, 82
%974 = add i32 %969, %973
8
%975 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147482074load addr-2147482074	block: 0
%976 = getelementptr i32, i32* %975, i32 8
%977 = load i32, i32* %976
%978 = mul i32 %977, -96
%979 = add i32 %974, %978
12
%980 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147482065load addr-2147482065	block: 0
%981 = getelementptr i32, i32* %980, i32 12
%982 = load i32, i32* %981
%983 = mul i32 %982, -104
%984 = add i32 %979, %983
16
%985 = load i32* , i32* * %2
This is a const:null value = 16in address:-2147482056load addr-2147482056	block: 0
%986 = getelementptr i32, i32* %985, i32 16
%987 = load i32, i32* %986
%988 = mul i32 %987, -121
%989 = add i32 %984, %988
0
%990 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482049load addr-2147482049	block: 0
%991 = getelementptr i32, i32* %990, i32 0
%992 = load i32, i32* %991
%993 = mul i32 %992, 65
%994 = add i32 %989, %993
5
%995 = load i32* , i32* * %2
This is a const:null value = 5in address:-2147482041load addr-2147482041	block: 0
%996 = getelementptr i32, i32* %995, i32 5
%997 = load i32, i32* %996
%998 = mul i32 %997, 97
%999 = add i32 %994, %998
10
%1000 = load i32* , i32* * %2
This is a const:null value = 10in address:-2147482033load addr-2147482033	block: 0
%1001 = getelementptr i32, i32* %1000, i32 10
%1002 = load i32, i32* %1001
%1003 = mul i32 %1002, 83
%1004 = add i32 %999, %1003
15
%1005 = load i32* , i32* * %2
This is a const:null value = 15in address:-2147482025load addr-2147482025	block: 0
%1006 = getelementptr i32, i32* %1005, i32 15
%1007 = load i32, i32* %1006
%1008 = mul i32 %1007, 46
%1009 = add i32 %1004, %1008
20
%1010 = load i32* , i32* * %2
This is a const:null value = 20in address:-2147482017load addr-2147482017	block: 0
%1011 = getelementptr i32, i32* %1010, i32 20
%1012 = load i32, i32* %1011
%1013 = mul i32 %1012, -84
%1014 = add i32 %1009, %1013
%1015 = call i32 @relu_reg(i32 %1014)
%1016 = mul i32 %1015, -50
%1017 = add i32 %890, %1016
0
%1018 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147482008load addr-2147482008	block: 0
%1019 = getelementptr i32, i32* %1018, i32 0
%1020 = load i32, i32* %1019
%1021 = mul i32 %1020, -29
1
%1022 = load i32* , i32* * %2
This is a const:null value = 1in address:-2147481999load addr-2147481999	block: 0
%1023 = getelementptr i32, i32* %1022, i32 1
%1024 = load i32, i32* %1023
%1025 = mul i32 %1024, 7
%1026 = add i32 %1021, %1025
2
%1027 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147481991load addr-2147481991	block: 0
%1028 = getelementptr i32, i32* %1027, i32 2
%1029 = load i32, i32* %1028
%1030 = mul i32 %1029, -70
%1031 = add i32 %1026, %1030
3
%1032 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147481982load addr-2147481982	block: 0
%1033 = getelementptr i32, i32* %1032, i32 3
%1034 = load i32, i32* %1033
%1035 = mul i32 %1034, 38
%1036 = add i32 %1031, %1035
4
%1037 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147481974load addr-2147481974	block: 0
%1038 = getelementptr i32, i32* %1037, i32 4
%1039 = load i32, i32* %1038
%1040 = mul i32 %1039, -90
%1041 = add i32 %1036, %1040
0
%1042 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147481967load addr-2147481967	block: 0
%1043 = getelementptr i32, i32* %1042, i32 0
%1044 = load i32, i32* %1043
%1045 = mul i32 %1044, -15
%1046 = add i32 %1041, %1045
2
%1047 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147481958load addr-2147481958	block: 0
%1048 = getelementptr i32, i32* %1047, i32 2
%1049 = load i32, i32* %1048
%1050 = mul i32 %1049, -32
%1051 = add i32 %1046, %1050
4
%1052 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147481949load addr-2147481949	block: 0
%1053 = getelementptr i32, i32* %1052, i32 4
%1054 = load i32, i32* %1053
%1055 = mul i32 %1054, 37
%1056 = add i32 %1051, %1055
6
%1057 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147481941load addr-2147481941	block: 0
%1058 = getelementptr i32, i32* %1057, i32 6
%1059 = load i32, i32* %1058
%1060 = mul i32 %1059, 36
%1061 = add i32 %1056, %1060
8
%1062 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147481933load addr-2147481933	block: 0
%1063 = getelementptr i32, i32* %1062, i32 8
%1064 = load i32, i32* %1063
%1065 = mul i32 %1064, -62
%1066 = add i32 %1061, %1065
0
%1067 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147481926load addr-2147481926	block: 0
%1068 = getelementptr i32, i32* %1067, i32 0
%1069 = load i32, i32* %1068
%1070 = mul i32 %1069, -125
%1071 = add i32 %1066, %1070
3
%1072 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147481917load addr-2147481917	block: 0
%1073 = getelementptr i32, i32* %1072, i32 3
%1074 = load i32, i32* %1073
%1075 = mul i32 %1074, -46
%1076 = add i32 %1071, %1075
6
%1077 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147481908load addr-2147481908	block: 0
%1078 = getelementptr i32, i32* %1077, i32 6
%1079 = load i32, i32* %1078
%1080 = mul i32 %1079, -70
%1081 = add i32 %1076, %1080
9
%1082 = load i32* , i32* * %2
This is a const:null value = 9in address:-2147481899load addr-2147481899	block: 0
%1083 = getelementptr i32, i32* %1082, i32 9
%1084 = load i32, i32* %1083
%1085 = mul i32 %1084, 37
%1086 = add i32 %1081, %1085
12
%1087 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147481891load addr-2147481891	block: 0
%1088 = getelementptr i32, i32* %1087, i32 12
%1089 = load i32, i32* %1088
%1090 = mul i32 %1089, -73
%1091 = add i32 %1086, %1090
0
%1092 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147481884load addr-2147481884	block: 0
%1093 = getelementptr i32, i32* %1092, i32 0
%1094 = load i32, i32* %1093
%1095 = mul i32 %1094, -34
%1096 = add i32 %1091, %1095
4
%1097 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147481875load addr-2147481875	block: 0
%1098 = getelementptr i32, i32* %1097, i32 4
%1099 = load i32, i32* %1098
%1100 = mul i32 %1099, -87
%1101 = add i32 %1096, %1100
8
%1102 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147481866load addr-2147481866	block: 0
%1103 = getelementptr i32, i32* %1102, i32 8
%1104 = load i32, i32* %1103
%1105 = mul i32 %1104, -75
%1106 = add i32 %1101, %1105
12
%1107 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147481857load addr-2147481857	block: 0
%1108 = getelementptr i32, i32* %1107, i32 12
%1109 = load i32, i32* %1108
%1110 = mul i32 %1109, 71
%1111 = add i32 %1106, %1110
16
%1112 = load i32* , i32* * %2
This is a const:null value = 16in address:-2147481849load addr-2147481849	block: 0
%1113 = getelementptr i32, i32* %1112, i32 16
%1114 = load i32, i32* %1113
%1115 = mul i32 %1114, -77
%1116 = add i32 %1111, %1115
0
%1117 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147481842load addr-2147481842	block: 0
%1118 = getelementptr i32, i32* %1117, i32 0
%1119 = load i32, i32* %1118
%1120 = mul i32 %1119, 53
%1121 = add i32 %1116, %1120
5
%1122 = load i32* , i32* * %2
This is a const:null value = 5in address:-2147481834load addr-2147481834	block: 0
%1123 = getelementptr i32, i32* %1122, i32 5
%1124 = load i32, i32* %1123
%1125 = mul i32 %1124, 37
%1126 = add i32 %1121, %1125
10
%1127 = load i32* , i32* * %2
This is a const:null value = 10in address:-2147481826load addr-2147481826	block: 0
%1128 = getelementptr i32, i32* %1127, i32 10
%1129 = load i32, i32* %1128
%1130 = mul i32 %1129, -103
%1131 = add i32 %1126, %1130
15
%1132 = load i32* , i32* * %2
This is a const:null value = 15in address:-2147481817load addr-2147481817	block: 0
%1133 = getelementptr i32, i32* %1132, i32 15
%1134 = load i32, i32* %1133
%1135 = mul i32 %1134, -13
%1136 = add i32 %1131, %1135
20
%1137 = load i32* , i32* * %2
This is a const:null value = 20in address:-2147481808load addr-2147481808	block: 0
%1138 = getelementptr i32, i32* %1137, i32 20
%1139 = load i32, i32* %1138
%1140 = mul i32 %1139, -114
%1141 = add i32 %1136, %1140
%1142 = call i32 @relu_reg(i32 %1141)
%1143 = mul i32 %1142, -23
%1144 = add i32 %1017, %1143
0
%1145 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147481799load addr-2147481799	block: 0
%1146 = getelementptr i32, i32* %1145, i32 0
%1147 = load i32, i32* %1146
%1148 = mul i32 %1147, 67
1
%1149 = load i32* , i32* * %2
This is a const:null value = 1in address:-2147481791load addr-2147481791	block: 0
%1150 = getelementptr i32, i32* %1149, i32 1
%1151 = load i32, i32* %1150
%1152 = mul i32 %1151, 42
%1153 = add i32 %1148, %1152
2
%1154 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147481783load addr-2147481783	block: 0
%1155 = getelementptr i32, i32* %1154, i32 2
%1156 = load i32, i32* %1155
%1157 = mul i32 %1156, 41
%1158 = add i32 %1153, %1157
3
%1159 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147481775load addr-2147481775	block: 0
%1160 = getelementptr i32, i32* %1159, i32 3
%1161 = load i32, i32* %1160
%1162 = mul i32 %1161, -123
%1163 = add i32 %1158, %1162
4
%1164 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147481766load addr-2147481766	block: 0
%1165 = getelementptr i32, i32* %1164, i32 4
%1166 = load i32, i32* %1165
%1167 = mul i32 %1166, -92
%1168 = add i32 %1163, %1167
0
%1169 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147481759load addr-2147481759	block: 0
%1170 = getelementptr i32, i32* %1169, i32 0
%1171 = load i32, i32* %1170
%1172 = mul i32 %1171, 10
%1173 = add i32 %1168, %1172
2
%1174 = load i32* , i32* * %2
This is a const:null value = 2in address:-2147481751load addr-2147481751	block: 0
%1175 = getelementptr i32, i32* %1174, i32 2
%1176 = load i32, i32* %1175
%1177 = mul i32 %1176, -77
%1178 = add i32 %1173, %1177
4
%1179 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147481742load addr-2147481742	block: 0
%1180 = getelementptr i32, i32* %1179, i32 4
%1181 = load i32, i32* %1180
%1182 = mul i32 %1181, 75
%1183 = add i32 %1178, %1182
6
%1184 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147481734load addr-2147481734	block: 0
%1185 = getelementptr i32, i32* %1184, i32 6
%1186 = load i32, i32* %1185
%1187 = mul i32 %1186, 96
%1188 = add i32 %1183, %1187
8
%1189 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147481726load addr-2147481726	block: 0
%1190 = getelementptr i32, i32* %1189, i32 8
%1191 = load i32, i32* %1190
%1192 = mul i32 %1191, -51
%1193 = add i32 %1188, %1192
0
%1194 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147481719load addr-2147481719	block: 0
%1195 = getelementptr i32, i32* %1194, i32 0
%1196 = load i32, i32* %1195
%1197 = mul i32 %1196, 109
%1198 = add i32 %1193, %1197
3
%1199 = load i32* , i32* * %2
This is a const:null value = 3in address:-2147481711load addr-2147481711	block: 0
%1200 = getelementptr i32, i32* %1199, i32 3
%1201 = load i32, i32* %1200
%1202 = mul i32 %1201, -74
%1203 = add i32 %1198, %1202
6
%1204 = load i32* , i32* * %2
This is a const:null value = 6in address:-2147481702load addr-2147481702	block: 0
%1205 = getelementptr i32, i32* %1204, i32 6
%1206 = load i32, i32* %1205
%1207 = mul i32 %1206, -7
%1208 = add i32 %1203, %1207
9
%1209 = load i32* , i32* * %2
This is a const:null value = 9in address:-2147481693load addr-2147481693	block: 0
%1210 = getelementptr i32, i32* %1209, i32 9
%1211 = load i32, i32* %1210
%1212 = mul i32 %1211, -122
%1213 = add i32 %1208, %1212
12
%1214 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147481684load addr-2147481684	block: 0
%1215 = getelementptr i32, i32* %1214, i32 12
%1216 = load i32, i32* %1215
%1217 = mul i32 %1216, 67
%1218 = add i32 %1213, %1217
0
%1219 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147481678load addr-2147481678	block: 0
%1220 = getelementptr i32, i32* %1219, i32 0
%1221 = load i32, i32* %1220
%1222 = mul i32 %1221, 47
%1223 = add i32 %1218, %1222
4
%1224 = load i32* , i32* * %2
This is a const:null value = 4in address:-2147481670load addr-2147481670	block: 0
%1225 = getelementptr i32, i32* %1224, i32 4
%1226 = load i32, i32* %1225
%1227 = mul i32 %1226, 22
%1228 = add i32 %1223, %1227
8
%1229 = load i32* , i32* * %2
This is a const:null value = 8in address:-2147481662load addr-2147481662	block: 0
%1230 = getelementptr i32, i32* %1229, i32 8
%1231 = load i32, i32* %1230
%1232 = mul i32 %1231, -68
%1233 = add i32 %1228, %1232
12
%1234 = load i32* , i32* * %2
This is a const:null value = 12in address:-2147481653load addr-2147481653	block: 0
%1235 = getelementptr i32, i32* %1234, i32 12
%1236 = load i32, i32* %1235
%1237 = mul i32 %1236, 38
%1238 = add i32 %1233, %1237
16
%1239 = load i32* , i32* * %2
This is a const:null value = 16in address:-2147481645load addr-2147481645	block: 0
%1240 = getelementptr i32, i32* %1239, i32 16
%1241 = load i32, i32* %1240
%1242 = mul i32 %1241, 29
%1243 = add i32 %1238, %1242
0
%1244 = load i32* , i32* * %2
This is a const:null value = 0in address:-2147481639load addr-2147481639	block: 0
%1245 = getelementptr i32, i32* %1244, i32 0
%1246 = load i32, i32* %1245
%1247 = mul i32 %1246, 115
%1248 = add i32 %1243, %1247
5
%1249 = load i32* , i32* * %2
This is a const:null value = 5in address:-2147481631load addr-2147481631	block: 0
%1250 = getelementptr i32, i32* %1249, i32 5
%1251 = load i32, i32* %1250
%1252 = mul i32 %1251, -121
%1253 = add i32 %1248, %1252
10
%1254 = load i32* , i32* * %2
This is a const:null value = 10in address:-2147481622load addr-2147481622	block: 0
%1255 = getelementptr i32, i32* %1254, i32 10
%1256 = load i32, i32* %1255
%1257 = mul i32 %1256, 36
%1258 = add i32 %1253, %1257
15
%1259 = load i32* , i32* * %2
This is a const:null value = 15in address:-2147481614load addr-2147481614	block: 0
%1260 = getelementptr i32, i32* %1259, i32 15
%1261 = load i32, i32* %1260
%1262 = mul i32 %1261, -49
%1263 = add i32 %1258, %1262
20
%1264 = load i32* , i32* * %2
This is a const:null value = 20in address:-2147481605load addr-2147481605	block: 0
%1265 = getelementptr i32, i32* %1264, i32 20
%1266 = load i32, i32* %1265
%1267 = mul i32 %1266, 85
%1268 = add i32 %1263, %1267
%1269 = call i32 @relu_reg(i32 %1268)
%1270 = mul i32 %1269, 46
%1271 = add i32 %1144, %1270
%1272 = icmp sgt i32 %1271, 0
br i1 %1272, label %1273, label %1275
1273:
ret i32 1
1274:
br label %1275
1275:
ret i32 0
}
define dso_local i32 @main(){
%1 = call i32 @getint()
%2 = alloca i32 
store i32 %1, i32* %2
%3 = alloca [ 25 x i32 ]
br label %4
4:
%5 = load i32, i32* %2
%6 = icmp sgt i32 %5, 0
br i1 %6, label %7, label %39
7:
%8 = alloca i32 
store i32 0, i32* %8
br label %9
9:
%10 = load i32, i32* %8
%11 = icmp slt i32 %10, 5
br i1 %11, label %12, label %30
12:
%13 = alloca i32 
store i32 0, i32* %13
br label %14
14:
%15 = load i32, i32* %13
%16 = icmp slt i32 %15, 5
br i1 %16, label %17, label %27
17:
%18 = load i32, i32* %8
%19 = load i32, i32* %13
%20 = mul i32 %18, 0
%21 = add i32 %20, 0
%22 = add i32 %19, %21
%23 = call i32 @getint()
%24 = getelementptr[ 25 x i32 ],[25 x i32 ]* %3, i32 0, i32 %22
store i32 %23, i32* %24
%25 = load i32, i32* %13
%26 = add i32 %25, 1
store i32 %26, i32* %13
br label %14
27:
%28 = load i32, i32* %8
%29 = add i32 %28, 1
store i32 %29, i32* %8
br label %9
30:
0
%31 = getelementptr[ 25 x i32 ],[25 x i32 ]* %3, i32 0, i32 0
%32 = call i32 @model(i32 * %31)
%33 = icmp ne i32 %32, 0
br i1 %33, label %34, label %35
34:
call void @putch(i32 99)
call void @putch(i32 97)
call void @putch(i32 116)
call void @putch(i32 10)
br label %36
35:
call void @putch(i32 100)
call void @putch(i32 111)
call void @putch(i32 103)
call void @putch(i32 10)
br label %36
36:
%37 = load i32, i32* %2
%38 = sub i32 %37, 1
store i32 %38, i32* %2
br label %4
39:
ret i32 0
}
