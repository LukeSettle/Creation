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
      success:$(this).removeClass('to_try_tag').addClass('activity_tag').parent('li').remove().append('<a class="x_marker" data-id="#{activity.id}">x</a>').appendTo($('#liked')),
    });
  });
});
