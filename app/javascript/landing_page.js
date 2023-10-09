const btn = document.getElementsByClassName("top-course");
let clicked_course = "Python";
// show_filtered_courses("mySwiper1", clicked_course);

for (let i = 0; i < btn.length; i++) {
    btn[i].addEventListener("click", () => {
        clicked_course = btn[i].innerText
        console.log(clicked_course)
        show_filtered_courses("mySwiper1", clicked_course);
    })
}

function show_filtered_courses(id, clicked_course) {
    console.log(id);
    let show_div = document.getElementById(id);
    console.log(show_div)
    let my_div = `
    <% filter_course("python").each do |course|%> 
    <div class="card swiper-slide">
      <div class="course-img"> <% if course.course_image.attached? %>
          <img src=<%=(url_for(course.course_image))%>>
        <% end %>
      </div>
      <div class="text">
      <% if  @student_id %>
          <h3><%= link_to "#{course.courseTitle}", course_show_path(student_id: @student_id, course_id: course.id)%></h3>
          <%else %>
          <a class="row title" href="/course/<%= course.id %>">
            <h3><%= course.courseTitle %></h3>
          </a>
          <%end%>
          <div class="row">
          <p class="article"><%= course.courseDescription %></p>
          <p class="article">Module- <%= course.courseDuration %></p>
          <p class="article">Price- <%= course.coursePrice %></p>
          <%= button_to "Buy Now", course_buy_path(student_id: @student_id,course_id: course.id), class: "btn btn-primary" %>
          </div>
          </div>
    </div>
  <%end%>
  `
}


