//1. hit update

$(document).ready(function () {
  $('.collapsed').click(function (event) {
    event.preventDefault(); //실행했을때 나머지 이벤은 내가 컨트롤 하겠다

    var aObj = this;

    console.log($('#reviewForm').attr('action'));
    console.log($(aObj).children('#board_id').text());

    var form = {
      board_id: $(aObj).children('#board_id').text(),
    };

    //dataType: 'json',
    $.ajax({
      type: 'PUT',
      url: '/product_view/updateHit',
      cache: false,
      contentType: 'application/json; charset=utf-8',
      data: JSON.stringify(form),
      success: function (result) {
        $(aObj).children('#b_hit').text(result);
        console.log('조회수 1 증가');
      },
      error: function (e) {
        alert('실패');
        console.log(e);
      },
    });
  });
});

//2. update like

$(document).ready(function () {
  $('.like_button').click(function (event) {
    event.preventDefault(); //실행했을때 나머지 이벤은 내가 컨트롤 하겠다

    var aObj = this;

    console.log($('#reviewForm').attr('action'));
    console.log($(aObj).val());

    var form = {
      board_id: $(aObj).val(),
    };

    var tagId = $(this).attr('id');

    //dataType: 'json',
    $.ajax({
      type: 'PUT',
      url: '/product_view/updateLike',
      cache: false,
      contentType: 'application/json; charset=utf-8',
      data: JSON.stringify(form),
      success: function (result) {
        var likeId = '#like_count' + tagId;

        $(likeId).text(result);
        console.log('좋아요 1 증가');
      },
      error: function (e) {
        alert('회원만 좋아요 할 수 있습니다.');
        console.log(e);
      },
    });
  });
});
