<div class="container">
    <div class="page-header">
      <h1>Назва групи</h1>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading submenu-block">
            <nav class="navbar navbar-default submenu">
              <div class="container-fluid">
                <div class="navbar-header">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#submenu" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                </div>
                <div class="collapse navbar-collapse submenu-row" id="submenu">
                  <ul class="nav navbar-nav">
                    <li class="submenu-item active"><a id="news" class="submenu-link" href="/cab/group/?id={{VAR:GROUP_ID}}&sb=news">Новини</a></li>
                    <li class="submenu-item"><a id="materials" class="submenu-link" href="/cab/group/?id={{VAR:GROUP_ID}}&sb=materials">Матеріали</a></li>
                    <li class="submenu-item"><a id="schedule" class="submenu-link" href="/cab/group/?id={{VAR:GROUP_ID}}&sb=sheldue">Розклад</a></li>
                    <li class="submenu-item"><a id="members" class="submenu-link" href="/cab/group/?id={{VAR:GROUP_ID}}&sb=members">Учасники</a></li>
                    {{BLOCK:GROUP_CREATOR}}
                    <li class="submenu-item"><a id="requests" class="submenu-link" href="/cab/group/?id={{VAR:GROUP_ID}}&sb=requests">Заявки</a></li>
                    {{END_BLOCK:GROUP_CREATOR}}
                  </ul>
                </div>
            </nav>
        </div>
        <div class="panel-body group-content">
            <div class="container-fluid subcontent-block active-subcontent" id="news">
                <div class="block-top panel panel-default">
                  <div class="panel-body">
                    <div class="col-lg-6">
                        <h3 class="block-title">Новини</h3>
                        <button class="btn btn-default open-create-news-block" type="button"><span class="glyphicon glyphicon-pencil"></span> Додати новину</button>
                    </div>
                    <div class="col-lg-6">
                        <div class="pagination-button">
                            <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-step-backward"></span></button>
                            <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-triangle-left"></span></button>
                            <button class="btn btn-default num" type="button">1</button>
                            <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-triangle-right"></span></button>
                            <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-step-forward"></span></button>
                        </div>
                    </div>
                  </div>
                </div>
                <div class="panel panel-default news-create-block">
                      <div class="panel-heading">
                          <h3 class="panel-title">Створення новини</h3>
                      </div>
                      <div class="panel-body">
                          <div class="input-group create-news-title">
                              <input type="text" class="form-control" placeholder="Введіть заголовок новини...">
                          </div>

                        <textarea name="news-creator" id="news-creator" cols="30" rows="10"></textarea>
                      </div>
                      <div class="panel-footer"><button class="btn btn-default create-news" type="button">Створити</button></div>
                </div>
                <div class="news row">
                    {{LOOP:NEWS_LIST}}
                    <div class="col-lg-6">
                        <div class="news-block panel panel-default">
                          <div class="panel-heading">
                              <a href="/cab/news/?id={{LOOP_VAR:NEWS_ID}}"><h3 class="panel-title">{{LOOP_VAR:NEWS_TITLE}}</h3></a>

                            <span class="news-date">{{LOOP_VAR:DATE}}</span>
                          </div>
                          <div class="panel-body news-pre-text">
                            {{LOOP_VAR:NEWS_TEXT}}
                          </div>
                          <div class="panel-footer"><span class="news-author">Автор: <b>{{LOOP_VAR:NAME}} {{LOOP_VAR:LASTNAME}}</b></span><a href="/cab/news/?id={{LOOP_VAR:NEWS_ID}}">Перейти <span class="glyphicon glyphicon-arrow-right"></span></a></div>
                        </div>
                    </div>
                    {{END_LOOP:NEWS_LIST}}
                </div>
                <div class="block-bottom panel panel-default">
                  <div class="panel-body">
                    <div class="col-lg-offset-6 col-lg-6">
                        <div class="pagination-button">
                            <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-step-backward"></span></button>
                            <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-triangle-left"></span></button>
                            <button class="btn btn-default num" type="button">1</button>
                            <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-triangle-right"></span></button>
                            <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-step-forward"></span></button>
                        </div>
                    </div>
                  </div>
                </div>
            </div>
            <div class="container-fluid subcontent-block" id="materials">
                <ol class="breadcrumb">
                  {{BLOCK:BREADCRUMBS}}
                      <li class="active">/</li>
                  {{END_BLOCK:BREADCRUMBS}}
                    {{BLOCK:INIT_FOLDER_BREADCRUMB}}
                  <li><a href="/cab/group/?id={{VAR:GROUP_ID}}&sb=materials">...</a></li>
                      {{END_BLOCK:INIT_FOLDER_BREADCRUMB}}
                  {{LOOP:BREADCRUMBS}}
                        <li><a href="/cab/group/?id={{VAR:GROUP_ID}}&sb=materials&pf={{LOOP_VAR:FOLDER_ID}}">{{LOOP_VAR:FOLDER_NAME}}</a></li>
                  {{END_LOOP:BREADCRUMBS}}
                  {{BLOCK:END_FOLDER_BREADCRUMB}}
                  <li class="active">{{VAR:END_BREADCRUMB}}</li>
                  {{END_BLOCK:END_FOLDER_BREADCRUMB}}
                </ol>
                <div class="panel panel-default action-panel">
                  <div class="panel-heading ">
                    <button class="btn btn-default toggle-create-folder" type="button">Створити папку</button>
                    <label for="new-files" class="label-button">Вибрати файли</label>
                    <input type="file" style="display:none" id="new-files" multiple class="files">
                    <button class="btn btn-default begin-load-files" type="button">Почати завантаження</button>
                  </div>
                </div>
                <div class="loading-files">
                    <div class="loading-files-block">

                    </div>

                    <p class="loading-status">Щоб розпочати завантаженян натисніть кнопку "Почати завантаження". </p><button class="btn btn-default done-load-files" type="button">Добре</button>
                </div>
                <div class="row create-folder-block">
                  <div class="col-lg-12">
                    <div class="input-group">
                      <input type="text" class="form-control new-folder-name" placeholder="Введіть назву папки..">
                      <span class="input-group-btn">
                        <button class="btn btn-default create-folder" type="button">Створити</button>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="materials-list row">
                    {{LOOP:FOLDERS}}
                    <div class="col-md-1 col-xs-4 material-elem folder" data-folder-id="{{LOOP_VAR:FOLDER_ID}}">
                        <div class="row material-elem-top">
                            <div class="col-md-2 col-xs-2 material-elem-action">
                                <span class="glyphicon glyphicon-star-empty add-to-fav"></span>
                                <span class="glyphicon glyphicon-trash remove-material-elem remove_folder"></span>
                            </div>
                            <div class="col-md-8 col-xs-10 material-elem-icon">
                                <a href="/cab/group/?id={{VAR:GROUP_ID}}&sb=materials&pf={{LOOP_VAR:FOLDER_ID}}"><img src="/theme/img/folder_icon1.png" width="100%" alt="folder"></a>
                            </div>
                        </div>
                        <div class="row material-elem-bottom"><a href="/cab/group/?id={{VAR:GROUP_ID}}&sb=materials&pf={{LOOP_VAR:FOLDER_ID}}"><p class="name">{{LOOP_VAR:FOLDER_NAME}}</p></a></div>
                    </div>
                    {{END_LOOP:FOLDERS}}
                    {{LOOP:MATERIALS}}
                        <div class="col-md-1 col-xs-4 material-elem material" data-material-id="{{LOOP_VAR:MATERIAL_ID}}">
                            <div class="row material-elem-top">
                                <div class="col-md-2 col-xs-2 material-elem-action">
                                    <span class="glyphicon glyphicon-star-empty add-to-fav"></span>
                                    <span class="glyphicon glyphicon-trash remove-material-elem remove_material"></span>
                                </div>
                                <div class="col-md-8 col-xs-10 material-elem-icon">
                                    <a href="{{LOOP_VAR:LINK}}" {{LOOP_VAR:DOWNLOAD}}><img src="{{LOOP_VAR:ICON_LINK}}" width="100%" alt="folder"></a>
                                </div>
                            </div>
                            <div class="row material-elem-bottom"><a href="{{LOOP_VAR:LINK}}" download><p class="name col-md-7 col-xs-7">{{LOOP_VAR:MATERIAL_NAME}}</p><p class="format col-md-5 col-xs-5">.{{LOOP_VAR:FORMAT}}</p></a></div>
                        </div>
                    {{END_LOOP:MATERIALS}}
                    <!-- <div class="col-md-1 col-xs-4 material-elem">
                        <div class="row material-elem-top">
                            <div class="col-md-2 col-xs-2 material-elem-action">
                                <span class="glyphicon glyphicon-star-empty add-to-fav"></span>
                                <span class="glyphicon glyphicon-trash remove-material-elem"></span>
                            </div>
                            <div class="col-md-8 col-xs-10 material-elem-icon">
                                <a href="#"><img src="/theme/img/doc_icon.png" width="100%" alt="folder"></a>
                            </div>
                        </div>
                        <div class="row material-elem-bottom"><a href="#"><p class="name col-md-7 col-xs-7">Новий документ</p><p class="format col-md-5 col-xs-5">.docx</p></a></div>
                    </div>
                    <div class="col-md-1 col-xs-4 material-elem">
                        <div class="row material-elem-top">
                            <div class="col-md-2 col-xs-2 material-elem-action">
                                <span class="glyphicon glyphicon-star-empty add-to-fav"></span>
                                <span class="glyphicon glyphicon-trash remove-material-elem"></span>
                            </div>
                            <div class="col-md-8 col-xs-10 material-elem-icon">
                                <a href="#"><img src="/theme/img/present_icon.png" width="100%" alt="folder"></a>
                            </div>
                        </div>
                        <div class="row material-elem-bottom"><a href="#"><p class="name col-md-7 col-xs-7">Новий документ</p><p class="format col-md-5 col-xs-5">.pptx</p></a></div>
                    </div>
                    <div class="col-md-1 col-xs-4 material-elem">
                        <div class="row material-elem-top">
                            <div class="col-md-2 col-xs-2 material-elem-action">
                                <span class="glyphicon glyphicon-star-empty add-to-fav"></span>
                                <span class="glyphicon glyphicon-trash remove-material-elem"></span>
                            </div>
                            <div class="col-md-8 col-xs-10 material-elem-icon">
                                <a href="#"><img src="http://school-myschool.at.ua/rozklad.jpg" width="100%" alt="folder"></a>
                            </div>
                        </div>
                        <div class="row material-elem-bottom"><a href="#"><p class="name col-md-7 col-xs-7">Шось там</p><p class="format col-md-5 col-xs-5">.jpg</p></a></div>
                    </div>
                    <div class="col-md-1 col-xs-4 material-elem">
                        <div class="row material-elem-top">
                            <div class="col-md-2 col-xs-2 material-elem-action">
                                <span class="glyphicon glyphicon-star-empty add-to-fav"></span>
                                <span class="glyphicon glyphicon-trash remove-material-elem"></span>
                            </div>
                            <div class="col-md-8 col-xs-10 material-elem-icon">
                                <a href="#"><img src="/theme/img/book_icon.png" width="100%" alt="folder"></a>
                            </div>
                        </div>
                        <div class="row material-elem-bottom"><a href="#"><p class="name col-md-7 col-xs-7">Book</p><p class="format col-md-5 col-xs-5">.fb2</p></a></div>
                    </div>
                    <div class="col-md-1 col-xs-4 material-elem">
                        <div class="row material-elem-top">
                            <div class="col-md-2 col-xs-2 material-elem-action">
                                <span class="glyphicon glyphicon-star-empty add-to-fav"></span>
                                <span class="glyphicon glyphicon-trash remove-material-elem"></span>
                            </div>
                            <div class="col-md-8 col-xs-10 material-elem-icon">
                                <a href="#"><img src="/theme/img/zip_icon.png" alt="folder"></a>
                            </div>
                        </div>
                        <div class="row material-elem-bottom"><a href="#"><p class="name col-md-7 col-xs-7">Arhiv</p><p class="format col-md-5 col-xs-5">.rar</p></a></div>
                    </div>
                    <div class="col-md-1 col-xs-4 material-elem">
                        <div class="row material-elem-top">
                            <div class="col-md-2 col-xs-2 material-elem-action">
                                <span class="glyphicon glyphicon-star-empty add-to-fav"></span>
                                <span class="glyphicon glyphicon-trash remove-material-elem"></span>
                            </div>
                            <div class="col-md-8 col-xs-10 material-elem-icon">
                                <a href="#"><img src="/theme/img/uncnown_icon.png" alt="folder"></a>
                            </div>
                        </div>
                        <div class="row material-elem-bottom"><a href="#"><p class="name col-md-7 col-xs-7">WTF</p><p class="format col-md-5 col-xs-5">.gg</p></a></div>
                    </div> -->
                </div>
            </div>
            <div class="container-fluid subcontent-block" id="schedule">
                Розклад
            </div>
            <div class="container-fluid subcontent-block" id="members">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Користувач</th>
                            <th>Права</th>
                            <th>Дата</th>
                            {{BLOCK:GROUP_CREATOR}}
                            <th>Дії</th>
                            {{END_BLOCK:GROUP_CREATOR}}
                        </tr>
                    </thead>
                    <tbody>
                        {{LOOP:USER_LIST}}
                            <tr data-student-id="{{LOOP_VAR:STUDENT_ID}}">
                                <td>{{LOOP_VAR:NAME}} {{LOOP_VAR:LASTNAME}} ({{LOOP_VAR:USER_LOGIN}})</td>
                                <td>{{LOOP_VAR:ACCESS}}</td>
                                <td>{{LOOP_VAR:DATE}}</td>
                                {{BLOCK:GROUP_CREATOR}}
                                {{BLOCK:REMOVE_{{LOOP_VAR:ACCESS}}}}
                                <td class="user_action">
                                    <span class="glyphicon glyphicon-remove cancel"></span>
                                </td>
                                {{END_BLOCK:REMOVE_{{LOOP_VAR:ACCESS}}}}
                                {{END_BLOCK:GROUP_CREATOR}}
                            </tr>
                        {{END_LOOP:USER_LIST}}
                    </tbody>
                </table>
            </div>
            {{BLOCK:GROUP_CREATOR}}
            <div class="container-fluid subcontent-block" id="requests">
                <div class="block-top panel panel-default">
                  <div class="panel-body">
                    <div class="col-md-12">
                        <h3 class="block-title">Заявки</h3>
                    </div>
                  </div>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Користувач</th>
                            <th>Дата</th>
                            <th>Дії</th>
                        </tr>
                    </thead>
                    <tbody>
                        {{LOOP:REQUESTS_LIST}}
                            <tr data-request-id="{{LOOP_VAR:REQ_ID}}">
                                <td>{{LOOP_VAR:NAME}} {{LOOP_VAR:LASTNAME}} ({{LOOP_VAR:USER_LOGIN}})</td>
                                <td>{{LOOP_VAR:DATE}}</td>
                                <td class="request_action">
                                    <span class="glyphicon glyphicon-ok accept"></span>
                                    <span class="glyphicon glyphicon-remove cancel"></span>
                                </td>
                            </tr>
                        {{END_LOOP:REQUESTS_LIST}}
                    </tbody>
                </table>
            </div>
            {{END_BLOCK:GROUP_CREATOR}}
        </div>
        </div>
    </div>

</div>
