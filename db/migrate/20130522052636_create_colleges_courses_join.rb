class CreateCollegesCoursesJoin < ActiveRecord::Migration
  def up
  	create_table 'colleges_courses', :id => false do |t|
			t.column 'college_id', :integer
			t.column 'course_id', :integer
  	end
  end

  def down
  	drop_table 'colleges_courses'
  end
end
