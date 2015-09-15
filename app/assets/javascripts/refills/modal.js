// modal for sign in

$(function() {
  $(".modal-trigger").on("click", function() {
    if ($(this).is(":checked")) {
      $("body").addClass("modal-open");
    } else {
      $("body").removeClass("modal-open");
    }
  });

  $(".modal-fade-screen, .modal-close").on("click", function() {
    $(".modal-state:checked").prop("checked", false).change();
  });

  $(".modal-inner").on("click", function(e) {
    e.stopPropagation();
  });
});
// modal for the sign up
$(function() {
  $(".modal-trigger2").on("click", function() {
    if ($(this).is(":checked")) {
      $("body").addClass("modal-open2");
    } else {
      $("body").removeClass("modal-open2");
    }
  });

  $(".modal-fade-screen, .modal-close").on("click", function() {
    $(".modal-state:checked").prop("checked", false).change();
  });

  $(".modal-inner").on("click", function(e) {
    e.stopPropagation();
  });
});

// map for event show page
$(function() {
  $("#openMap").on("click", function() {
    if ($(this).is(":checked")) {
      $("body").addClass("modal-open3");
    } else {
      $("body").removeClass("modal-open3");
    }
  });

  $(".modal-fade-screen, .modal-close").on("click", function() {
    $(".modal-state:checked").prop("checked", false).change();
  });

  $(".modal-inner").on("click", function(e) {
    e.stopPropagation();
  });
});

// modal for activities to try
$(function() {
  $("#openToTry").on("click", function() {
    if ($(this).is(":checked")) {
      $("body").addClass("modal-open4");
    } else {
      $("body").removeClass("modal-open4");
    }
  });

  $(".modal-fade-screen, .modal-close").on("click", function() {
    $(".modal-state:checked").prop("checked", false).change();
  });

  $(".modal-inner").on("click", function(e) {
    e.stopPropagation();
  });
});


// modal for liked activities
$(function() {
  $("#openLiked").on("click", function() {
    if ($(this).is(":checked")) {
      $("body").addClass("modal-open5");
    } else {
      $("body").removeClass("modal-open5");
    }
  });

  $(".modal-fade-screen, .modal-close").on("click", function() {
    $(".modal-state:checked").prop("checked", false).change();
  });

  $(".modal-inner").on("click", function(e) {
    e.stopPropagation();
  });
});
