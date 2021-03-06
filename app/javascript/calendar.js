import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import { data } from 'jquery';

//FullCalendarの表示
document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin ],
    events: '/good_things.json',
    initialView: 'dayGridMonth',
    dateClick: function () {
      //イベント登録のためnewアクションを発火
      $.ajax({
        type: 'GET',
        url: '/good_things/new',
      }).done(function (res) {
        //イベント登録用のhtmlを作成
        $('.modal-body').html(res);
        //イベント登録フォームのモーダル表示
        $('#good_thing_Modal').modal();
        // 成功処理
      }).fail(function (result) {
        // 失敗処理
        alert('エラーが発生しました。運営に問い合わせてください。')
      });
    },
  });

  calendar.render();
});
//FullCalendarの表示ここまで

// カレンダー内にモーダルを表示させる
// function dateClick() {
//   const dateClicks = document.querySelectorAll(".fc-daygrid-day-frame");
//   dateClicks.forEach(function (dateClick) {

//     dateClick.insertAdjacentHTML("beforeend", `<button type="button" class="btn text-white" data-toggle="modal" data-target="#good_thing_Modal">記入する</button>`);
//   })
// }
// window.addEventListener("load", dateClick);
// カレンダー内にモーダルを表示させる

// 投稿日時の取得関連
function check() {
  const posts = document.querySelectorAll(".fc-daygrid-day");
  posts.forEach(function (post) {
    post.addEventListener("click", () => { 
      
      // 投稿日時を取得
      const dataDate = post.getAttribute("data-date")
      const selectDate = `<input value=${dataDate} type="hidden" name='good_thing[start_date]'>`;
      const startDate = document.getElementById("start-date")
      startDate.insertAdjacentHTML("beforeend", selectDate);
      // 投稿日時を取得
      
      // パラムにクリックした日付を渡す（現在廃止）
      // const setParams = `?date=${dataDate}`
      //   history.pushState(null, null, setParams)
      // パラムにクリックした日付を渡す（現在廃止）
      
    });
  });
}
setInterval(check, 1000);
// 投稿日時の取得関連ここまで

 // カレンダー内の投稿日時部分の削除
  function deleteHizuke() {
    var hinichi = document.getElementsByClassName("fc-event-time")
    hinichi = Array.from(hinichi)
    hinichi.forEach(function (x){
      x.innerHTML = ""
    })
  }
  setInterval(deleteHizuke, 10);
  // カレンダー内の投稿日時部分の削除ここまで