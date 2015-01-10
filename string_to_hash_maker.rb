class StringToHashMaker
  def self.convert(str)
    # remove trailing bracket
    str_no_trail_brack = str.gsub /(\d\d\:\d\d\w\w)\]/, '\1'
    # wrap all non numbers and not dates with strings
    str_wrapped = str_no_trail_brack.gsub /(\d\d\:\d\d\w\w|[a-z_]+\d*)/, '"\1"'
    # converting colon to ruby hash symbol for easy ingestion
    str_spaceship = str_wrapped.gsub /((?<=\D):)|(:(?=\D))/, '=>'
    # evaluate the sanitized string as ruby code
    output = eval str_spaceship
    output
  end
end