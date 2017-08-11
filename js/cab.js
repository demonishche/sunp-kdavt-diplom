$(document).ready(function() {
    loading_file = `<div class="row load-row" data-load-file="">
        <div class="col-md-3 loading-file-name"></div>
        <div class="col-md-3">
            <div class="progress">
              <div class="progress-bar loading-file-progress" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="">
                <span class="sr-only"></span>
              </div>
            </div>
        </div>
        <div class="col-md-1 loading-actions">
            <span class="glyphicon glyphicon-pause"></span>
            <span class="glyphicon glyphicon-remove"></span>
        </div>
    </div>`;

    urlVars = getUrlVars();
    types = {
        doc: ["doc", "xls", "txt", "docx"],
        book: ["fb2", "epub", "mobi", "pdf", "lrf", "djvu", "rtf"],
        img: ["jpeg", "jpg", "png", "bmp", "gif", "jp2"],
        present: ["ppt", "pptx"],
        zip: ["rar", "zip", "cab", "arj", "lzh", "7z", "tar", "iso"]
    };

    if (urlVars["sb"] !== undefined) {
        var block_id = urlVars["sb"];
        $('.subcontent-block.active-subcontent')
            .hide()
            .removeClass('active-subcontent');
        $('.subcontent-block#' + block_id)
            .addClass('active-subcontent')
            .fadeIn();
        $('.submenu-item').removeClass('active');
        $('.submenu-link#' + block_id).parents('.submenu-item').addClass('active');
    }

    // $('.submenu-link').click(function() {
    //     var block_id = $(this).attr('id');
    //     updateQueryStringParameter("sb", block_id);
    //     location.reload();
    // });

    $('.open-create-news-block').click(function() {
        $('.news-create-block').slideToggle("fast");
    });

    var config = {
      apiKey: "AIzaSyCwWiFdsFS-4T28Id2PBkyeiWgJe3cHik4",
      authDomain: "sunp-kdavt-ea0ba.firebaseapp.com",
      databaseURL: "https://sunp-kdavt-ea0ba.firebaseio.com",
      projectId: "sunp-kdavt-ea0ba",
      storageBucket: "sunp-kdavt-ea0ba.appspot.com",
      messagingSenderId: "585506291263"
    };
    firebase.initializeApp(config);

    $(document).on('click', '.load-row .glyphicon-pause', function() {
        $(this).toggleClass('glyphicon-pause glyphicon-play');
        var index = $(this).parents('.load-row').attr('data-load-file');
        uploadTask[index].pause();
    });

    $(document).on('click', '.load-row .glyphicon-play', function() {
        $(this).toggleClass('glyphicon-pause glyphicon-play');
        var index = $(this).parents('.load-row').attr('data-load-file');
        uploadTask[index].resume();
    });

    $(document).on('click', '.load-row .glyphicon-remove', function() {
        var index = $(this).parents('.load-row').attr('data-load-file'),
            parent = $(this).parents('.load-row'),
            state = uploadTask[index].snapshot.state,
            name = $(this).parents('.load-row').find('.loading-file-name').html();
        if (state == 'paused' || state == 'running') {
            uploadTask[index].cancel();
            $(this).parents('.load-row').remove();
        }
        else if (state == 'success') {
            var desertRef = pathReference.child('pi1319/' + name);
                desertRef.delete().then(function() {
                  parent.remove();
                }).catch(function(error) {
                  console.log("err del");
            });
        }

    });

    $('input#new-files').change(function(e){
        file = e.target.files;
        $(file).each(function(index, item) {
            var load_row = $(loading_file);
            load_row.find('.loading-file-name').html(item.name);
            load_row.attr('data-load-file', index);
            $('.loading-files-block').append(load_row);
        });
        $('.loading-files').show();
    });

    $(document).on('click', '.done-load-files', function() {
        location.reload();
    });

});

function alert_danger(message, time) {
    $('.alert-danger')
        .html(message)
        .fadeIn();

    if (time > 0) {
        setTimeout(function () {
            $('.alert-danger').fadeOut();
        }, time);
    }

}

function get_type(type) {
    for (var key in types) {
        if (types[key].indexOf(type) != -1)
            return key;
    }
}

function create_news(struct, struct_id) {
    var title = $('.create-news-title input').val();
        if (title.length == 0) {
            alert_danger("Введіть заголовок новини.", 3000);
            return false;
        }
    var text = CKEDITOR.instances['news-creator'].getData();

    if (text.length == 0) {
        alert_danger("Введіть текст новини.", 3000);
        return false;
    }

    var result = ajax_query({handler : 'create_news', data : {title, text, struct, struct_id}}, 'news', 'json');

    if (!result) {
        alert_danger("Сталася помилка.", 3000);
        return false;
    }

    location.reload();
    return true;
}

function get_name_and_type_from_file(filename) {
    var dot_pos = -1;
    while (filename.indexOf(".", dot_pos + 1) != -1)
        dot_pos = filename.indexOf(".", dot_pos + 1);
    var  type = filename.slice(dot_pos + 1),
        name = filename.substring(0, dot_pos);

    return {name, type};
}
