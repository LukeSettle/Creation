$(function(){
  $(".x_marker").click(function(){
    var activityId = $(this).attr("data-id");
    $.ajax({
      type: "PUT",
      url:  '/activities/'+activityId+'/unfollow',
      success: $(this).parent('li').remove()
    });
  });
});

$(function(){
  $(".to_try_tag").click(function(){
    var activityId = $(this).attr("data-id");
    $.ajax({
      type: "PUT",
      url:  '/activities/'+activityId+'/follow',
      success:$(this).parent('li').remove()
    });
  });
});
