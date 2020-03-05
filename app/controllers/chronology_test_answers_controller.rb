class ChronologyTestAnswersController < ApplicationController

  def show
    @chronology_test_answer = ChronologyTestAnswer.find(params[:id])
    student_answer = @chronology_test_answer.student_answer
    if not student_answer.nil?
      #if student_answer == /\A[\d ]*\d\z/
        #flash.now[:danger] = chronology_test_score_n_answer(@chronology_test_answer.answer, student_answer)
      #else
        flash.now[:danger] = chronology_test_score_n_answer(@chronology_test_answer.answer, student_answer)
        #flash.now[:danger] = 'Please Insert Student Answer with Correct Format'
      #end
    else
      flash.now[:danger] = 'No student answer entered yet'
    end
  end

  def edit
    @chronology_test_answer = ChronologyTestAnswer.find(params[:id])
  end

  def update
    @chronology_test_answer = ChronologyTestAnswer.find(params[:id])
    if @chronology_test_answer.update_attribute(:student_answer, params[:chronology_test_answer][:student_answer])
      puts params[:student_answer]
      # Handle a successful update
      redirect_to @chronology_test_answer
    else
      render 'edit'
    end
  end

  def new
    @chronology_test_answer = ChronologyTestAnswer.new
  end

  def create
    @chronology_test_answer = ChronologyTestAnswer.new(chronology_test_answer_params)
    if @chronology_test_answer.save
      #handle successful save
      redirect_to @chronology_test_answer
    else
      render 'new'
    end
  end

  private

    def chronology_test_answer_params
      params.require(:chronology_test_answer).permit(:name, :answer, :student_answer, :password,
                                                    :password_confirmation)
    end

    def chronology_test_score_n_answer(key, student_answer)
    	#reorder student answer
    	orig_student_answer = student_answer.split(' ').map(&:to_i)
    	#print orig_student_answer
    	#puts 'orig answer'
    	new_student_answer = Array.new(orig_student_answer.length(), 0)
    	key_sequence_num = key.split(' ')

    	#print key_sequence_num
    	#puts 'key sequence'

    	for i in 0 ... key_sequence_num.length()
    		index = key_sequence_num[i].to_i - 1
    		new_student_answer[index] = orig_student_answer[i]
    	end

    	#print new_student_answer
    	#puts 'new answer'

    	#puts "------------------------------------------------------"
    	return max_align(new_student_answer, key.length())
    end

    def max_align(user_answer, key_length)
    	#Preprocessing method should
    	# 1. Check for answer length
    	#	2. Check for integers in answers

    	#Initializing 2D Arrays
    	correct_answer = (1 ... key_length+1).to_a
    	#print correct_answer
    	dp = Array.new(key_length+1) {Array.new(user_answer.length()+1,0)}

    	#Calculate Score
    	for i in 1 ... key_length+1
    		for j in 1 ... user_answer.length()+1
    			if correct_answer[i-1] == user_answer[j-1]
    				#puts "correct!"
    				dp[i][j] = dp[i-1][j-1] + 1
    			else
    				dp[i][j] = [dp[i][j-1], dp[i-1][j]].max
    			end
    			#print dp[i][j]
    			#print " "
    		end
    		#puts " "
    	end

    	#Printing
    	max_length = dp[key_length][user_answer.length()]
    	temp = max_length

    	#Int array to store the lcs answer
    	lcs_answer = Array.new(max_length)

    	# Start from the right-most-bottom-most corner and
      # one by one store characters in lcs[]
    	i, j = key_length, user_answer.length()
    	while (i > 0) && (j > 0) do
    		if correct_answer[i-1] == user_answer[j-1]
    			lcs_answer[temp - 1] = correct_answer[i-1]
    			i = i-1
    			j = j-1
    			temp = temp-1
    		elsif dp[i-1][j] > dp[i][j-1]
    			i = i-1
    		else
    			j = j-1
    		end
    	end

    	return max_length, lcs_answer
    end


end
