$(document).ready(function() {

    var createPaintDiv = function(backgroundColor) {
        $('#paint_picks').append("<div class='picked_paint' style='background-color:" + backgroundColor +  "'></div>")
    }

    paints_picked = []
    $('.grid').find('div').each(function() {

        $(this).on('click', function(){
            var paint_values = [$(this).attr('id'), $(this).css('background-color')]
            console.log(paint_values)

            if (paints_picked.length < 3) {
                paints_picked.unshift(paint_values)
                createPaintDiv(paint_values[1])
            } else if ((paints_picked.length > 2) && (paint_values[1] != paints_picked[0][1]) && (paint_values[1] != paints_picked[1][1]) && (paint_values[1] != paints_picked[2][1])) {
                paints_picked.pop()
                paints_picked.unshift(paint_values)
                choices = $('.picked_paint')
                choices.first().css('background-color',paints_picked[0][1])
                choices.first().next().css('background-color',paints_picked[1][1])
                choices.first().next().next().css('background-color',paints_picked[2][1])
                var sendThisToServer = [paints_picked[0][0], paints_picked[1][0], paints_picked[2][0]]
                // update hidden field with value of paints_picked
                $('#hidden_field').val(sendThisToServer);
                console.log(paints_picked);
            }

        });
    });
});





// I'm creating a div with a certain background color, its information is stored in an array.
// I need to append an id to it that corresponds to its index in the array
// Once there are 3 divs, I need to delete the last div from the DOM and
// Remove the last array index
// Then unshift a new array index
// Then create a new div
