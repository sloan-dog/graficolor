$(document).ready(function() {
  $('div').each(function(div){
    // console.log(this.innerHTML)
    $(this).on('click', function(){
      // console.log('fart')
    })
    $(this).css("width","200px")
  })
});