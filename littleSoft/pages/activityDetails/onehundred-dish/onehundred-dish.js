import { GLOBAL_API_DOMAIN } from '../../../utils/config/config.js';
import Api from '../../../utils/config/api.js';
var utils = require('../../../utils/util.js');
var app = getApp();
Page({
  data: {
    _build_url: GLOBAL_API_DOMAIN,
    actId: 37,     //活动id
    city: "十堰",
    issnap: false,
    switchTab: true,
    flag: true,
    page: 1,
    stage: 1,
    dishLish: [],
    playerList: [],
    sortType: 1
  },
  onLoad: function (options) {
    let dateStr = new Date();
    let milisecond = new Date(this.dateConv(dateStr)).getTime() + 86400000;
    this.setData({
      // actId: options.id
      actId: 37,
      today: this.dateConv(dateStr),
      tomorrow: this.dateConv(new Date(milisecond))
    });
  },
  onShow: function () {
    this.actInfo();
    this.getDishList();
  },
  actInfo: function () {   //活动简介
    let _parms = {
      id: this.data.actId,
      // userId: app.globalData.userInfo.userId,
      // userName: app.globalData.userInfo.userName,
      userId: 32879,
      userName: '15072329516',
      sourceType: '1'
    }
    Api.actdetail(_parms).then((res) => {
      let startTime = res.data.data.startTime,
        endTime = res.data.data.endTime,
        stage = 1;
      startTime = startTime.substring(0, startTime.indexOf(" "));
      endTime = endTime.substring(0, endTime.indexOf(" "));
      if (startTime == '2018-08-01') {
        stage = 2;
      } else if (startTime == '2018-08-26') {
        stage = 3;
      }
      this.setData({
        stage: stage,
        mainPic: res.data.data.mainPic,
        infoPic: res.data.data.actUrl,
        actName: res.data.data.actName,
        actDesc: res.data.data.actDesc
      });
    });
  },
  eventDetailss: function () {  //活动详情
    wx.navigateTo({
      url: '../hot-activity/eventDetails/eventDetails?url=' + this.data.infoPic
    })
  },
  toApply: function () {    //跳转至报名页面
    if (app.globalData.userInfo.mobile == undefined || app.globalData.userInfo.mobile == '' || app.globalData.userInfo.mobile == null) {
      this.setData({
        issnap: true
      })
      return false
    }
    if (app.globalData.userInfo.userType == '2' && app.globalData.userInfo.shopId != '') {
      wx.showToast({
        title: '您是商家，请移步至商家端App报名',
        icon: 'none'
      })
    } else {
      let _parms = {
        refId: app.globalData.userInfo.userId,
        actId: this.data.actId,
        type: 1
      }
      Api.actisSign(_parms).then((res) => {
        let data = res.data;
        if (data.code == 0) {
          wx.navigateTo({
            url: '../hot-activity/apply-player/apply-player?id=' + this.data.actId + '&_actName=' + this.data.actName
          })
        } else {
          wx.showToast({
            title: data.message,
            icon: 'none'
          })
        }
      });
    }
  },
  bestSwitch(e) {   //最热最新切换
    this.setData({
      page: 1,
      flag: true,
      dishLish: [],
      sortType: e.target.id
    });
    this.getDishList();
  },
  getDishList() {    //获取列表数据
    let _parms = {
      actId: this.data.actId,
      beginTime: this.data.today,
      endTime: this.data.tomorrow,
      // voteUserId: app.globalData.userInfo.userId,
      voteUserId: 32879,
      sortType: this.data.sortType,
      city: this.data.city,
      page: this.data.page,
      rows: 2
    };
    Api.dishList(_parms).then((res) => {
      let data = res.data, list = data.data.list, dishLish = this.data.dishLish;
      if (data.code == 0) {
        wx.hideLoading();
        if (list != null && list != "" && list != []) {
          for (let i = 0; i < list.length; i++) {
            dishLish.push(list[i]);
          }
          this.setData({
            dishLish: dishLish
          });
        } else {
          this.setData({
            flag: false
          });
        }
      } else {
        wx.showToast({
          title: '系统繁忙',
          icon: 'none'
        })
      }
    });
  },
  getPlayerList() {
    let _parms = {
      actId: this.data.actId,
      beginTime: this.data.today,
      endTime: this.data.tomorrow,
      // voteUserId: app.globalData.userInfo.userId,
      voteUserId: 32879,
      sortType: this.data.sortType,
      city: this.data.city,
      page: this.data.page,
      rows: 2
    };
    Api.hotActPlayerList(_parms).then((res) => {
      let data = res.data, list = data.data.list, playerList = this.data.playerList;
      if (data.code == 0) {
        wx.hideLoading();
        if (list != null && list != "" && list != []) {
          for (let i = 0; i < list.length; i++) {
            playerList.push(list[i]);
          }
          this.setData({
            playerList: playerList
          });
        } else {
          this.setData({
            flag: false
          });
        }
      } else {
        wx.showToast({
          title: '系统繁忙',
          icon: 'none'
        })
      }
    });
  },
  dishTab(e) {
    this.setData({
      dishLish: [],
      playerList: [],
      page: 1,
      flag: true
    });
    let id = e.target.id;
    if (id == 1) {
      this.setData({
        switchTab: true
      });
      this.getDishList();
    } else if(id == 2) {
      this.setData({
        switchTab: false
      });
      this.getPlayerList();
    }
  },
  toDishDetail(e) {
    wx.navigateTo({
      url: '../dish-detail/dish-detail?actId=' + this.data.actId + '&skuId=' + e.target.id
    })
  },
  playerDetail(e) {
    wx.navigateTo({
      url: '../player-detail/player-detail?actId=' + this.data.actId +'&id=' + e.currentTarget.id
    })
  },
  onReachBottom: function () {  //用户上拉触底
    if (this.data.flag) {
      wx.showLoading({
        title: '加载中..'
      })
      this.setData({
        page: this.data.page + 1
      });
      if (this.data.switchTab) {
        this.getDishList();
      } else {
        this.getPlayerList();
      }
    }
  },
  onPullDownRefresh: function () {  //用户下拉刷新
    this.setData({
      dishLish: [],
      playerList: [],
      page: 1,
      flag: true
    });
    if (this.data.switchTab) {
      this.getDishList();
    } else {
      this.getPlayerList();
    }
  },
  dateConv: function (dateStr) {
    let year = dateStr.getFullYear(),
      month = dateStr.getMonth() + 1,
      today = dateStr.getDate();
    month = month > 9 ? month : "0" + month;
    today = today > 9 ? today : "0" + today;
    return year + "-" + month + "-" + today;
  },
  closetel: function (e) {
    let id = e.target.id;
    this.setData({
      issnap: false
    })
  }
})