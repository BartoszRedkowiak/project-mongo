$(function () {
   setLeader();

});


function setLeader(){
   var span = $('.voteValue').first();

      if (span.text() > 0 && span.data('index') === 0){
         var card = span.parent().parent().parent();
         card.attr('id','leaderCard');
         card.children(':first').attr('id', 'leaderHeader')

         var text = card.children(':first').text();
         card.children(':first').text('Lider spotu: ' + text)

      }
}