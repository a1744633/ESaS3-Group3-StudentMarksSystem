class AssignmentController < ApplicationController

  #def goto
    #@allassignments = Assignment.goto
    #end

  def admin
    #@assignments = Assignment.all
    #session[:id] = params[:id]
    #id = -1
    @assignment = Assignment.admin
    puts 'pls work'
    puts session[:id]
    puts 'haha'
    #@allassignments = Assignment.admin(id)
    # puts @allassignments

    if session[:id] == 1
      #@assignment = Assignment.admin(session[:id])
      puts 'hahahahha wtf'
      # @allassignments = Assignment.admin(id)
      #puts @allassignments
    end

    #@joined - User.left_joins(:Assignment).where(studentid: @all_ids, name: @all_students, comments:@all_comments,
    #grades: @all_grades)
  end

  #def admin
  #  @assignment = Task.includes(:assignment , :user, :mark).all
  #  @allassignments = Assignment.admin
  #end

  def create
    # @assignments = Assignment.new
    Assignment.create(assignment_params)
  end

  def edit
    session[:id] = params[:id]
  end

  def show
  end

  def update
    @why = params[:id]
    puts @why
    Assignment.update(params[:id], assignment_params)
     respond_to do |format|
        format.html do
       redirect_to '/assignment/admin'
        end
      end
    # end
  end

  def destroy
    @assignments.destroy
    #respond_to do |format|
    # format.html { redirect_to href="/admin", notice: "Student submission was successfully removed from the Database."}
    # format.json { head :no_content }
    #end
  end

  def assignment_params
    #params.permit(:courseid, :assignmentid, :assignmentname, :assignmentdescr, :grade, :mark, :comments)
    params.permit(:course_id, :assignmentname, :assignmentdesc, :weight)
  end

end
