$(function() {

  // /users/sign_in ログインボタン
  $('.session_login').hover(function() {
    $(this).text('ログイン');
    console.log("ろぐいん！！！")
    $(this).css('background-color', '#A3EBCE');
  }, function(){
    $(this).text('ログイン');
    $(this).css('background-color', '#46D89E');
    });

  // /users/sign_in アカウント作成
  // $('.signUpBtn').hover(function() {
  //   $(this).text('アカウント作成');
  //   console.log("ろぐいん！！！")
  //   $(this).css('background-color', '#A3EBCE').css('color', 'white');
  // }, function(){
  //   $(this).text('アカウント作成');
  //   $(this).css('background-color', '#46D89E').css('color', 'white');
  // });

  // /users/sign_in パスワード？
  // $('.forgotYourPass').hover(function() {
  //   $(this).text('パスワードをお忘れですか?');
  //   console.log('パスワードをお忘れですか?')
  //   $(this).css('background-color', '#A3EBCE').css('color', 'white');
  // }, function(){
  //   $(this).text('パスワードをお忘れですか?');
  //   $(this).css('background-color', '#46D89E').css('color', 'white');
  // });

   $('.signUp').hover(function() {
      $(this).text('Sign up');
      console.log("ろぐいん！！！")
      $(this).css('background-color', '#A3EBCE');
    }, function(){
      $(this).text('Sign up');
      $(this).css('background-color', '#46D89E');
      });


});