# How to add on to the "VIEWS
# @inside app folder -> app
# create a file inside views, insides certain folder name
# and call it  "index.html.erb"
            #controller action, html, erb
          #after wards goo to controller and go to the pertaining action
          # type render: :index # htmls name
          # erb = embedded ruby, lets you use ruby code inside html
          # making a variabl an instance variable lets it be accessible inside
          #the rendering html file

## HOW TO WRITE RUBY CODE INSIDE HTML
  #<%  ruby code that will not be printed %>
  #<%= ruby code that we wnat to render %>


## ex.
<ul>
 <% @books.each do |books| %>
    <li><%= book.title %> </li>
    <% end %>
  </ul>

## any view files ingerit from the layout file
 # for books show action
  #inside view "show.html.erb"

  #inside controller
  def show
    @books = Book.find_by(id: params[:id])

    if @books # checks if params is valid
       render :show #rails packs up html response and emits a response
    else
       redirect_to books_url #sends a error response300s back to use making it redirect to url
    end
  end  # can only have one redirect

end

###########----- how to use forms to allow users to interact with our site

 resources :books, only: [:index, :show, :new, :create]


# new actions will be the interactive page that will lead to create to create response
 def new
   render :new
 end

 def create
   @book = Book.new(params[:book]) #passing in all parameters into the book params
   if @book.sabve
     #show user the books show page
     redirect_to book_url(@book)
   else
      #show user the new book form
      render :new
 end

## new.html.erb
   <h1> Add book to library! <h1>
 # action: url to which we want to send data
  # method: http method that we want to use
  <form action="/books"# it can also be "<%= books_url %>" method="post">
    <label for"title">Title</label>
    <input id="title" type="text" name="book[title]"> #name= makes it the parameter theyre trying to input
 <br>
    label for"author">Title</label>
    <input id="title" type="text" name="book[author]">
<br>
    label for"year">Title</label>
    <input id="title" type="date" name="book[year]" value="<%@table.column_name"> #type to "date" makes it a calendar
<br>
    <label for="category">Category</label>
    <select id="category" name="book[category]"value="<%@table.column_name%>""> # nests the param which it returns
      <option disabled selected>-- Please selct</option> #giving default
      <option value="Fication">Fiction</options>
      <option value="NON-Fication">NONFiction</options>
      <option value="PRoFication">PRoFiction</options>
    </select>
<br><br> # br breaks aline
    label for"description">Description</label>
    <textarea name="book[description]"></textarea>

    <input type="submot" value="Add book to library">
  </form>



  ##strong parame
   private
   def book_params
     params.require(:book).permit(#attirubutes) #this will only allow certain params to come through
   end



   #### how to link between index to show
    <a href="<%= bleats_url %>">Back to index </>  ##links are always going to be gets
    <a href="<%=new_bleat_url%>">Write a new beat</a>new_bleat is the name of the item
       on the left of the routes table, and url will direct it to first gets method

    #### difference between url and path

    #tablename_url
     ## will bring the entire address http

    # where as tablename_path
     ## will bring /bleats


##### creating
     def edit
       @bleat = Bleat.new
       render :edit ## create edit.html.erb inside views
     end



     <form actions="<% bleast_url %>" method ="POST"> #the url has to be a designation where you want it to go
       #method is the action of controll it's calling
     <ul>
     <% @bleat.errors.full_messages.each do |msg| %>
       <li><%= msg %> </li>
     <% end %>

     <label>
       Body
         <input type="text" name="bleat[body]" value="<%= @blea.body %>"/>
       </label>

     <label for="bleat-author_id">Author ID </label>
     <input id="bleat-author_id"
       type = "number"
       name = "bleat[author_id]"
       value= "<% @bleaet.authord_id %>" />

       <button> Update the bleat!</button>

     </form>


  ##### editing
    #inside controller && add to routes

  def edit
    @bleat = Bleat.new
    render :edit ## create edit.html.erb inside views
  end



  <form actions="<% bleat_url(@bleat.id) %>" method ="POST"> #the url has to be a designation where you want it to go
            #POST cant be altered because Rails dosn't support put yet
            #there for it needs the following request
      <input type="hidden" name="_methoe" value="PUT">

  <ul>
  <% @bleat.errors.full_messages.each do |msg| %>
    <li><%= msg %> </li>
  <% end %>

  <label>
    Body
      <input type="text" name="bleat[body]" value="<%= @blea.body %>"/>
    </label>

  <label for="bleat-author_id">Author ID </label>
  <input id="bleat-author_id"
    type = "number"
    name = "bleat[author_id]"
    value= "<% @bleaet.authord_id %>" />

    <button> Update the bleat!</button>

  </form>



@@@@@ def update
  bleat - Bleat.find(params[:id])
  if bleat,update(bleat_params)
    redirect_to bleat_url(bleat.id)
  else
      render :edit
    end
end




######### partials

 # create a file called _form.html.erb
  #this file will have all componentst of forms,
   # best not to use instance variables
   #
   <form actions="<% bleat_url(@bleat.id) %>" method ="POST"> #the url has to be a designation where you want it to go
             #POST cant be altered because Rails dosn't support put yet
             #there for it needs the following request
       <input type="hidden" name="_methoe" value="PUT">

   <ul>
   <% @bleat.errors.full_messages.each do |msg| %>
     <li><%= msg %> </li>
   <% end %>

   <label>
     Body
       <input type="text" name="bleat[body]" value="<%= @blea.body %>"/>
     </label>

   <label for="bleat-author_id">Author ID </label>
   <input id="bleat-author_id"
     type = "number"
     name = "bleat[author_id]"
     value= "<% @bleaet.authord_id %>" />

     <button> Update the bleat!</button>

   </form>


   #inside the page that will use this parial form, ex edit , it should be as followed
 <% if bleat.persisted? %>
   <%action = bleat_url(bleat.id) %>
   <%method_overrride = '<input type="hidden" name="_methoe" value="PUT">'.html_safe %> #this overrides the PUT and moves onto the next one
   <%button_text = "Update the bleat!" %>
<% else %>
  <% action = bleats_url%>
  <% method_override = "" %>
  <%button_text = "Create the bleat!">

   <h1> Make a new Bleat! </h1>
   <%= render :form, bleat = @bleat> # for edit
   <%= render partial: "form", locals: {bleat: @bleat} %> #for new


   # how to differentiated between new and edit

   <form actions="<% actions %>" method ="POST"> ## the url has to be a designation where you want it to go
             #POST cant be altered because Rails dosn't support put yet
             #there for it needs the following request
             ## actions is also a variable
       method_override

   <ul>
   <% @bleat.errors.full_messages.each do |msg| %>
     <li><%= msg %> </li>
   <% end %>

   <label>
     Body
       <input type="text" name="bleat[body]" value="<%= @blea.body %>"/>
     </label>

   <label for="bleat-author_id">Author ID </label>
   <input id="bleat-author_id"
     type = "number"
     name = "bleat[author_id]"
     value= "<% @bleaet.authord_id %>" />

     <button> Update the bleat!</button>

   </form>


<!-- DELETE -->
# deletes have to be done through form not anchor tabgs because anchor tags only
#put out get requests
  <form action="<%= bleat_url{@bleat.id}%>" method ="POST"
    <input type="hidden" name="_method" value="DELETE">
    <input type="submit" value="Destroy the bleat!">
  </form>


  MDN HTML Tags < where we want the html tags from
