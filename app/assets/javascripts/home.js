// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function search_form() {
  $("#search-form").submit(function(e){
    e.preventDefault()
    var query = $("#search-input").val();
    window.location="/search/"+encodeURIComponent( query );

  });
}


$(document).ready(search_form);
$(document).on("page:load",search_form);