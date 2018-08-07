//index.js 
import Api from '/../../utils/config/api.js';
import {
  GLOBAL_API_DOMAIN
} from '/../../utils/config/config.js';
var utils = require('../../utils/util.js')
var app = getApp();

Page({
  data: {
    _build_url: GLOBAL_API_DOMAIN,
    city: "",
    phone: '',
    verify: '', //输入的验证码
    verifyId: '', //后台返回的短信验证码
    veridyTime: '', //短信发送时间
    carousel: [], //轮播图
    business: [], //商家列表，推荐餐厅
    actlist: [], //热门活动
    hotlive: [], //热门直播
    food: [], //美食墙
    logs: [],
    topics: [], //专题
    restaurant: [], //菜系专题
    service: [], //服务专题
    alltopics: [],
    currentTab: 0,
    issnap: false, //是否是临时用户
    isNew: false, //是否新用户
    userGiftFlag: false, //新用户礼包是否隐藏
    isphoneNumber: false, //是否拿到手机号
    isfirst: false,
    istouqu: false,
    isclose: false,
    goto: false,
    navbar: ['菜系专题', '服务专题'],
    sort: ['川湘菜', '海鲜', '火锅', '烧烤', '西餐', '自助餐', '聚会', '商务', '约会'],
    activityImg: '', //活动图
    settime: null,
    rematime: '获取验证码',
    afirst: false,
    isclick: true
  },
  onShow: function() {
    let that = this,
      userInfo = app.globalData.userInfo;
    console.log(this.data);
    if (this.data.phone && this.data.veridyTime) {
      this.setData({
        userGiftFlag: false,
        isNew: true,
        isfirst: true,
        isphoneNumber: true
      })
    }
    if (userInfo.openId && userInfo.sessionKey && userInfo.unionId) {
      that.setData({
        istouqu: false
      })
      that.getmyuserinfo();
    } else {
      wx.login({
        success: res => {
          if (res.code) {
            let _parms = {
              code: res.code
            }
            console.log(res);
            wx.getUserInfo({
              success: res => {
                console.log(res);
                wx.request({
                  url: 'http://127.0.0.1:8080/littledevil/user/decodeUserInfo',
                  header: {
                    "content-type": "application/x-www-form-urlencoded"
                  },
                  method: "POST",
                  data: {
                    encryptedData: res.encryptedData,
                    iv: res.iv,
                    code: _parms.code
                  },
                  success: result=> {
                    console.log(result)
                  }
                })
              }
            })
            console.log(res.code);
            let that = this;
            /* Api.getOpenId(_parms).then((res) => {
               app.globalData.userInfo.openId = res.data.data.openId;
               app.globalData.userInfo.sessionKey = res.data.data.sessionKey;
               if (res.data.data.unionId) {
                 app.globalData.userInfo.unionId = res.data.data.unionId;
                 that.getmyuserinfo();
               } else {
                 that.findByCode();
                 wx.hideLoading();
               }
             })*/
          }
        }
      })
    }

    let lat = wx.getStorageSync('lat');
    let lng = wx.getStorageSync('lng');
    if (lat && lng) {
      setTimeout(function() {
        that.requestCityName(lat, lng);
        wx.removeStorageSync('lat');
        wx.removeStorageSync('lng');
      }, 500)
    } else {
      that.getlocation();
    }
  },
  onHide: function() {
    let that = this;
    clearInterval(that.data.settime)
    that.setData({
      userGiftFlag: false,
      isfirst: false,
      isNew: false
    });
  },
  getInvitationCode:function(){
    wx.request({
      url: "http://127.0.0.1:8080/littledevil/wxpay/getInvitationCode",
      header: {
        'content-type': 'application/x-www-form-urlencoded' // 默认值
      },
      method: "POST",
      data: {
        salemanId:1
      },
      success: (res) => {
       console.log(res)
     
      }
    })
  },
  applyCompany: function () {
    wx.request({
      url: "http://127.0.0.1:8080/littledevil/wxpay/applyCompany",
      header: {
        'content-type': 'application/x-www-form-urlencoded' // 默认值
      },
      method: "POST",
      data: {
        userId: 33,
        invitationCode: 747642
      },
      success: (res) => {
        console.log(res)

      }
    })
  },
  getlocation: function () { //获取用户位置
    let that = this
    let lat = '',
      lng = ''
    wx.getLocation({
      type: 'wgs84',
      success: function (res) {
        let latitude = res.latitude
        let longitude = res.longitude
        that.requestCityName(latitude, longitude);
      },
      fail: function (res) {
        let lat = '30.51597',
          lng = '114.34035';
        that.requestCityName(lat, lng);
      }
    })
  },
  requestCityName(lat, lng) { //获取当前城市
    app.globalData.userInfo.lat = lat
    app.globalData.userInfo.lng = lng
    wx.request({
      url: 'https://apis.map.qq.com/ws/geocoder/v1/?location=' + lat + "," + lng + "&key=4YFBZ-K7JH6-OYOS4-EIJ27-K473E-EUBV7",
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: (res) => {
        //this.getmoredata()        获取更多
        if (res.data.status == 0) {
          this.setData({
            city: res.data.result.address_component.city,
            alltopics: [],
            restaurant: [],
            service: []
          })
          app.globalData.userInfo.city = res.data.result.address_component.city
          app.globalData.picker = res.data.result.address_component
        }
      }
    })
  },
  getmoredata: function () { //获取更多数据
    this.getcarousel();
    this.getdata();
    this.getactlist();
    this.gethotlive();
    this.gettopic();
    this.gettoplistFor();
  }
})