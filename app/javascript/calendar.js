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
    selectable: true
  });
  

  calendar.render();
});

function check() {
  const posts = document.querySelectorAll(".fc-daygrid-day");
  posts.forEach(function (post) {
    post.addEventListener("click", () => { 
      
      const dataDate = post.getAttribute("data-date")
      console.log(dataDate)
      const selectDate = `<input value=${dataDate} type="hidden" name='good_thing[start_date]'>`;
      const div2 = document.getElementById("select-date")
      
      console.log(div2)
      const input1 = div2.insertAdjacentHTML("beforeend", selectDate);
      
      
    });
  });
  

}
window.addEventListener("load", check);

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
