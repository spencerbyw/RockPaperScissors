# Author: Spencer Bywater (@spencerbyw)
# Description: A simple Ruby application which should demonstrate what the best rock paper scissors move is based on the following research. See http://gizmodo.com/science-has-finally-figured-out-how-to-win-rock-paper-s-1571019588

require_relative 'helpers.rb'

class RockPaperScissors

	def initialize
		print "Loading..."
		@player_moves = []
		@cpu_moves = []
		@possible_moves = ['rock', 'paper', 'scissors']
		@score = {player: 0, cpu: 0}
		@cpu_won_last_round
		puts " Done.\n\n"
	end

	def run
		puts "--------------------------------------------------------------------------------------------\n"
		puts "Welcome to...                                                             by Spencer Bywater\n\n"

		mega_text('title')
		
		puts "You must face the unsurmountable CPU itself using naught but ROCK, and PAPER, and SCISSORS."
		puts "- Type 'start' to play a round of 3, or 'q' to flee in cowardice."
		puts "- When prompted, type 'rock', 'paper', or 'scissors' to select your move."
		puts "- Try to win."
		puts "--------------------------------------------------------------------------------------------\n\n"
		command = ""
		while command != "q"
			print "Enter your command: "
			command = (gets.chomp.split(" "))[0]
			case command
			when 'q'		then puts "Thanks for playing!"
			when 'start' 	then play_game
			else
				puts "...yeah not a big fan of that command."
			end
		end
	end

	def play_game
		round = 0
		reset_globals
		move = ''
		while check_score == false
			printf "Rock, Paper, or Scissors?: "
			move = (gets.chomp.split(" "))[0]
			result = evaluate_move(move)
			result_layman = 'tie'
			if result == :player
				@score[:player] += 1
				result_layman = "You"
			elsif result == :cpu
				@score[:cpu] += 1
				result_layman = "CPU"
			end
			if check_score # See if someone's won yet
				break
			end
			print_round_by_round_score(result_layman)
			round += 1
		end
	end

	def evaluate_move(player_move)
		@player_moves << player_move
		cpu_move = ''

		# If this is the first round, just choose a random move
		if @cpu_moves.empty?
			cpu_move = @possible_moves.shuffle.last 
		end

		cpu_last_move = @cpu_moves.last
		if @cpu_won_last_round == true
			case cpu_last_move
			when 'rock' 	then cpu_move = 'scissors'
			when 'paper' 	then cpu_move = 'rock'
			when 'scissors' then cpu_move = 'paper'
			end
		elsif @cpu_won_last_round == false  # Assume for now no one has read the study
			case cpu_last_move
			when 'rock' 	then cpu_move = 'scissors'
			when 'paper'	then cpu_move = 'rock'
			when 'scissors'	then cpu_move = 'paper'
			end
		end

		@cpu_moves << cpu_move
		result = rps_logic(player_move, cpu_move)
		if result == :cpu 
			@cpu_won_last_round = true
		else
			@cpu_won_last_round = false
		end
		return result

	end

	def check_score
		if @score[:player] >= 2
			puts "You win!"
			final_score
			return true
		elsif @score[:cpu] >= 2
			puts "CPU beat you... :("
			final_score
			return true 
		else
			return false
		end
	end

	def final_score
		puts "THAT'S THE END, FOLKS."
		p @score
	end

	def print_round_by_round_score(winner)
		puts "----------------------------------------"
		if winner == 'tie'
			puts "|                     Tie!!!           |"
		else
			case winner
			when 'You' then puts "|              #{winner} win this round!     |"
			when 'CPU' then puts "|              #{winner} wins this round!    |"
			end
			# puts "                 The winner is: #{winner}"
		end
		puts "----------------------------------------"
		puts "|                Player  vs  CPU       |"
		# Proper lined-up output
		print "|       Played:  "
		printf "%-#{12}s", @player_moves.last.upcase
		printf "%-#{10}s", @cpu_moves.last.upcase
		print "|\n"          #
		puts "|Current Score:    #{@score[:player]}          #{@score[:cpu]}        |"
		puts "----------------------------------------"
		puts ''
	end
end

#-----------------------------------------

rps = RockPaperScissors.new
rps.run