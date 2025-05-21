//= require typus/jquery-2.1.1.min
//= require jquery_ujs
//= require typus/jquery.application
//= require chosen.jquery.js
//= require typus/select2.min
//= require typus/custom


$(document).on('click', '.ajax-modal', function() {
  var url = $(this).attr('url');
  var modal_id = $(this).attr('data-controls-modal');
  $("#" + modal_id + " .modal-body").load(url);
});

$(document).ready(function() {
  $(".select2-field").each(function() {
    var _this = $(this);
    _this.select2({
      ajax: {
        url: _this.data('search-url'),
        dataType: 'json',
        delay: 250,
        beforeSend: function(request) {
          request.setRequestHeader("LOGIN_TOKEN", _this.data('token'));
        },
        data: function (params) {
          return {
            q: params.term,
            page: params.page
          };
        },
        processResults: function (data, params) {
          params.page = params.page || 1;
          return {
            results: data.items,
            pagination: {
              more: data.has_more
            }
          };
        },
        cache: true
      },
      minimumInputLength: 1,
    });
  });
});
