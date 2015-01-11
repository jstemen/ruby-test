require 'smarter_csv'
module DataProcessor
  def self.go(file_str)

    tracker_hash = {}
    opts_hash = {:force_simple_split => true, # enables processing of data with quotes in it
                 :strip_chars_from_headers => /[\-"]/,# enables processing of data with quotes in it
                 :remove_empty_values => false, # Make sure we have a record of all headers; even ones without data
                 :strings_as_keys => true,  # leaving the headers a symbols would be for efficient, but this is easier
                 :chunk_size => 20, # chucks will let us process an arbitrary amount of records
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