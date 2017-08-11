$(document).ready(function() {
    $('button.enter-user').click(function() {
        auth();
    });
});

function auth() {
    var arrayData = {};
    arrayData['user_email'] = $('input#user_email').val();
    arrayData['user_password'] = $('input#user_password').val();

    $('.errorMessage').hide();
    var result = ajax_query({handler : 'login_user', data : arrayData}, 'login', 'json');
    if (!result.result)
    {
        $('.panel').addClass('panel-danger');
        if(result.errorCode == 2)
        {
            $('.error2').show();
        }
        else
            $('.error1').show();
    }
    else
        window.location.href = "/cab/main/";

    return false;
}
