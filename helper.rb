require 'smarter_csv'
module Helper
  def self.go

    file_str = './factual.input.txt'
    File.readlines(file_str).each do |line|

    end
    clean_str = 'clean.txt'
    File.open(clean_str, "w") do |out_line|
      File.open(file_str, "r") do |in_line|
        line = in_line.read
        clean_line = line.gsub("\t\t\t", "\t").gsub("\t\t", "\t").gsub(/\r\n?/, "\n").gsub(/\t$/, "").gsub('"', '')
        out_line.write(clean_line)
      end
    end
    tracker_hash = {}
    total_chunks = SmarterCSV.process(clean_str, {:chunk_size => 2, :col_sep => "\t", :row_sep => "\n"}) do |chunk|
      chunk.each do |h| # you can post-process the data from each row to your heart's content, and also create virtual attributes:
        h.each { |key, value|
          tracker_hash[key.to_s] ||= [-1, nil]
          in_length = value.to_s.chars.length
          if in_length > tracker_hash[key.to_s].first
            tracker_hash[key.to_s] = [in_length, h[:factual_id]]
          end
        }

      end
      #puts chunk.inspect # we could at this point pass the chunk to a Resque worker..
    end
    tracker_hash
  end
end