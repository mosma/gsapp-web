// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  if (typeof(jQuery.ui.tagit) != 'undefined'){
    $("#tagit-tags").tagit({
      allowSpaces: false,
      singleField: true,
      singleFieldNode: $('#tags-field'),
      removeConfirmation: true,
      minLength: 3,



autocomplete: { 
  source: function( request, response ) {
    $.ajax({
      url: "/mosma/tags",
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



    });
  }
});