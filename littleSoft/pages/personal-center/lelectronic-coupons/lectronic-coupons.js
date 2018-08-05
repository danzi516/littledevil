// import Api from '../../../utils/config/config.js';
import Api from '../../../utils/config/api.js'
import { GLOBAL_API_DOMAIN } from '../../../utils/config/config.js';
var app = getApp();
Page({
  data: {
    _build_url: GLOBAL_API_DOMAIN,
    qrCodeArr: [],     //二维码数组
    couponsArr: [],    //票券数组
    ticket:[],  //票券
    qrCodeFlag: true,   //二维码列表显示隐藏标识
    _skuNum: '',
    soid:'',  //点击的订单ID
    id:'',  //票券ID
    ismoldel:false,
    redfirst:'1',
    timer:'',
    amount:'',
    isticket:false,
    frequency:0,
    shopodrder:{}
  },
  onLoad: function (options) {
    console.log(options)
    let that = this;
    if(options.pay== 'pay'){  //从商家订单支付跳转过来的
      console.log("pay")
      this.getshopOrderList(options.soid);
    }else{
      if (options.myCount && options.myCount == 1) {
        wx.showLoading({
          title: '加载中',
        })
      }
      this.setData({
        id: options.id,
        soid: options.soid,
        myCount: options.myCount ? options.myCount : 0
      });
      if (options.cfrom) {
        this.setData({
          isticket: false
        })
        wx.setNavigationBarTitle({
          title: '订单详情'
        })
      } else {
        let int = setInterval(function () {
          that.getcodedetail();
        }, 2000);
        this.setData({
          isticket: true,
          timer: int
        })
      }
      this.getTicketInfo();
    }
  },

  onHide:function(){
    clearInterval(this.data.timer)
  },
  //二维码放大
  previewImg: function (e) {
    let that = this,
    idx = e.currentTarget.dataset.index;
    wx.previewImage({
      current: that.data.qrCodeArr[idx],     //当前图片地址
      urls: that.data.qrCodeArr,               //所有要预览的图片的地址集合 数组形式
      success: function (res) { },
      fail: function (res) { },
      complete: function (res) { },
    })
  },
  getcodedetail: function () { //获取票券详情
    let that = this;
    let freq = this.data.frequency;
    ++freq
    this.setData({
      frequency: freq
    })
    if (freq == 20){
      clearInterval(that.data.timer)
    }
    wx.request({
      url: this.data._build_url + 'cp/get/' + this.data.id,
      success: function (res) {
        let data = res.data;
        if(res.data.code == 0){
          let arr = [];
          arr.push(res.data.data)
          wx.hideLoading();
          that.setData({
            ticket: arr
          })
          if (res.data.data.isUsed != 0){
            clearInterval(that.data.timer)
            that.setData({
              ismoldel:true
            })
          }
        }
      }
    });
  },
  getredpacket:function () {//获取可领取的随机红包金额
    let that = this;
    let _parms = {
      userId: app.globalData.userInfo.userId,
      id: that.data.id
    }
    Api.redpacket(_parms).then((res) => {
      if (res.data.code == 0) {
        that.setData({
          amount:res.data.data
        })
      }
    })
  },
  getTicketInfo: function () { //获取平台订单详情
    let that = this;
    wx.request({
      url: that.data._build_url + 'so/getForOrder/' + that.data.soid,
      success: function (res) {
        let _skuNum = res.data.data.coupons
        for (let i = 0; i < _skuNum.length; i++) {
          let ncard = ''
          for (var n = 0; n < _skuNum[i].couponCode.length; n = n + 4) {
            ncard += _skuNum[i].couponCode.substring(n, n + 4) + " ";
          }
          _skuNum[i].couponCode = ncard.replace(/(\s*$)/g, "")
        }
        let data = res.data;
        if (data.code == 0) {
          let imgsArr = [];
          if (that.data.myCount == 1) {
            let couponsArr = [];
            for (let i = 0; i < data.data.coupons.length; i++) {
              if (data.data.coupons[i].isUsed == 0) {
                couponsArr.push(data.data.coupons[i]);
              }
            }
            that.setData({
              couponsArr: couponsArr
            });
          } else {
            that.setData({
              couponsArr: data.data.coupons
            });
          }
          for (let i = 0; i < that.data.couponsArr.length; i++) {
            imgsArr.push(that.data.couponsArr[i].qrcodeUrl);
          }
           data.data.userName =  data.data.userName.substr(0, 3) + "****" +  data.data.userName.substr(7)
          that.setData({
            ticketInfo: data.data,
            qrCodeArr: imgsArr,
            _skuNum: _skuNum
          });
        }
      }
    });
  },
  //点击更多收起按钮
  onclickMore: function () {
    this.setData({
      qrCodeFlag: !this.data.qrCodeFlag
    });
  },
  sublevelSum: function (event) {
    let that = this;
    wx.navigateTo({
      url: '../../index/voucher-details/voucher-details?id=' + that.data.ticketInfo.skuId + ' &sell=' + that.data.ticketInfo.unitPrice + '&inp=' + that.data.ticketInfo.coupons[0].couponAmount + '&rule=' + that.data.ticketInfo.coupons[0].promotionRules[0].ruleDesc + '&num=' + that.data.ticketInfo.skuNum
    })
  },
  
  clickmolbox:function(){  //关闭弹框
    if (this.data.redfirst == 2) {
      this.closemob();
    }
  },
  closemob: function () { //关闭弹框
    this.setData({
      ismoldel: false
    })
  },
  gowallet:function(){  //去钱包页面
    this.closemob();
    wx.redirectTo({
      url: '../myWallet/myWallet',
    })
  },
  clickcur:function(){ //点击货币图片，折包获取奖励
    let that = this;
    if (this.data.redfirst == 2){
      return false
    }
    this.setData({
      redfirst:2
    })
    that.getredpacket();
  },
   //获取商家订单信息
  getshopOrderList: function (soid) {      
    let that = this;
    let _parms = {
      userId: app.globalData.userInfo.userId,
      id:soid,
      soStatus:'2'
    };
    Api.myorderForShop(_parms).then((res) => {
      if(res.data.code == 0){
        this.setData({
          ticketInfo:res.data.data[0],
          isticket: false
        })
      }
    })
  }
})