$(document).ready(function() {
    $('.send_request_create_group').click(function() {
        var group_name = $('input#new-group-name').val(),
            group_year = $('select.group_year option:selected').val(),
            kafedra_id = $('select.kafedra option:selected').val();
        if (group_name.length == 0) {
            alert_danger("Введіть назву групи.", 3000);
            return false;
        }
        else {
            var result = ajax_query({handler : 'send_create_group_request', data : {group_name, group_year, kafedra_id}}, 'profile', 'json');
            if (result.result)
                alert_danger("Заявка успішно відправлена.", 3000);
            else
                alert_danger("Сталася помилка відправлення заявки.", 3000);
            return false;
        }
    });

    $('select.kafedra').change(function() {
        var kafedra_id = $(this).find('option:selected').val();
        $("select.group_list option:not([value='0'])").hide();
        $("select.group_list option[value='0']").prop("selected", true);
        $("select.group_list option[data-kafedra-id='" + kafedra_id + "']").show();
    });

    $('button.send_request_enter').click(function() {
        var group_id = $('select.group_list option:selected').val();

        if (group_id == 0) {
            alert_danger("Виберіть групу.", 3000);
            return false;
        }

        var result = ajax_query({handler : 'send_request_to_enter_group', data : group_id}, 'profile', 'json');
        if (result.result)
            location.reload();
        else
            alert_danger("Сталася помилка відправлення заявки.", 3000);
        return false;
    });

    $('.send_kafedra_request').click(function() {
        var kafedra_id = $('select.teacher_kafedra option:selected').val();
        var result = ajax_query({handler : 'send_kafedra_request', data : kafedra_id}, 'profile', 'json');
        if (result)
            location.reload();
        else
            alert_danger("Сталася помилка відправлення заявки.", 3000);
        return false;
    });
});
