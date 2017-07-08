$(function() {

  // function followHTML(message?) {
  //   var followedBtn = '<div class="js-messages" message-id="' + message.id + '">'
  //                   return followedBtn;
  //   }

  $('.recomendUsers__followBTN').on('click', function() {
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
        // var html = buildHTML();
        // $(".area").append(html);
    })
    .fail(function(){
      alert('error');
    });
  });
});
