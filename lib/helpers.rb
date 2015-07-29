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

def reset_globals
	@player_moves = []
	@cpu_moves = []
	@possible_moves = ['rock', 'paper', 'scissors']
	@score = {player: 0, cpu: 0}
	@cpu_won_last_round = nil
end

def mega_text(id)
	# Based on the id entered, print the desired thing.
	if id == "title"
		welcome = <<-EOS
   ___             __    ___                        ____      _                           __
  / _ \\ ___  ____ / /__ / _ \\ ___ _ ___  ___  ____ / __/____ (_)___  ___ ___   ____ ___  / /
 / , _// _ \\/ __//  '_// ___// _ `// _ \\/ -_)/ __/_\\ \\ / __// /(_-< (_-</ _ \\ / __/(_-< /_/ 
/_/|_| \\___/\\__//_/\\_\\/_/    \\_,_// .__/\\__//_/  /___/ \\__//_//___//___/\\___//_/  /___/(_)  
---------------------------------/_/--------------------------------------------------------
--------------------------------------------------------------------------------------------

		EOS
		puts welcome

	end
end