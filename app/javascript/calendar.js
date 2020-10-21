import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import { data } from 'jquery';

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin ],
    events: '/good_things.json',
    initialView: 'dayGridMonth',
    
  });
  

  calendar.render();
});

// カレンダー内にモーダルを表示させる
function dateClick() {
  const dateClicks = document.querySelectorAll(".fc-daygrid-day-frame");
  dateClicks.forEach(function (dateClick) {

    dateClick.insertAdjacentHTML("beforeend", `<button type="button" class="btn " data-toggle="modal" data-target="#exampleModal">記入する</button>`);
  })
}
window.addEventListener("load", dateClick);
// カレンダー内にモーダルを表示させる

function check() {
  const posts = document.querySelectorAll(".fc-daygrid-day");
  posts.forEach(function (post) {
    post.addEventListener("click", () => { 
      
      // 投稿日時を取得
      const dataDate = post.getAttribute("data-date")
      console.log(dataDate)
      const selectDate = `<input value=${dataDate} type="hidden" name='good_thing[start_date]'>`;
      const startDate = document.getElementById("start-date")
      
      console.log(startDate)
      startDate.insertAdjacentHTML("beforeend", selectDate);
      // 投稿日時を取得
      
      // パラムにクリックした日付を渡す（現在廃止）
      // const setParams = `?date=${dataDate}`
      //   history.pushState(null, null, setParams)
      // パラムにクリックした日付を渡す（現在廃止）
      
    });
  });
  

}
window.addEventListener("load", check);


