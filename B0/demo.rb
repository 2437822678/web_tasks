
"你的文章将会被审核，请稍候刷新页面，如"
:布局<%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track' => true %>
<%= javascript_include_tag 'application', 'data-turbolinks-track' => true %> <%= csrf_meta_tags %>
    <% flash.each do |key,value| %>
      <div class="alert alert-<%= key %>"><%= value %> </div>
      <% end %>
 <%= yield %>《布局》

 文章列表
内容 标题 新建 反馈 编辑 删除 显示

首页 月份分类 科学 文化 艺术

标题 内容
审核结果 分类

评论 添加评论 所有评论 作者


















#!/usr/bin/ruby
$i=0
$k=0
$j=0
$h=0
$l=0
$m=0
$n=0
$w=0
#学生的id
nums = Array.new(100) { |e| e = e +1}

#学生的name
#组成学生姓名的26个字母
$name=Array['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
name1=$name.at(rand(26))
$a=name1
$name3=Array.new(0)#把100个同学的姓名信息输入数组中去
while $i<100 do#生成100个同学的姓名
  while $k<3 do#生成一个同学的姓名
    $name2=$name.at(rand(26))
    $a=$a+$name2
    $k +=1
  end
    $k=0
    $name3.push("#{$a}")
    $a=$name.at(rand(26))
    $i +=1
end

#学生的性别gender
$gender2=Array.new(0)#把学生的性别输入到数组中去
while $j<100 do#随机生成100个同学的性别
  $gender =Array["male  ","female"]
  $gender1=$gender.at(rand(2))
  $gender2.push("#{$gender1}")
  $j +=1
end

#学生的年龄age
$age=Array[15,16,17,18,19,20,21,22,23,24,25]
$age2=Array.new(0)#把学生的年龄输入到数组中去
while $h<100#随机生成100个同学的年龄（在15-25岁之间）
   $age1=$age.at(rand(10))
   $age2.push($age1)
   $h +=1
end

#生成一百个学生的全部信息
puts "一百个学生的全部信息:id;name;gender;age;"
while $m<100
  puts "id:"+"#{nums.at($m)}"+"  "+"name:"+"#{$name3.at($m)}"+"  "+"gender:"+"#{$gender2.at($m)}"+"  "+"age:"+"#{$age2.at($m)}"
  $m +=1
end

#提供增加、删除、改动.查询等功能
$student=Array.new(0)#把学生的全部信息输入到数组中去
while $n<100
  $student.push([nums.at($n),$name3.at($n),$gender2.at($n),$age2.at($n)])
  $n +=1
end

while $w<100
puts "如果想删除学生信息请输入1"
puts "如果想查询学生信息请输入2"
puts "如果想改动学生信息请输入3"
puts "通过id排序请输入4"
puts "通过age排序请输入5"
puts "通过name排序请输入6"
x=gets
x=x.to_i

if x==1
  $p=0
  $q=0
  puts "删除学生信息"
  puts "请输入所要删除学生信息的id:"
  id=gets
  while $q<$student.length
    if $student.at($q).at(0)==id.to_i
    $student.delete($student.at($q))
    end
    $q +=1
  end
  while $p<$student.length
    puts "#{$student.at($p).at(0)}"+"  "+"#{$student.at($p).at(1)}"+"  " +"#{$student.at($p).at(2)}"+"  "+"#{$student.at($p).at(3)}"
    $p +=1
  end
end

if x==2
  $r=0
  puts "查询学生信息"
  puts "请输入所要查询学生信息的id:"
  id=gets
  while $r<$student.length
    if $student.at($r).at(0)==id.to_i
      puts "#{$student.at($r).at(0)}"+"  "+"#{$student.at($r).at(1)}"+"  " +"#{$student.at($r).at(2)}"+"  "+"#{$student.at($r).at(3)}"
    end
    $r +=1
  end
end

if x==3
  $s=0
  puts "改动学生信息"
  puts "请输入所要改动学生信息的id:"
  id=gets
  while $s<$student.length
    if $student.at($s).at(0)==id.to_i
      puts "查询需要改动的学生信息"
      puts "#{$student.at($s).at(0)}"+"  "+"#{$student.at($s).at(1)}"+"  " +"#{$student.at($s).at(2)}"+"  "+"#{$student.at($s).at(3)}"
      puts "请输入该学生改动过的id;name;gender;age"
      puts "id:"
      id1=gets
      puts "name"
      name1=gets
      puts "gender"
      gender1=gets
      puts "age"
      age1=gets
      $student.at($s).at(0)==id1.to_i
      $student.at($s).at(1)==name1
      $student.at($s).at(2)==gender1
      $student.at($s).at(3)==age1.to_i
      puts id1.chomp+"  "+name1.chomp+"  " +gender1.chomp+"  "+age1.chomp
    end
    $s +=1
  end
end

if x==4#通过id排序
  $t=0
  $student.sort
  while $t<$student.length
     puts "#{$student.at($t).at(0)}"+"  "+"#{$student.at($t).at(1)}"+"  " +"#{$student.at($t).at(2)}"+"  "+"#{$student.at($t).at(3)}"
     $t +=1
  end
end

if x==5#通过age排序
  $u=0
  $student=$student.sort{|z,y| z[3]<=>y[3]}
  while $u<$student.length
    puts "#{$student.at($u).at(0)}"+"  "+"#{$student.at($u).at(1)}"+"  " +"#{$student.at($u).at(2)}"+"  "+"#{$student.at($u).at(3)}"
    $u +=1
  end
end

if x==6#通过name排序
  $v=0
  $student=$student.sort{|z,y| z[1]<=>y[1]}
  while $v<$student.length
    puts "#{$student.at($v).at(0)}"+"  "+"#{$student.at($v).at(1)}"+"  " +"#{$student.at($v).at(2)}"+"  "+"#{$student.at($v).at(3)}"
    $v+=1
  end
end
  $w +=1
end
