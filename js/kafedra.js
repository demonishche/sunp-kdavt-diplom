$(document).ready(function() {

    uploadTask = [];
    file = [];
    success_loaded = 0;
    var storage = firebase.storage();
    var pathReference = storage.ref('');

    CKEDITOR.replace( 'news-creator', {
        language: 'uk'
    });

    $('.toggle-create-folder').click(function() {
        $('.create-folder-block').slideToggle();
    });

    $('.create-news').click(function() {
        if (create_news('kafedra', urlVars['id']))
            $('.news-create-block').slideUp("fast");
    });

    $('.begin-load-files').click(function() {
        $('.begin-load-files').attr('disabled', true);
        $('.loading-status').html('Завантаження...');
        var folder_id = urlVars['pf'];
          if (folder_id === undefined)
              folder_id = ajax_query({handler : 'get_kafedra_folder_id', data : urlVars['id']}, 'kafedra', 'json');
        var path = ajax_query({handler : 'get_folder_path', data : folder_id}, 'group', "json");
        $(file).each(function(index, item) {
            var component = $('.load-row[data-load-file="' + index + '"]');
            var file_data = get_name_and_type_from_file(item.name),
                type = get_type(file_data.type);
            uploadTask[index] = pathReference.child('kafedra/' + path + item.name).put(item, {contentType: item.type});
            uploadTask[index].on('state_changed',
              function(snapshot) {
                var progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                component.find('.progress-bar').css('width', progress + '%');
              }, function() {

              }, function() {
                  component.find('.glyphicon-pause').toggleClass('glyphicon-pause glyphicon-ok');
                  var downloadURL = uploadTask[index].snapshot.downloadURL;
                  success_loaded++;
                  var res = ajax_query({handler : 'create_material', data : {mat_name: file_data.name, mat_type: type, format: file_data.type, link: downloadURL, folder_id}}, 'group', 'json');
                  if (success_loaded == $('.load-row').length) {
                      $('.loading-status').html('Файли успішно завантажено.');
                      $('.done-load-files').show();
                  }
            });
        });
    });

    $('.remove_material').click(function() {
        var material_id = $(this).parents('.material').attr('data-material-id'),
            mat_info = ajax_query({handler : 'get_material_info', data: material_id}, 'group', 'json'),
            path = ajax_query({handler : 'get_folder_path', data: mat_info['folder_id']}, 'group', "json");
            res = ajax_query({handler : 'remove_material', data : material_id}, 'group', 'json'),
            desertRef = pathReference.child("kafedra/" + path + mat_info.material_name + "." + mat_info.format);

    if (res)
        desertRef.delete().then(function() {
            location.reload();
        }).catch(function(error) { });
    });

    $('.create-folder').click(function() {
        var folder_name = $('.new-folder-name').val();
        var folder_id = urlVars['pf'];
          if (folder_id === undefined)
              folder_id = ajax_query({handler : 'get_kafedra_folder_id', data : urlVars['id']}, 'kafedra', 'json');
        var check_name = ajax_query({handler : 'check_folder_name', data : {folder_name, parent: folder_id, structure: "groups"}}, 'group', 'json');
        var path = ajax_query({handler : 'get_folder_path', data : folder_id}, 'group', "json");
        if (check_name > 0)
            folder_name += `(${check_name})`;
        if (folder_name.length == 0) {
            alert_danger("Вкажіть назву папки.", 3000);
            return false;
        }
        creatingFolder = pathReference.child('kafedra/' + path + folder_name + '/init_folder_file.txt').putString("new folder");
        creatingFolder.on('state_changed',
          function(snapshot) {

          }, function() {

          }, function() {

            var result = ajax_query({handler : 'create_folder', data : {folder_name, parent: folder_id, structure: "groups"}}, 'group', 'json');
            if (!result.result)
              alert_danger("Помилка при створенін папки.", 3000);
            else
              location.reload();
        });
    });

    $('.remove_folder').click(function() {
        var folder_id = $(this).parents('.folder').attr('data-folder-id'),
            folder_info = ajax_query({handler : 'get_folder_info', data : folder_id}, 'group', "json"),
            path = ajax_query({handler : 'get_folder_path', data : folder_id}, 'group', "json"),
            desertRef = pathReference.child("kafedra/" + path + "/init_folder_file.txt"),
            res = ajax_query({handler : 'remove_folder', data : folder_id}, 'group', 'json');

        if (res.result)
            desertRef.delete().then(function() {
                location.reload();
            }).catch(function(error) { });
    });
});
