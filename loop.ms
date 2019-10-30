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


