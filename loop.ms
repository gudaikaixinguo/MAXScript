--控制MAXScript程序流程

--if 表达式
if<expr1>then<expr2>[else<expr3>]

if<expr1>do<expr2> --do形式的if表达式专门为Listener窗口执行if表达式设计的

--while do 循环
while<expr>do<expr>--while后面的<expr>为真，将重复执行do后面的<expr>。

如：
while (i>0) do (
    print x
    x+=1
)

--do while循环
do<expr>while<expr>--do循环因为在循环结尾执行while后面的<expr>，所以至少执行一次循环。

如：

do (
    print x
    x+=1
) while (i>0)

-- for循环
for<var_name>(in|=)<sequence>(do|collect)<expr>
其中<var_name>为循环索引变量名， <sequence>为循环的源数值，可以为以下几种形式：
<expr>to<expr>[by<expr>][where<expr>]--to前面的<expr>为循环初值，to后面的<expr>为循环终值，可选的by<expr>为每次循环的增量。默认的循环增量为1，可以为整数，浮点数，时间。
<expr>[where<expr>]--where后面的<expr>为一个序列集合，如数组或选择集。MAXScript可以使用几种选择集序列，包括路径名，当前选择对象集合，节点的子对象集，对象的修改器堆栈。

以上两种都有一个可选的where<expr>,其结果必须为True或False。where表达式在执行循环之间被求值，只有但它的结果为True时，才能执行循环。collect<expr>形式的for循环收集每次循环时<expr>的求值结果，并把它们存储在一个数组里，然后这个数组被作为for循环的返回值。如果在collect循环里同时指定 where表达式，仅收集那些符合 条件的表达式求值的结果。也可以使用一个特殊的值DontCollect来过滤那些不需要的循环结果。

如：

for i=1 to 10 do print i---打印数字序列
for item in [able] do i=i+item.height--打印数组序列
for t in of to loof by 5f do--以帧为单位的时间序列
for i in $Box* where i.height>100 collect i--将高度大于100的Box放到数组里

-- continue语句
用来在for,do,while循环中直接跳至循环末尾，然后开始下一次循环。

如：
for i=1 to 8 do(
    if i==5 do (
        continue;
        print i
    )
)

--eof为当到达为"随机输入"或"顺序输入"打开的文件结尾时，返回一个包含布尔值True的Integer。
while not eof f do (  --读入文件直到文件结尾
    local foo= readline f --读入一行
    if foo[1]=="_" do(  --如果为行首为_
        continue --跳过本行
        foo1 = parser1 foo --调用函数parser1
        processobjs foo1 --调用函数processobjs
    )
)

如果在一个for collect循环里执行 continue语句，本次循环的表达式结果 将不被收集到数组
中。如 for i = 1 to 8 collect(if i==5 do continue;i) 

--exit语句
用来在for,do,while循环中 提前退出循环，即使循环的条件为True。
exit[with<expr>]--其中可选的with<expr>让用户指定提前退出循环时 循环体的返回值。反之返回值为 undefined
for...do循环用此退出，返回值为ok
for...collect循环用此退出，返回值为退出前收集的元素组成的数组

如：
while x<y do (
    local foo = x-y
    if foo <=0 then exit
    $bar.pos.x = compute_x(bar/foo)
    x+=0.1
)

--try 表达式
一种异常处理机制，try表达式把一段代码放在一对括号中，可以捕捉该代码段里任何错误。
try<protected_expr>catch<on_err_expr>--其中protected_expr为要捕获运行异常的表达式，一旦发生运行错误，
on_err_expr将被执行。如果protected_expr为一个块表达式，执行将停在发生错误的哪一行，如果没有发生运行错误，on_err_expr将不被执行。

如：
f = openfile"foo.bat"
try 
    while not eof f do read_some_data f 
catch(
    messageBox"bad data in foo.dat" --当调用函数read_some_data()过程中发现的任何错误 将被捕捉到，系统将显示一个信息框
    results = undefined
)
close f