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
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap
//= require gmaps4rails/gmaps4rails.base.js.coffee
//= require gmaps4rails/gmaps4rails.bing.js.coffee
//= require gmaps4rails/gmaps4rails.googlemaps.js.coffee
//= require gmaps4rails/gmaps4rails.base.js
//= require best_in_place
//= require best_in_place.purr
//= require chosen-jquery
//= require_tree .

jQuery(function($) {
	      
  	/* Activating Best In Place */
  	jQuery(".best_in_place").best_in_place();

});



document.getElementById('resource_profile_id').onchange = function() {
    if(this.selectedIndex != this.options.length - 1) {
        return;
    }
    var new_name = prompt('Please enter a name');
    if(!new_name.length) {
        return;
    }
    var textbox = document.createElement('input');
    textbox.value = new_name;
    this.parentNode.appendChild(textbox); //parentNode is presumably the form
};