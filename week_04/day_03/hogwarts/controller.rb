require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('models/student.rb')
also_reload('./models/*')


# Create a view to show all the students
get '/students' do
  @students = Student.all()
  erb(:index)
end

# Create a view to create a new student
get '/students/new' do
  @houses = House.all()
  erb(:new)
end

# Save a new student to db:
post '/students' do
  @new_student = Student.new(params)
  @new_student.save
  redirect '/students'
end
