require 'smarter_csv'
module Helper
  def self.go

    file_str = './factual.input.txt'

    tracker_hash = {}
    opts_hash = {:force_simple_split => true,
                 :strip_chars_from_headers => /[\-"]/,
                 :remove_empty_values => false,
                 :strings_as_keys => true,
                 :chunk_size => 20,
                 :col_sep => "\t",
                 :row_sep => "\n"}
    total_chunks = SmarterCSV.process(file_str, opts_hash) do |chunk|
      chunk.each do |row|
        row.each do |key, value|
          tracker_hash[key] ||= [0, ""]
          in_length = value.to_s.chars.length
          if in_length > tracker_hash[key].first
            tracker_hash[key] = [in_length, row["factual_id"]]
          end
        end
      end
    end
    tracker_hash
  end
end