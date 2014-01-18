// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function tagitLoad() {

  if ($('#fileupload')) {
    $('#fileupload').fileupload();
    var media_url = $('#fileupload').prop('action')
    var product = $('#media_product_id');
    if (product.val() != undefined) {
      media_url = media_url + "?product_id="+product.val()
    }

    $.getJSON(media_url, function (files) {
      var fu = $('#fileupload').data('blueimpFileupload'), 
        template;
      fu._adjustMaxNumberOfFiles(-files.length);
      console.log(files);
      template = fu._renderDownload(files)
        .appendTo($('#fileupload .files'));
      fu._reflow = fu._transition && template.length &&
        template[0].offsetWidth;
      template.addClass('in');
      $('#loading').remove();
    });
  }

  if ($("#tagit-tags")) {
    if (typeof(jQuery.ui.tagit) != 'undefined'){
      $("#tagit-tags").tagit({
        allowSpaces: false,
        singleField: true,
        singleFieldNode: $('#tags-field'),
        removeConfirmation: true,
        minLength: 3,
        autocomplete: { 
          source: function( request, response ) {
            var term = request.term
            if (term != undefined && term.length > 2) {
              $.ajax({
                url: "/mosma/tags?q="+request.term,
                dataType: "json",
                success: function( data ) {
                  response( $.map( data, function( item ) {
                  return {
                    label: item,
                    value: item
                  }
                }));
                }
              });
            }
          }
        }
      });
    }
  }
}

$(document).ready(tagitLoad);
$(document).on("page:load",tagitLoad);