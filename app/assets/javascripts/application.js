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
//= require jquery_ujs
//= require twitter/bootstrap
//= require gritter
//= require dhtmlxscheduler
//= require_tree .

$(document).ready(function(){
  scheduler.config.xml_date="%Y-%m-%d %H:%i";
  scheduler.init('scheduler_here',null,"month");
  scheduler.load('/events', 'json');

  dp = new dataProcessor('/events/batch_update');
  dp.init(scheduler);
  dp.setTransactionMode("POST", false);

})