class Assignment < ApplicationRecord
  belongs_to :course
  has_one :mark
  has_many :tasks
  has_many :users, through: :tasks

  def self.student
    #Task.includes(:assignment, :user, :mark).where(studentid: 'a1781637')
    Task.includes(:assignment , :user, :mark).where(user_id: 4)
    #@details = Task.includes(:assignment , :user, :mark).all
  end

  def self.averageassgrade()
    sum = Mark.where(asstype: "Assignment").sum(:mark)
    num = Mark.where(asstype: "Assignment").all.count
    sum/num
  end

  def self.averageexamgrade()
    sum = Mark.where(asstype: "Exam").sum(:mark)
    num = Mark.where(asstype: "Exam").all.count
    sum/num
  end

  def self.averagecurrentgrade(id)
    sum = Task.includes(:mark).where(assignment_id: id).sum(:mark)
    #sum=Mark.where(task_id: id).sum(:mark)
    num = Task.includes(:mark).where(assignment_id: id).count
    if num!=0

      sum/num
    end
  end
  def self.same(id)
    userid=Task.includes(:user_id).where(assignment_id: id)
    Task.includes(:assignment , :user, :mark).where(user_id: userid)

  end

  def self.userid(id)
    Task.includes(:user_id).where(assignment_id: id).all

  end



  def self.student(studentid)
    Task.includes(:assignment , :user, :mark).where(user_id: User.select(:id).where(studentid: studentid))
  end

  def self.admin(id)
    #Task.includes(:assignment , :user, :mark).find_by_id(id: session)

    #Task.includes(:assignment , :user, :mark).all

    if id == -1
      Task.includes(:assignment , :user, :mark).all
    else
      Task.includes(:assignment , :user, :mark).where(assignment_id: id)
    end
    #Task.includes(:assignment , :user, :mark).find_by(id: id)
    #if session == -1
      #@assignment = Task.includes(:assignment , :user, :mark).all
      #@allassignments = Assignment.all
      #@allassignments = Task.includes(:assignment , :user, :mark).all

      #else
      #@allassignments = Task.includes(:assignment , :user, :mark).all
      #@assignment = Task.includes(:assignment , :user, :mark).find_by(assignment_id: session)
      #@assignment = Task.includes(:assignment , :user, :mark).all
      #@allassignments = Assignment.all
      #end
  end


  #def self.create(assignment_params)
    #Assignment.create(assignment_params)
    # self.Assignment.new
  #end

  def edit
    session[:id] = params[:id]
  end

  def show
  end

  def self.update(id , params)
     assignment = Mark.find_by(task_id: id)

     if assignment == nil
       puts 'why???? tho'
     end
     #assignment.update_attribute(:mark, params[:mark])

     params[:mark] = params[:mark].to_i

     if params[:mark] < 50 && params[:mark] >= 0
       assignment.update_attribute(:grade, "F")
       assignment.update_attribute(:mark, params[:mark])
       assignment.update_attribute(:comment, params[:comment])
     end
     if params[:mark] >= 50 && params[:mark] < 65
       assignment.update_attribute(:grade, "P")
       assignment.update_attribute(:mark, params[:mark])
       assignment.update_attribute(:comment, params[:comment])
     end
     if params[:mark] >= 65 && params[:mark] < 75
       assignment.update_attribute(:grade, "C")
       assignment.update_attribute(:mark, params[:mark])
       assignment.update_attribute(:comment, params[:comment])
     end
     if params[:mark] >= 75 && params[:mark] < 85
       assignment.update_attribute(:grade, "D")
       assignment.update_attribute(:mark, params[:mark])
       assignment.update_attribute(:comment, params[:comment])
     end
     if params[:mark] >= 85 && params[:mark] <= 100
       assignment.update_attribute(:grade, "HD")
       assignment.update_attribute(:mark, params[:mark])
       assignment.update_attribute(:comment, params[:comment])
     end


     if params[:mark] < 0 || params[:mark] > 100
       #puts '++++++++++++++++is this working'
       params[:mark] = params[:mark].to_s
       @prev = assignment.mark
       #puts @prev
       assignment.update_attribute(:comment, "previous mark was: #{@prev}")
       assignment.update_attribute(:mark, 0)
       assignment.update_attribute(:grade, nil)
     end

     #if assignment.mark < 50
     #  assignment.update_attribute(:grade, "F")
     #
     #if assignment.mark >= 50 && assignment.mark < 65
     # assignment.update_attribute(:grade, "P")
     #end
     #if assignment.mark >= 65 && assignment.mark < 75
     #assignment.update_attribute(:grade, "C")
     #end
     #if assignment.mark >= 75 && assignment.mark < 85
     # assignment.update_attribute(:grade, "D")
     #end
     #if assignment.mark >= 85
     # assignment.update_attribute(:grade, "HD")
     #end

  end

  def destroy
    #respond_to do |format|
    #  format.html { redirect_to href="/admin", notice: "Student submission was successfully removed from the Database."}
    #  format.json { head :no_content }
    #end
  end

  #def assignment_params
    #params.permit(:courseid, :assignmentid, :assignmentname, :assignmentdescr, :grade, :mark, :comments)
  #params.permit(:course_id, :assignmentname, :assignmentdesc, :weight)
  #end

end
