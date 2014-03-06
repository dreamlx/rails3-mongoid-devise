// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require jquery.mobile
//= require video

$(document).ready(function(){
  $(window).scroll(function(){
    console.log("---------------------------");
    // 当video元素在windows居中时候，播放视频
    $("video").each(function(){
      var video = $(this)[0];
      var vposition = $(this).position();
      
      //绝对偏移量，相对页面顶端
      var voffset = $(this).offset();
      
      // 绝对高度
      var vouterheight = $(this).outerHeight();

      var top = $(window).scrollTop();
      console.log("windows:" + top + "||video" + voffset.top);
      if ((voffset.top > top) && (voffset.top < top + vouterheight/3) ) {
        video.play();
      }else{
        video.pause();
      }
    });
  });
});