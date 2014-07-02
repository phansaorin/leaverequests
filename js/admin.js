// Check all checkbox child
$("body").on("click", 'th input[type="checkbox"]', function() {
    if ( $(this).is(':checked') )
        $('td input[type="checkbox"]').prop('checked', true);
    else
        $('td input[type="checkbox"]').prop('checked', false);
});


// Nav left side, as default is hide
$("ul.nav-second-level").hide();

$("body").on("click", "a.nav-left-9", function(){
	$(this).siblings("ul").toggle();
	$(this).parent().parent("li").addClass("active");
});

$("body").on("mouseover", ".theTooltip", function(){
	$(this).tooltip('show');
});

// Set feedback message
function set_feedback(text, classname, keep_displayed, actions)
{
    if (actions == "add") {
        var image = '<img src="../images/close.png" />';
    } else if(actions == "update") {
        var image = '<img src="../../images/close.png" />';
    } else {
        var image = '<img src="images/close.png" />';
    }
    if(text!='')
    {
        $('#feedback_bar').removeClass();
        $('#feedback_bar').addClass(classname);
        $('#feedback_bar').html(text + ' <span id="feedback_bar_close">'+image+'</span>');
        $('#feedback_bar').slideDown(250);
        var text_length = text.length;
        var text_lengthx = text_length*125;

        if(!keep_displayed)
        {
            $('#feedback_bar').show();
            
            setTimeout(function()
            {
                $('#feedback_bar').slideUp(250, function()
                {
                    $('#feedback_bar').removeClass();
                });
            },text_lengthx);
        }
    }
    else
    {
        $('#feedback_bar').hide();
    }

    $('#feedback_bar_close').click(function()
    {
        $('#feedback_bar').slideUp(250, function()
        {
            $('#feedback_bar').removeClass();
        });
    });
    
}

$("body").on("click", "button.add_update", function(event) {
	event.preventDefault();
	var url = $(this).parent().attr("action");
	var datas = $(this).parent().serialize();
	$.ajax({
		url: url,
		type: "POST",
		dataType: "json",
		data: datas,
		success: function(response){
			if(response.success)
            {
                // $(this).find('form')[0].reset();
                set_feedback(response.message,'success_message',true, response.actions);
            }
            else
            {
                set_feedback(response.message,'error_message',false, response.actions);    
            }
		}
	});
});

$('body').on("click", "a.delete", function(event) {
    event.preventDefault();
    var url = $(this).attr("href");
    $.ajax({
        url: url,
        dataType: "json",
        success: function(response) {
            if(response.success)
            {
                // $(this).find('form')[0].reset();
                set_feedback(response.message,'success_message',true, response.actions);
            }
            else
            {
                set_feedback(response.message,'error_message',false, response.actions);    
            }
        }
    });
});