<%= image_tag("IMG_0096.JPG", :alt => "Flower Pict",  :height => "80px", :width => "80px") %>
    <%= image_tag("IMG_0183.JPG", :alt => "Flower Pict", :height => "80px", :width => "80px") %>
    <%= image_tag("IMG_0226.JPG", :alt => "Flower Pict",  :height => "80px", :width => "80px") %>
    <%= image_tag("IMG_0228.JPG", :alt => "Flower Pict", :height => "80px", :width => "80px") %>
    <%= image_tag("IMG_0834.JPG", :alt => "Flower Pict",  :height => "80px", :width => "80px") %>
    <%= image_tag("IMG_7927.jpg", :alt => "Flower Pict",  :height => "80px", :width => "80px") %>
    <%= image_tag("IMG_8184.JPG", :alt => "Flower Pict",  :height => "80px", :width => "80px") %>
    <%= image_tag("IMG_8193.JPG", :alt => "Flower Pict" , :height => "80px", :width => "80px") %>
    <%= image_tag("IMG_9326.JPG", :alt => "Flower Pict" ,  :height => "80px", :width => "80px") %>
    <%= image_tag("IMG_9405.JPG", :alt => "Flower Pict",  :height => "80px", :width => "80px") %>
    <%= image_tag("IMG_9422.JPG", :alt => "Flower Pict",  :height => "80px", :width => "80px") %>
    <%= image_tag("IMG_9449.JPG", :alt => "Flower Pict",  :height => "80px", :width => "80px") %>
    <%= image_tag("IMG_9748.jpg", :alt => "Flower Pict",  :height => "80px", :width => "80px") %>
    <%= image_tag("IMG_9756.jpg", :alt => "Flower Pict",  :height => "80px", :width => "80px") %>
    <%= image_tag("IMG_9873.jpg", :alt => "Flower Pict",  :height => "80px", :width => "80px") %>
       FROM PHOTOS INDEX

    <figure>
<%= image_tag("_MG_9486.jpg", :alt => "Flower Pict", :height => "80px", :width => "80px") %>
            F
    <figcaption><%=link_to("Tulip One", "http://www.google.com")%> </figcaption>
</figure>
<table><tr>
  <% @photos.each do |photo| %>
      <td>                    <div >
        <%= image_tag photo.avatar.url(:thumb) %>


                                         <p>
                                         <b>Title:</b>
          <%= photo.title %>
        </p>

<p>
<b>Identification:</b>
          <%= photo.classification %>
        </p>

<p class="taker">
<b>taken by:</b>
          <%= photo.username %>
        </p>
<%= form_for([photo, photo.comments.build]) do |f| %>
            <div class="field">
<%= f.hidden_field :user_id %>
              <%= f.hidden_field :photo_id %>
                                    </div>
            <div class="field">
              <%= f.label :text %><br />
                                    <%= f.text_area :text, rows: '4' %>
            </div>
            <div class="actions">
                                    <%= f.submit "comment"%>
            </div>
        <% end %>

        <div id="comment">
                                    <% photo.comments.each do |comment|%>
              <p><%= sanitize comment.text %><p>
          <% end%>
        </div>

      </div>
        <%= link_to 'Edit', edit_photo_path(photo) %> |
<%= link_to 'Back', photos_path %>
        <%= link_to image_tag('fb_icon.png'), 'https://www.facebook.com/dialog/feed?
  app_id=458358780877780

  &redirect_uri='+photo.avatar.url(:thumb) , :target => :blank %></td>     <% end %>    </tr></table>

<br />
<%= button_to 'New Photo', new_photo_path, :method => :get %>
<%= link_to 'New Photo', new_photo_path %>
<div id="mapcanvas" style="width:700px;height:600px;" >
</div>

<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAuYer5Veg6dpOrtSuJm5hUPmdIfNhzVfk&sensor=false">
</script>
<script>
    var mapOptions = {
        zoom: 2,
        center: new google.maps.LatLng(53.3428, -6.26),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById('mapcanvas'), mapOptions);

    <% @photos.each do |photo| %>
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(<%= photo.lat %>, <%= photo.long %>),
        map: map,
        title: "<%= photo.title %>"
    });
    <% end %>

</script>

<table>
  <tr>
    <th>Long</th>
    <th>Lat</th>
    <th>Path photo</th>
    <th>Title</th>
    <th>User</th>
    <th></th>
    <th></th>
    <th></th>
  </tr>

<% @photos.each do |photo| %>
  <tr>
    <td><%= photo.long %></td>
<td><%= photo.lat %></td>
    <td><%= photo.path_photo %></td>
<td><%= photo.title %></td>
    <td><%= photo.user_id %></td>
<td><%= link_to 'Show', photo ,class: "btn btn-primary"%></td>
    <td><%= link_to 'Edit', edit_photo_path(photo),class: "btn btn-primary" %></td>
    <td><%= link_to 'Destroy', photo,class: "btn btn-primary", method: :delete, data: { confirm: 'Are you sure?' } %></td>
</tr>
<% end %>
</table>


    FROM COMMENTS INDEX
<div class="page-header" xmlns="http://www.w3.org/1999/html">
<h1>Comments</h1>
 </div>

<%= link_to 'New Comment', new_comment_path, class: "btn btn-info" %>
<% @comments.each do |comment| %>
   <div class="comments">
<strong><%=comment.text %></strong>
       <p><%= comment.username %></p>
<p> <%= comment.parent_id %></p>
      <div class="meta">
    <%= link_to time_ago_in_words(comment.created_at) + " ago", comment %>
      <span class="admin">
| <%= link_to "Edit", edit_comment_path(comment) %>  |
       <%= link_to "Destroy",comment, method: :delete, data: { confirm: 'Are you sure?' } %>
</span>
      </div>
</div>

<% end %>

<table>
  <tr>
    <th>Image Url</th>
<th>User</th>
    <th>Title</th>
<th></th>
    <th></th>
<th></th>
  </tr>
          INDENTIFICATIONS INDEX
<% @identifications.each do |identification| %>
  <tr>
    <td><%= identification.image_url %></td>
    <td><%= identification.user_id %></td>
    <td><%= identification.title %></td>
    <td><%= link_to ' Show ', identification %></td>

    <%if current_user.admin? %>

        <td><%= link_to 'Edit', edit_identification_path(identification) %></td>


        <td><%= link_to 'Destroy', identification, method: :delete, data: { confirm: 'Are you sure?' } %></td>


  </tr>

        <%end%>



        <% end %>
    <%if current_user.admin? %>

<tr><td>&nbsp;</td></tr><tr>
    <td colspan ="3"><%= link_to 'New Identification ', new_identification_path %></td><td></td><td></td></tr>

      <% end %>
</table>