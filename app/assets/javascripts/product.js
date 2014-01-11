// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function tagitLoad() {
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


$(document).ready(tagitLoad);
$(document).on("page:load",tagitLoad);