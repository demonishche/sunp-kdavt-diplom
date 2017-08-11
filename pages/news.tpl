<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <button class="btn btn-default return-back" type="button"><span class="glyphicon glyphicon-arrow-left"></span> Назад</button>
            <div class="news-button">
                <button class="btn btn-default prev-news" type="button"><span class="glyphicon glyphicon-backward"></span></button>
                <button class="btn btn-default next-news" type="button"><span class="glyphicon glyphicon-forward"></span></button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="news-block panel panel-default" data-news-id="{{VAR:NEWS_ID}}">
              <div class="panel-heading">
                <span class="news-author">Автор: <b>{{VAR:NAME}} {{VAR:LASTNAME}}</b></span>
                <span class="news-date">{{VAR:DATE}}</span>
              </div>
              <div class="panel-body">
                  <div class="page-header news-title">
                    <h1>{{VAR:NEWS_TITLE}}</h1>
                  </div>
                  <div class="news-text">
                      {{VAR:NEWS_TEXT}}
                  </div>
              </div>
              <div class="panel-footer"></div>
            </div>
        </div>
    </div>

</div>
