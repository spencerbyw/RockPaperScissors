# Author: Spencer Bywater (@spencerbyw)
# Description: A simple Ruby application which should demonstrate what the best rock paper scissors move is based on research. See http://gizmodo.com/science-has-finally-figured-out-how-to-win-rock-paper-s-1571019588

class RockPaperScissors

	def initialize
		print "Initializing..."
		@player_moves = []
		@cpu_moves = []
		@possible_moves = ['rock', 'paper', 'scissors']
		@score = {player: 0, cpu: 0}
		@cpu_won_last_round
		puts " Done."
	end

	def run
		puts "Welcome to RockPaperScissors!"
		puts "INSERT INSTRUCTIONS HERE"
		puts "----------"

		puts "Type 'start' to play a round of 3, or 'q' to quit."
		command = ""
		while command != "q"
			print "Enter your command: "
			command = (gets.chomp.split(" "))[0]
			case command
			when 'q'		then puts "Thanks for playing!"
			when 'start' 	then play_game
			else
				puts "yeah not a big fan of that command"
			end
		end
	end

	def play_game
		round = 0
		move = ''
		while check_score == false
			printf "Rock, Paper, or Scissors?: "
			move = (gets.chomp.split(" "))[0]
			result = evaluate_move(move)
			if result == :player
				@score[:player] += 1
			elsif result == :cpu
				@score[:cpu] += 1
			end
			if check_score # See if someone's won yet
				break
			end
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
			@cpu_won_last_round == true
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

	def rps_logic(p, c)
		if p == 'rock'
			if c == 'scissors'
				return :player
			elsif c == 'paper'
				return :cpu
			end
		elsif p == 'paper'
			if c == 'scissors'
				return :cpu 
			elsif c == 'rock'
				return :player 
			end
		elsif p == 'scissors'
			if c == 'rock'
				return :cpu 
			elsif c == 'paper'
				return :player 
			end
		end
	end
end

#-----------------------------------------

rps = RockPaperScissors.new
rps.run