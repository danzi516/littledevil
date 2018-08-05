import { GLOBAL_API_DOMAIN } from '../../../utils/config/config.js';
import Api from '../../../utils/config/api.js';
var utils = require('../../../utils/util.js');
var app = getApp();
Page({
  data: {
    _build_url: GLOBAL_API_DOMAIN,
    actId: 0,
    userId: 0,
    // voteUserId: app.globalData.userInfo.userId,
    voteUserId: 32879,
    refId: 0,
    nickName: '',
    bgUrl: '',
    iconUrl: '',
    sex: 0,
    age: 0,
    height: 0,
    userCode: 0,
    voteNum: 0,
    isVote: 0,    //是否投票1是0否
    picUrls: [],
    article: [],
    articleNum: 0,
    comment_list: [],
    totalComment: 0,
    isComment: false,
    commentVal: '',
    availableNum: 0,    //可用票数
    cmtdata: []
  },
  onLoad: function (options) {
    let dateStr = new Date();
    let milisecond = new Date(this.dateConv(dateStr)).getTime() + 86400000;
    this.setData({
      actId: options.actId,
      userId: options.id,
      today: this.dateConv(dateStr),
      tomorrow: this.dateConv(new Date(milisecond))
    });
    this.playerDetail();
    this.articleList();
  },
  onShow: function () {

  },
  playerDetail() {
    let _parms = {
      actId: this.data.actId,
      beginTime: this.data.today,
      endTime: this.data.tomorrow,
      voteUserId: this.data.voteUserId,
      userId: this.data.userId
    };
    Api.playerDetails(_parms).then((res) => {
      if (res.data.code == 0) {
        let data = res.data.data;
        this.setData({
          refId: data.id,
          nickName: data.nickName,
          iconUrl: data.iconUrl,
          sex: data.sex,
          age: data.age,
          height: data.height,
          userCode: data.userCode,
          voteNum: data.voteNum,
          picUrls: data.picUrls,
          isVote: data.isVote
        });
        this.comment();
        for (let i = 0; i < data.picUrls.length; i++) {
          if (data.picUrls[i].smallPicUrl) {
            this.setData({
              bgUrl: data.picUrls[i].picUrl
            });
            return false;
          }
        }
      } else {
        wx.showToast({
          title: '系统繁忙',
          icon: 'none'
        })
      }
    });
  },
  articleList() {
    let _parms = {
      userId: this.data.userId,
      page: 1,
      rows: 10
    };
    Api.myArticleList(_parms).then((res) => {
      let data = res.data;
      if(res.data.code == 0) {
        this.setData({
          article: res.data.data.list,
          articleNum: res.data.data.total
        });
      } 
    });
  },
  comment() {
    let _parms = {
      refId: this.data.refId,
      cmtType: 7,
      zanUserId: this.data.voteUserId,
      page: 1,
      rows: 8
    };
    Api.cmtlist(_parms).then((res) => {
      let data = res.data;
      console.log(res.data);
      if (data.code == 0) {
        this.setData({
          comment_list: data.data.list,
          totalComment: data.data.total
        });
        console.log(this.data.comment_list);
      }
    });
  },
  showArea() {
    this.setData({
      isComment: !this.data.isComment
    });
  },
  getCommentVal(e) {
    this.setData({
      commentVal: e.detail.value
    })
  },
  setcmtadd: function () {  //新增评论
    if (!this.data.commentVal) {
      wx.showToast({
        title: '请输入评论内容',
        icon: 'none',
        duration: 2000
      })
    } else {
      let _value = utils.utf16toEntities(this.data.commentVal)
      this.setData({
        commentVal: _value,
        isComment: false
      })
    }
    let _parms = {
      refId: this.data.refId,
      cmtType: 7,
      content: this.data.commentVal,
      userId: this.data.voteUserId,
      userName: app.globalData.userInfo.userName,
      nickName: app.globalData.userInfo.nickName,
    }
    Api.cmtadd(_parms).then((res) => {
      console.log(res);
      if(res.data.code == 0) {
        this.comment();
      } else {
        wx.showToast({
          title: '系统繁忙,请稍后再试',
          icon:'none'
        })
      }
    })
  },
  castvote: function () {  //選手投票
    let _this = this;
    let _parms = {
      actId: this.data.actId,
      userId: this.data.voteUserId,
      playerUserId: this.data.userId
    }
    Api.availableVote(_parms).then((res) => {
      this.setData({
        availableNum: res.data.data.user
      });
      if (this.data.availableNum <= 0) {
        console.log(this.data.availableNum)
        wx.showToast({
          title: '今天票数已用完,请明天再来',
          icon: 'none'
        })
        return false;
      }
      Api.voteAdd(_parms).then((res) => {
        if (res.data.code == 0) {
          wx.showToast({
            title: '投票成功',
            icon: 'none'
          })
          _this.setData({
            availableNum: _this.data.availableNum - 1,
            voteNum: _this.data.voteNum + 1,
            isVote: 1
          });
        }
      });
    });
  },
  toLike: function (e) {//评论点赞
    let id = e.currentTarget.id;
    let ind = '';
    for (let i = 0; i < this.data.comment_list.length; i++) {
      if (this.data.comment_list[i].id == id) {
        ind = i;
      }
    }
    let _parms = {
      refId: id,
      type: 4,
      userId: this.data.voteUserId,
    }
    Api.zanadd(_parms).then((res) => {
      if (res.data.code == 0) {
        wx.showToast({
          mask: true,
          icon: 'none',
          title: '点赞成功'
        }, 1500)
        var comment_list = this.data.comment_list;
        comment_list[ind].isZan = 1;
        comment_list[ind].zan++;
        this.setData({
          comment_list: comment_list
        });
      }
    })
  },
  cancelLike() {
    wx.showToast({
      title: '您已经点过赞了',
      icon: 'none'
    })
  },
  homePage() {
    wx.navigateTo({
      url: '../homePage/homePage?actId=' + this.data.actId + '&userId=' + this.data.userId,
    })
  },
  onPullDownRefresh: function () {

  },
  onReachBottom: function () {

  },
  onShareAppMessage: function () {

  },
  dateConv: function (dateStr) {
    let year = dateStr.getFullYear(),
      month = dateStr.getMonth() + 1,
      today = dateStr.getDate();
    month = month > 9 ? month : "0" + month;
    today = today > 9 ? today : "0" + today;
    return year + "-" + month + "-" + today;
  }
})