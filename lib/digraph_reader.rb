class DigraphReader
  def initialize( file_name, file_methods = File )
    @file_methods = file_methods
    @file_name = checked_file_for_input(file_name)
  end

  def read_graph_input
    @file_methods.open(@file_name) do |file|
      file.each_line do |line|
        (from,to,distance) = line.split("")
        yield from, to, distance.to_i
      end
    end
  end

  def checked_file_for_input(file_name)
    if @file_methods.exists?( file_name )
      return file_name
    else
      raise "Missing file"
    end
  end
end
