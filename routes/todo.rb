  get "/" do
    format_response(Todo.all, request.accept)
  end

  get "/todos" do
    format_response(Todo.all, request.accept)
  end

  get "/todos/:id" do
    todo ||= Todo.get(params[:id]) || halt(404)
    format_response(todo, request.accept)
  end

  post "/todos" do
    body = JSON.parse request.body.read
    todo = Todo.create(
      content:    body['content'],
      created_at: Time.now,
      updated_at: Time.now
  )
  status 201
  format_response(todo, request.accept)
  end
   

  put '/todos/:id' do
    body = JSON.parse request.body.read
    todo ||= Todo.get(params[:id]) || halt(404)
    halt 500 unless todo.update(
      content:      body['content'],
      updated_at:   Time.now,
      completed_at: body['done'] ?  Time.now : nil,
      done:         body['done'] ?  true : false
    )
    format_response(todo, request.accept)
  end
  
  delete '/api/movies/:id' do
    todo ||= Todo.get(params[:id]) || halt(404)
    halt 500 unless todo.destroy
  end 

 