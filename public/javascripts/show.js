$(document).ready(function() {
  faye = new Faye.Client(faye_server_url);
  console.log("done");
  chatViewer = new App.Views.ChatViewer({el:$('div#chat')});
  //moduleProController  = new App.Controllers.ModulePro();
  //Backbone.history.start();
});