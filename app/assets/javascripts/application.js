//= require jquery
//= require jquery_ujs
jQuery(function($) {
  // 喜欢
  $(".love").click(function(event) {
    var id = $(event.target).siblings(".pid").html();
    $.getJSON("/love/"+id, function(json){
      $(event.target).siblings(".likeNum").html(json.love);
      $(event.target).siblings(".likeNum").css({"color": "green"});
    });
  });


  // 图片缩放
  $("div .img_box img").css({"width": "50px"});
  $("div .img_box").toggle(
    function(event){
      $(event.target).css({"width": "100%"});
    },
    function(event){
      $(event.target).css({"width": "50px"});
    }
  );  

});
