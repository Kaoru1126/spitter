$(function() {
  // globalNavBarの色
  $('.fa').hover(function() {
    console.log('hovaer!');
   $(this).find('fa-home').text('ホーム');
   console.log(this);
   $(this).css('color', '#21A700');
  }, function(){
   $(this).find('fa-home').text('ホーム');
   $(this).css('color', '#808080');
   console.log('gray!!');
  });

  // ツイートボタンホバー
  $('.navBar__tweetBTN--text').hover(function() {
    $(this).text('ツイート');
    $(this).css('background-color', '#A3EBCE');
  }, function(){
    $(this).text('ツイート');
    $(this).css('background-color', '#46D89E');
  });

  // メニューホバーのボーダー
  $('.header__list').hover(function() {
    $(this).css('border-bottom', '2px solid #21A700');
  }, function(){
    $(this).css('border-bottom', '');
  });

  //スタッツバーのホバー
  $('.numOfTweet--area').hover(function() {
    $(this).css('border-bottom', '2px solid #46D89E');
  }, function(){
    $(this).css('border-bottom', '');
  });

   //スタッツバー数字のホバー
  $('.itsNumber').hover(function() {
    $(this).css('color', '#46D89E');
  }, function(){
    $(this).css('color', 'black');
  });

  // ログインアウトボタンのホバー
  $('.logoutBtn').hover(function() {
    $(this).css('background-color', 'lightgray');
  }, function(){
    $(this).css('background-color', 'white');
  });

// 編集ボタンのホバー
  $('.editBtn').hover(function() {
    $(this).css('background-color', 'lightgray');
  }, function(){
    $(this).css('background-color', 'white');
  });

// フィードの名前のホバー出来ない！！！
  // $('.main__top--name').hover(function(){
  //   $(this).children('a');
  //   console.log(this)
  //   $(this).css('color', '#46D89E');
  // });


});