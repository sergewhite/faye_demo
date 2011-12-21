App.Views.ChatViewer = Backbone.View.extend({
  tagName: "div"
  ,id:'chat'
  ,events: _.extend( {}, Backbone.events, {
    "submit form#some_form": "sendMessage"
  })
  ,initialize: function() {
    var self = this;
    self.$textArea = $('div#text_area');
    self.$input = $('input#user_message');
    if(typeof self.subscription != 'undefined') self.subscription.cancel();
    self.subscription = faye.subscribe("/channel/"+channel_id, function(data) { 
      self.renderMessage(data);
    });
  }
  ,sendMessage: function(e){
    var self = this;
    var data = {'message': self.$input.val()};
    $.ajax({
      url: '/channels/'+channel_id+'/add_message',
      data: data,
      type: "POST",
      dataType: 'json'
    });
    self.$input.val('');
    return false;
  }
  ,renderMessage: function(data){
    var self = this;
    self.$textArea.append('<br />'+data);
    return false;
  }
});
