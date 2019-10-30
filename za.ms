showProperties $ --显示所选的对象的属性
$ -- 名称标识符
print "hello" -- 可以不带括号，因为maxScript是弱类型语言

path = "C:\\Users\\gudai\\Desktop\\MAXScript\\renderCams"--不能使用path只读变量，可是使用path_gudai

定义数组有两种方法：
1. #()
2. #(<expr>,<expr>)


使用?获取求值的结果：x=?

注释用 -- 

使用Esc中断程序运行，使用全局变量EscapeEnable设置是否用Esc终止程序运行。



必须使用关键字max开始执行MAXScript命令
max file open --访问file菜单中的open命令
max sel ? --显示所有以sel开始的命令
max ? --显示所有命令


random 0 5 --输出0到5中的随机数


如下写法可以分成多行
a+b+c*f\--用\作为一行语句的结尾(注释语句除外)
+h*g


不能以数字开始命名变量,如:3foo
不是合法的字母数字字符,如:baz?或foo(8)
不能使用空格,如；a big number
不分大小写


创建一个盒子: Box()--必须在函数名后加(),这样MAXScript才能知道使用参数的默认值来创建对象
box length:20 width:10 height:50--如果指定参数就不用了加()

$Box:Box001 @ [0.000000,0.000000,0.000000]
--上面这段就是侦听窗口返回的语句，$Box:类似windowns系统中的路径名，区别就是MAXScript的路径是指一个特定的对象，而不是文件，路径名总是以$开始
--Box001就是对象名称
$Box001.name = "foo"--获取属性的方法就是变量名后加.符号,后跟属性名称name.
对象属性有以下几类：类属性，如box对象的.height,.width,.length;变形类属性,如.scale,.rotation,.position;通用属性，如.wireColor等;


有两种方法可以获取对象的所有参数。
1. showClass()函数--用来显示指定类的全部属性或指定属性的数据类型。
showClass<pattern_string>[:<stream>]
--<pattern_string>为一个可包含通配符的字符串，可以为3dsmax的类名,超类名，属性名。格式为"<class_name>[:<superclass_name>][.<property_name>]"
--:<stream>可选参数指定一个stream类(数据流)值，用来指定输出信息显示在哪里
showClass "box.* "


2. showProperties()函数--用来显示特定MAXWrapper类对象的属性。如果在场景中有一个具体的对象，可以用本函数取代showClass()函数，和showClass()函数不同，
本函数显示"动态属性"，这些属性存在于具体的对象中。如一个List_Controller里的次级Controller，或一个FFD_Modifier里被设置动画的控制点。
showProperties<maxwrapper_object>[<property_parttern>][to:<stream>]
--<maxwrapper_object>要检查的3dsmax对象,如果<maxwrapper_object>指定的是一个场景对象,如$box01,本函数仅显示对象的属性，不会显示Transform类Conrtroller，Modifier和赋给对象的Material等属性
--<property_parttern>可选参数，要检查的属性名通配符，如没有指定属性名通配符参数<property_parttern>，将显示指定对象的所有属性
--to:<stream>可选参数，stream类值，指定要将显示结果输出在哪里
showProperties $foo.bend



$Box001.wireColor = red --red,green,white,black,orange,yellow.brown为MAXScript定义好的颜色常量，还可以使用RGB值指定对象的颜色,如$Box001.wireColor = (color 0 0 55)
$Box001.pos = [0,-75,0]
$Box001.scale = [1.5,2,1.5]


move<name_obj>[(x,y,z)]--<name_obj>为对象名称，(x,y,z)为移动距离，这个函数是把对象在x,y,z方向各移动的偏移量。
在MAXScript中有3种方法旋转一个对象：欧拉角方法(euler angle),四分角方法(quaternion),角向轴方法(angleaxis)
为了执行一个旋转，必须先把旋转定义为一个旋转对象(rotation object),然后把这个旋转对象  应用到要旋转的对象上。
旋转对象的定义格式：rot_obj = eulerangles x y z--rot_obj为旋转对象，x y z为绕x y z轴旋转的角度，以度为单位。
rot_obj = eulerAngles 0 30 0 --名为rot_obj的旋转对象，绕y轴旋转30°
rotation foo rot_obj--把名为rot_obj的旋转对象 应用到foo对象上
rotate<name_obj>[(x,y,z)]--x,y,z方向各移动的偏移量。

addModifier obj_name(modifier_name<parameters>)--添加修改器格式
addModifier foo (Twist angle:30)

animate on 
(
    at time 0(foo.pos=[-100,0,0];foo.scale=[1,1,0.25])
    at time 100(foo.pos=[100,0,0];foo.scale=[1,1,5])
)


 有三种数据类型:1.基本数据类型;2.特殊数据类型;3.高级数据类型
 操作符 a==a; a!=b; <value>as<class>将数据转换成指定类型
方法 print<value>[to:<stream>][#noMap]--将指定的单个<value>打印到Listener窗口或指定的<filestream>，<stringstream>,<windowsstream>中，后跟一个回车符
<stream>等于(<filestream>|<stringstream>|<windowsstream>)
方法 format<format_string>{<value>}[to:<stream>]--将指定的一个或多个<value>打印到格式化到Listener窗口或指定的<filestream>，<stringstream>,<windowsstream>中
obj = $Box001
format "name:% pos:%\n" obj.name obj.pos
