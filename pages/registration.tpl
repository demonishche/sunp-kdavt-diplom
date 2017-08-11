<div class="container">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <div class="panel panel-default register-panel">
                  <div class="panel-heading">
                      <h3 class="panel-title">Реєстрація</h3>
                  </div>
                  <div class="panel-body">
                      <form>
                          <div class="form-group register-field register-field-check">
                              <input type="text" name="user_login" id="user_login" class="form-control" placeholder="Логін" aria-describedby="login" data-min-length="3" data-max-length="21">
                              <span id="user_login" class="errorMessage help-block"></span>
                          </div>
                          <div class="form-group register-field register-field-check">
                              <input type="text" name="user_email" id="user_email" class="form-control" placeholder="E-mail" aria-describedby="e-mail" data-pattern="mail">
                              <span id="user_email" class="errorMessage help-block"></span>
                          </div>
                          <div class="form-group register-field register-field-check">
                              <input type="text" name="name" id="name" class="form-control" data-required="false" placeholder="Ім'я" aria-describedby="name">
                              <span id="name" class="errorMessage help-block"></span>
                          </div>
                          <div class="form-group register-field register-field-check">
                              <input type="text" name="lastname" id="lastname" class="form-control" data-required="false" placeholder="Прізвище" aria-describedby="lastname">
                              <span id="lastname" class="errorMessage help-block"></span>
                          </div>
                          <div class="form-group register-field">
                              <select class="form-control post" name="post" aria-describedby="post">
                                  <option value="student">Студент</option>
                                  <option value="teacher">Викладач</option>
                              </select>
                              <span id="post" class="errorMessage help-block"></span>
                          </div>
                          <div class="form-group register-field register-field-check">
                              <input type="password" name="user_password" id="user_password" class="form-control" placeholder="Пароль" aria-describedby="password" data-min-length="8">
                              <span id="user_password" class="errorMessage help-block"></span>
                          </div>
                          <div class="form-group register-field register-field-check">
                              <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Підтвердіть пароль" aria-describedby="confirm_password" data-equal="user_password" data-equal-error-message="Паролі не співпадають.">
                              <span id="confirm_password" class="errorMessage help-block"></span>
                          </div>
                      </form>
                  </div>
                  <div class="panel-footer"><button class="btn btn-default register-user" type="button">Зареєструватися</button></div>
            </div>
        </div>
    </div>
</div>
