1:前台用户可以发表文章，编辑和删除自己的文章，可以在自己的页面和别人的页面下留言，但是不能编辑和删除自己的文章

2:前台用户编辑文章的时候可以编辑自己的文章属于哪一类（科学、文化、艺术）

3：前台用户可以按月份查看文章

4：用户提交的所有留言都会在后台被审核，如果审核通过文章将会显示在页面上

5：用户登录使用session机制

6：密码使用加密功能

7：后台管理员可以查看所有的留言和文章，不论是审核通过的还是没有通过的

8：后台和前台一样可以都可以分类查看文章

9：后台和前台用户的email都是唯一的

10：前台可以反馈，后台可以查看相应的反馈

11：所有的错误均有错误提示

12：美化页面用的模板直接是从bootstrap上下载的

# 数据结构表
## 1:用户表users
字段名|类型|描述|限定条件
--|--|--|--
id|int|用户id|无
username|string|用户帐号|字符长0-20
password|string|用户密码|字符长0-20
email|string|用户email|要为邮箱正确格式，且唯一
注释：

主键：id

关联：has_many :posts

关联：has_many :feedbacks
##  2:管理员账户表admins
字段名|类型|描述|限定条件
--|--|--|--
id|int|管理员id|无
adminname|string|管理员帐号|字符长0-20
password|string|管理员密码|字符长0-20
email|string|管理员email|要为邮箱正确格式，且唯一

注释：

主键：id

## 3:文章表posts
字段名|类型|描述|限定条件
--|--|--|--
id|int|文章id|无
content|text|文章内容|不少于50字
title|string|文章标题|不为空
type|string|文章类型|要输入几种特定的类型才能检索
check|string|审核结果|pass或fail
author|string|文章作者|字符长0-20
created_at|Date|创建日期|自动生成

注释:

主键：id

外键：user_id

索引：title,type,author,created_at

关联：blongs_to :user

关联：has_many :comments

## 4:留言表comments

字段名|类型|描述|限定条件
--|--|--|--
id|int|留言id|无
content|text|留言内容|不为空
author|string|留言作者|字符长0-20
check|string|审核结果|pass或fail
created_at|Date|创建日期|自动生成

注释:

主键：id

外键：post_id

索引：author,created_at

关联：blongs_to :post

## 5:反馈表feedbacks

字段名|类型|描述|限定条件
--|--|--|--
id|int|反馈id|无
contents|text|反馈内容|不少于10字
author|string|反馈作者|字符长0-20
created_at|Date|创建日期|自动生成

注释:

主键：id

外键：user_id

索引：author

关联：blongs_to :user
