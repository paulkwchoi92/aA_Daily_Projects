user - request - server - rack - rails - response - client


rack is a middleware that sits between servers and rails
rack knows what kind of reponse server expects and fabricates the data as so


HOW rail interacts with rack


Rack::Server.start({app: most_basic_app, Port:3000})


-rails has a function "hot reload" where it reloads all things built into the rails file
- normally it wouldnt be automaticllay refreshed



#2nd


most_basic_redirect_app = Proc,new do
  [
    '302',
    {'content-type' => 'text/html', 'location' => https://www.google.com
      []
  ]
  Rack::Server.start({app: most_basic_redirect_app, Port:3000})

  less_basic_app = Proc.new do
    res = Rack::Response.new
    res.status = 200
    res.set_header('Contetn-Type', 'text/html')
    res.write('not so basic rack app')
    res.finish
  end

  Rack::Server.start (
    app: less_basic_app,
    Port: 3000
  )


  cookie_party_app = Proc.new do |env|
    req = Rack::Request.new(env)
    res = Rack:;Response.new
    reslwrite("<h1>COOKIE PARTY<h1>")
    if req.cookies["cookie_party"]
        res.write("<h2> We have cookie for our party!</h2>")
    else
        res.write("<h2>aw, there's no cookies! Refresh to make some.<h2>")
    end
     res.set_cookie("cookie_party:", {value: true})
     res.finish
   end
