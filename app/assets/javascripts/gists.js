var TagSelector = (function () {
  function Tag(id, topic) {
    this.id = id;
    this.topic = topic;
  };

  Tag.all = [];

  Tag.fetchAll = function (callback) {
    $.getJSON("/tags.json",
      function (data) {
        Tag.all = [];
        _.each(data, function (datum) {
          Tag.all.push(new Tag(datum.id, datum.topic));
        });

        if (callback) {
          callback(Tag.all);
        }
      }
    );
  };

  function InputDiv (div, list) {
    var that = this;

    this.insertTextInput = function () {
      $("<input type=text class=input-box></input>").appendTo(div);
    };

    this._insertTags = function (tags) {
      var ul = $("<ul></ul>").addClass("tag-list");
      _.each(tags, function (tag) {
        ul.append($("<li></li>").text(tag.topic).addClass("tag-item"));
      });

      $(div).append(ul);
    };

    this.removeList = function () {
      $(".tag-list").remove();
    };

    this.renderList = function () {
      list(that._insertTags);
    };


    this.filterList = function () {
      list(that._parsedList);
    };

    this._parsedList = function (tags) {
      var input = $(".input-box").val();
      var regex = new RegExp("^"+input);

      var lis = [];
      _.each(tags, function(tag) {
        var matches = regex.exec(tag.topic);
        if (matches != null) {
          lis.push(tag);
        };
      });

      that.removeList();
      that._insertTags(lis);
    };

    // this.bindOptions = function () {
    //   $(".tag-item").click(function() {

    //   };
    // };
  };


  return {
    InputDiv: InputDiv,
    Tag: Tag
  };
})();


