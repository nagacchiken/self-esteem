import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import { data } from 'jquery';

document.addEventListener('turbolinks:load', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin ],
    events: 'index.json',
    initialView: 'dayGridMonth',
    
    
  });
  

  calendar.render();
});


function dateClick() {
  const dateClicks = document.querySelectorAll(".fc-daygrid-day-frame");
  dateClicks.forEach(function (dateClick) {

    dateClick.insertAdjacentHTML("beforeend", `<button type="button" class="btn " data-toggle="modal" data-target="#exampleModal">記入する</button>`);
  })
}
window.addEventListener("load", dateClick);


function check() {
  const posts = document.querySelectorAll(".fc-daygrid-day");
  posts.forEach(function (post) {
    post.addEventListener("click", () => { 
      
      const dataDate = post.getAttribute("data-date")
      console.log(dataDate)
      const selectDate = `<input value=${dataDate} type="hidden" name='good_thing[start_date]'>`;
      const startDate = document.getElementById("start-date")
      
      console.log(startDate)
      startDate.insertAdjacentHTML("beforeend", selectDate);
      
      
    });
  });
  

}
window.addEventListener("load", check);

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
