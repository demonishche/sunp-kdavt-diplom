<div class="container">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <div class="panel panel-default register-panel">
                  <div class="panel-heading">
                      <h3 class="panel-title">Вхід</h3>
                  </div>
                  <div class="panel-body">
                      <form>
                          <div class="form-group register-field register-field-check">
                              <input type="text" name="user_email" id="user_email" class="form-control" placeholder="E-mail" aria-describedby="e-mail" data-pattern="mail">
                          </div>
                          <div class="form-group register-field register-field-check">
                              <input type="password" name="user_password" id="user_password" class="form-control" placeholder="Пароль" aria-describedby="password" data-min-length="8">
                              <span class="errorMessage help-block error1">Не вірний логін або пароль.</span>
                              <span class="errorMessage help-block error2">Ваш профіль заблоковано.</span>
                          </div>
                      </form>
                  </div>
                  <div class="panel-footer"><button class="btn btn-default enter-user" type="button">Увійти</button></div>
            </div>
        </div>
    </div>
</div>
