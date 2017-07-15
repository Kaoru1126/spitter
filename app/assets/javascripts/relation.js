$(function() {

  // function followHTML(message?) {
  //   var followedBtn = '<div class="js-messages" message-id="' + message.id + '">'
  //                   return followedBtn;
  //   }
  $('.followBTNHover').hover(function() {
    console.log("hover");
   $(this).find('a').text("フォロ解除");
   $(this).css('background-color', 'red');
  }, function(){
   $(this).find('a').text("フォロー中");
   $(this).css('background-color', '#46D89E');
  });

  $('.followTrigger').on('click', function() {
    console.log("clicked")
    var parentBox = $(this).closest('.recomendUsers--area')
    var userId = $(this).attr("user-id");
    var followingId = $(this).attr("following-id");
    console.log(followingId);
    $.ajax({
      type: 'POST',
      url: '/relations',
      data: {user_id:userId, following_id:followingId}
    })
    .done(function(data){
      console.log(this)
      parentBox.remove();
    })
    .fail(function(){
      alert('error');
    });
  });

   $('.followTrigger2').on('click', function() {
    console.log("clicked")
    var userId = $(this).attr("user-id");
    var followingId = $(this).attr("following-id");
    console.log(followingId);
    $.ajax({
      type: 'POST',
      url: '/relations',
      data: {user_id:userId, following_id:followingId}
    })
    .done(function(data){
      console.log(this)
    })
    .fail(function(){
      alert('error');
    });
  });


});



