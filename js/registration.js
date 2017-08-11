$(document).ready(function() {
    var unicity = [{
         name : "user_email",
         message : "Користувач з таким E-mail вже існує.",
         action : "is_email_exists",
         page : "registration"
    }];

    $('button.register-user').click(function() {
        //$('.panel').removeClass('panel-danger');
        var check = $('.register-field-check').checkInput('checkAll', {
            errorInputStyle : "",
            checkUnicity : unicity,
            patternError : "Некоректні дані."
        });

        console.log(check);

        if (check.result) {
            check.data["post"] = $('select.post option:selected').val();
            var register = ajax_query({handler : 'new_user', data : JSON.stringify(check.data)}, 'registration', 'json');
            if (register.result == true) {
               window.location.href = "/auth/login";
            } else {
                console.log(register.notice);
            }
        }
    });
});
