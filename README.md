# Toby [![Build Status](https://secure.travis-ci.org/yesmeck/toby.png)](http://travis-ci.org/yesmeck/toby) [![Dependency Status](https://gemnasium.com/yesmeck/toby.png)](https://gemnasium.com/yesmeck/toby)

Ruby 版淘宝 API SDK，目前只实现了几个我自己需要用到的接口，不过要扩展也很容易，欢迎 fork。

## 安装

```
gem install toby
```

## 示例

### taobao.item.get 得到单个商品信息

```ruby
require "toby"

client = Toby::Client.new(:app_key => APP_KEY, :app_secret => APP_SECRET)
request = Toby::Request.create("taobao.item.get")
request.num_iid = 13364998803
# 默认获取所有 fields
request.fields = "detail_url,num_iid,title,nick,type,cid,seller_cids,pic_url,num,location,price"
item = client.execute(request)
=> #<Hashie::Mash cid=50010368 detail_url="http://item.taobao.com/item.htm?id=13364998803&spm=2014.12350568.0.0" location=#<Hashie::Mash city="嘉兴" state="浙江"> nick="勍杰旗舰店" num=992342 num_iid=13364998803 pic_url="http://img01.taobaocdn.com/bao/uploaded/i1/T1NV6JXltiXXbNURc1_042147.jpg" price="100.00" seller_cids=",469730817,437939819,437939818,441075878,437938900,437938899,437938898," title="正品开车防炫目司机墨镜太阳镜夜视镜偏光镜夹片钓鱼近视眼镜男女" type="fixed">
```

### taobao.taobaoke.items.get 批量获取淘宝客商品信息

```ruby
request = Toby::Request.create("taobao.taobaoke.items.get")
request.cid = 50020808
items = client.execute(request)
items.each do |item|
  puts item.title
end
# 如果淘宝返回的的结果中有 total_results
puts items.total_results
```

更多例子可以看 [spec](https://github.com/yesmeck/toby/tree/master/spec/toby/request) 。

## 更新日志

https://github.com/yesmeck/toby/blob/master/CHANGELOG.md

## 授权

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                   Version 2, December 2004

Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

Everyone is permitted to copy and distribute verbatim or modified
copies of this license document, and changing it is allowed as long
as the name is changed.
```
           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
```
 0. You just DO WHAT THE FUCK YOU WANT TO.

