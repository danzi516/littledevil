Page({

  /**
   * 页面的初始数据
   */
  data: {
    
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    console.log(options);//{param:1}
    wx.login({
      success: res => {
        let _parms = {
          code: res.code
        }
        wx.getUserInfo({
          success: res => {
            console.log(res);
            wx.request({
              url: "http://127.0.0.1:8080/littledevil/wxpay/memberInsert",
              header: {
                'content-type': 'application/x-www-form-urlencoded' // 默认值
               // 'content-type':'application/json'
              },
              method: "POST",
              data: {
                companyId: parseInt(options.companyId),
                wxcode: _parms.code,
                wxUserInfo: JSON.stringify(res.userInfo)
              },
              success: (res) => {
                console.log(res)

              }
            })
          }
        })
    
        }
    })

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
    
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
    
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
    
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
    
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
    
  }
})