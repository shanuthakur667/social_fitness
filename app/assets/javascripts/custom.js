jQuery(document).ready(function($) {
  $('#myModal').on('shown.bs.modal', function () {
    $('#myInput').trigger('focus')
  })

  $("tr[data-link]").click(function() {
    window.location = $(this).data("link")
  })
});
