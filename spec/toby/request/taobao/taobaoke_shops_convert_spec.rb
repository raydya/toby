# encoding: utf-8

require "spec_helper"

describe Toby::Request::Taobao::TaobaokeShopsConvert do
  include_context "initialize client"

  it "should return a taoboke shop list" do
    request = Toby::Request.create("taobao.taobaoke.shops.convert")
    request.seller_nicks = "jiezhixin8"

    @client.stub(:request).and_return(fixture("taobao/taobaoke_shops_convert.json"))
    shops = @client.execute(request)

    shops.first.shop_title.should eq "一米阳光官方旗舰店"
  end
end
