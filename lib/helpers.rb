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
	elsif id == "victory"
		message = <<-EOS
 _   __ _       __                    __
| | / /(_)____ / /_ ___   ____ __ __ / /
| |/ // // __// __// _ \\ / __// // //_/ 
|___//_/ \\__/ \\__/ \\___//_/   \\_, /(_)  
                             /___/      
		
		EOS
		puts message
	elsif id == "defeat"
		message = <<-EOS
   ___        ___            __         
  / _ \\ ___  / _/___  ___ _ / /_        
 / // // -_)/ _// -_)/ _ `// __/_  _  _ 
/____/ \\__//_/  \\__/ \\_,_/ \\__/(_)(_)(_)
		
		EOS
		puts message
	end
end

def random_destruction_word
	words = ['crushed', 'destroyed', 'annihilated', 'euthanized', 'obliterated', 'smashed', 'pulverized', 'blasted', 'axed', 'roasted']
	return words.shuffle.first
end

def short_hands(sh)
	case sh
	when 'r' then return 'rock'
	when 'p' then return 'paper'
	when 's' then return 'scissors'
		
	end
end