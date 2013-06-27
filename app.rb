require 'debugger'
require 'sinatra'

require_relative 'models/school.rb'
require_relative 'models/course.rb'

get '/school' do
  erb :'school/new'
end

post '/school' do
  @school = School.new
  @school.name = params[:school][:name]
  @school.size = params[:school][:size]
  @school.location = params[:school][:location]
  
  params[:school][:courses].each do |course|
    # debugger
    indiv_course = Course.new
    indiv_course.name = course[:name]
    indiv_course.size = course[:size]
    indiv_course.teacher = course[:teacher]
    @school.add_course(indiv_course)
  end

  erb :'school/show'
end