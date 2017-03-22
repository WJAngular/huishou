semantic.shape = {};

// ready event
semantic.shape.ready = function() {

  // selector cache
  var
    $directionButton = $('.direction .button'),
    // alias
    handler
  ;

  // event handlers
  handler = {
    rotate: function() {
      var
        $shape    = $(this).closest('#middleDiv').find('.ui.shape'),
        direction = $(this).data('direction') || false,
        animation = $(this).data('animation') || false
      ;
      if(direction && animation) {
        $shape
          .shape(animation + '.' + direction)
        ;
      }
    }
  
  };

 
  $directionButton
    .on('click', handler.rotate)
    .popup({
      delay     : 0,
      position  : 'bottom center'
    })
  ;
 

};


// attach ready event
$(document)
  .ready(semantic.shape.ready)
;