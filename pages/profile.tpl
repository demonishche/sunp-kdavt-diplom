<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading submenu-block">
            <div><h4 class="block-title login-header">Логін: <span>Login</span></h4>
            <h4 class="block-title email-header">Email: <span>example@email.examp</span></h4></div>
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
                    <li class="submenu-item active"><a id="personal_data" class="submenu-link" href="/cab/profile/?sb=personal_data">Персональні дані</a></li>
                    {{BLOCK:ONLY_STUDENTS}}
                    <li class="submenu-item"><a id="group_setting" class="submenu-link" href="/cab/profile/?sb=group_setting">Група</a></li>
                    {{END_BLOCK:ONLY_STUDENTS}}
                    {{BLOCK:ONLY_TEACHERS}}
                    <li class="submenu-item"><a id="kafedra" class="submenu-link" href="/cab/profile/?sb=kafedra">Кафедра</a></li>
                    {{END_BLOCK:ONLY_TEACHERS}}
                    <!-- <li class="submenu-item"><a id="schedule" class="submenu-link" href="/cab/profile/?sb=schedule">Повідомлення</a></li> -->
                  </ul>
                </div>
              </div>
            </nav>
        </div>
        <div class="panel-body">
            <div class="container-fluid subcontent-block" id="personal_data">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="user-email">E-mail: </label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="user-email">
                        </div>
                        <span id="helpBlock" class="col-md-offset-2 col-md-10 help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="user-name">Ім'я: </label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="user-name">
                        </div>
                        <span id="helpBlock" class="col-md-offset-2 col-md-10 help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="user-lastname">Прізвище: </label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="user-lastname">
                        </div>
                        <span id="helpBlock" class="col-md-offset-2 col-md-10 help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="current-password">Діючий пароль: </label>
                        <div class="col-md-10">
                            <input type="password" class="form-control" id="current-password">
                        </div>
                        <span id="helpBlock" class="col-md-offset-2 col-md-10 help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="new-password">Новий пароль: </label>
                        <div class="col-md-10">
                            <input type="password" class="form-control" id="new-password">
                        </div>
                        <span id="helpBlock" class="col-md-offset-2 col-md-10 help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="confirm-password">Підтвердіть пароль: </label>
                        <div class="col-md-10">
                            <input type="password" class="form-control" id="confirm-password">
                        </div>
                        <span id="helpBlock" class="col-md-offset-2 col-md-10 help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>
                    </div>
                    <button class="col-md-offset-2 btn btn-default">Зберегти</button>
                </form>
            </div>
            {{BLOCK:ONLY_STUDENTS}}
            <div class="container-fluid subcontent-block active-subcontent" id="group_setting">
                {{BLOCK:STUDENT}}
                {{BLOCK:NOT_GROUP_AND_REQUEST}}
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="mini-header">Подайте заявку для вступу в групу: </h3>
                    </div>
                </div>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="study-years" class="col-md-1 control-label">Кафедра:</label>
                        <div class="col-md-2" name="kafedra">
                            <select class="form-control kafedra">
                              {{LOOP:KAFEDRA_LIST}}
                                  <option value="{{LOOP_VAR:KAFEDRA_ID}}">{{LOOP_VAR:KAFEDRA_NAME}}</option>
                              {{END_LOOP:KAFEDRA_LIST}}
                            </select>
                        </div>
                        <label for="study-years" class="col-md-1 control-label">Групи:</label>
                        <div class="col-md-2" name="group_list">
                            <select class="form-control group_list">
                                <option data-kafedra-id="0" value="0">Виберіть групу</option>
                              {{LOOP:GROUP_LIST}}
                                  <option data-kafedra-id="{{LOOP_VAR:KAFEDRA_ID}}" value="{{LOOP_VAR:GROUP_ID}}">{{LOOP_VAR:GROUP_NAME}}</option>
                              {{END_LOOP:GROUP_LIST}}
                            </select>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-default send_request_enter">Подати заявку</button>
                        </div>
                    </div>
                </form>
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="mini-header">або подайте заявку на створення власної групи: </h3>
                    </div>
                </div>
                <div class="form-horizontal">
                    <div class="form-group">
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="new-group-name" placeholder="Введіть назву групи...">
                        </div>
                        <label for="study-years" class="col-md-1 control-label">Курс:</label>
                        <div class="col-md-2" name="study-years">
                            <select class="form-control group_year">
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                            </select>
                        </div>
                        <label for="study-years" class="col-md-1 control-label">Кафедра:</label>
                        <div class="col-md-2" name="kafedra">
                            <select class="form-control kafedra">
                              {{LOOP:KAFEDRA_LIST}}
                                  <option value="{{LOOP_VAR:KAFEDRA_ID}}">{{LOOP_VAR:KAFEDRA_NAME}}</option>
                              {{END_LOOP:KAFEDRA_LIST}}
                            </select>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-default send_request_create_group" >Подати заявку</button>
                        </div>
                    </div>
                </div>
                {{END_BLOCK:NOT_GROUP_AND_REQUEST}}
                {{BLOCK:ENTER_GROUP_PROCCESSING}}
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="mini-header">Вашу заявку, на вступ до групи <span>{{VAR:GROUP_NAME}}</span> ще не підтверджено.</h3>
                    </div>
                </div>
                {{END_BLOCK:ENTER_GROUP_PROCCESSING}}
                {{BLOCK:CREATE_GROUP_PROCCESSING}}
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="mini-header">Вашу заявку, на створення групи <span>{{VAR:GROUP_NAME}}</span> ще не підтверджено.</h3>
                    </div>
                </div>
                {{END_BLOCK:CREATE_GROUP_PROCCESSING}}
                {{BLOCK:IN_GROUP}}
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="mini-header">Ви є членом групи <a href="/cab/group/?id={{VAR:GROUP_ID}}">{{VAR:GROUP_NAME}}</a>.</h3>
                    </div>
                </div>
                {{END_BLOCK:IN_GROUP}}
                {{BLOCK:CREATOR_GROUP}}
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="mini-header">Ви є власником групи <a href="/cab/group/?id={{VAR:GROUP_ID}}">{{VAR:GROUP_NAME}}</a>.</h3>
                    </div>
                </div>
                {{END_BLOCK:CREATOR_GROUP}}
                {{END_BLOCK:STUDENT}}
            </div>
            {{END_BLOCK:ONLY_STUDENTS}}
            {{BLOCK:ONLY_TEACHERS}}
            <div class="container-fluid subcontent-block active-subcontent" id="kafedra">
                {{BLOCK:NOT_REQUEST_TO_KAFEDRA}}
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="mini-header">Подайте заявку для вступу в кафедру: </h3>
                    </div>
                </div>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="study-years" class="col-md-1 control-label">Кафедра:</label>
                        <div class="col-md-4" name="teacher_kafedra">
                            <select class="form-control teacher_kafedra">
                              {{LOOP:KAFEDRA_LIST}}
                                  <option value="{{LOOP_VAR:KAFEDRA_ID}}">{{LOOP_VAR:KAFEDRA_NAME}}</option>
                              {{END_LOOP:KAFEDRA_LIST}}
                            </select>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-default send_kafedra_request">Подати заявку</button>
                        </div>
                    </div>
                </form>
                {{END_BLOCK:NOT_REQUEST_TO_KAFEDRA}}
                {{BLOCK:ENTER_KAFEDRA_PROCCESSING}}
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="mini-header">Вашу заявку, на вступ до кафедри <span>"{{VAR:KAFEDRA_NAME}}"</span> ще не підтверджено.</h3>
                    </div>
                </div>
                {{END_BLOCK:ENTER_KAFEDRA_PROCCESSING}}
                {{BLOCK:IN_KAFEDRA}}
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="mini-header">Ви є членом кафедри <a href="/cab/kafedra/?id={{VAR:KAFEDRA_ID}}">{{VAR:KAFEDRA_NAME}}</a>.</h3>
                    </div>
                </div>
                {{END_BLOCK:IN_KAFEDRA}}
            </div>
            {{END_BLOCK:ONLY_TEACHERS}}
        </div>
    </div>
</div>
