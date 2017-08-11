<html>
    <head>
        <meta charset="utf-8">
        <title>{{VAR:PAGE_TITLE}}</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="/theme/img/favicon.ico"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src="/core/js/core.js"></script>
        <script src="https://www.gstatic.com/firebasejs/3.8.0/firebase.js"></script>
        <script src="/theme/plugin/ckeditor/ckeditor.js"></script>
        <script src="/core/js/jQuery.inputCheckPlugin.js"></script>
        {{VAR:INCLUDES}}
    </head>
    <body>
        <nav class="navbar navbar-default">
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="/main">
                  <div>
                      <span class="logo glyphicon glyphicon-cloud"></span>
                      <h3>СУНП</h3>
                  </div>
                  <span class="sunp-logo-text">Система управління навчальним процесом</span>
              </a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Кафедра <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                      {{LOOP:KAFEDRA_LIST}}
                          <li><a href="/cab/kafedra/?id={{LOOP_VAR:KAFEDRA_ID}}">{{LOOP_VAR:KAFEDRA_NAME}}</a></li>
                      {{END_LOOP:KAFEDRA_LIST}}
                  </ul>
                </li>
                {{BLOCK:USER_GROUP_LINK}}
                    <li><a href="/cab/group/?id={{VAR:USER_GROUP_ID}}">{{VAR:USER_GROUP_NAME}}</a></li>
                {{END_BLOCK:USER_GROUP_LINK}}
              </ul>
              <ul class="nav navbar-nav navbar-right">
                  {{BLOCK:NOT_LOGGED}}
                      <li><a href="/login">Увійти</a></li>
                      <li><a href="/registration">Зареєструватися</a></li>
                  {{END_BLOCK:NOT_LOGGED}}
                  {{BLOCK:LOGGED}}
                      {{BLOCK:ADMIN}}<li><a href="plugins/gc_plugin_control/">Адмін-панель</a></li>{{END_BLOCK:ADMIN}}
                      <li><a href="/profile">Кабінет</a></li>
                      <li><a href="javascript:void(0)" onClick="logOut()">Вихід</a></li>
                  {{END_BLOCK:LOGGED}}

              </ul>
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
        {{VAR:CONTENT}}
        <div class="alert alert-danger" role="alert"></div>
    </body>
</html>
