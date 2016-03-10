// 导航栏配置文件
var outlookbar=new outlook();
var t;

t=outlookbar.addtitle('商品管理','商品管理',1)
outlookbar.additem('添加商品',t,'addpros.jsp')
outlookbar.additem('商品管理',t,'pros.jsp')



t=outlookbar.addtitle('商铺信息','商铺信息',1)
outlookbar.additem('基本资料管理',t,'pupdatesysusers.jsp')
outlookbar.additem('修改登录密码',t,'updatepwd.jsp')



t=outlookbar.addtitle('交易信息','交易信息',1)
outlookbar.additem('查看订单',t,'orderss.jsp')
outlookbar.additem('历史订单',t,'orderssls.jsp')



