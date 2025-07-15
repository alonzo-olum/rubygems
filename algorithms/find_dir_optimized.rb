def find_dir_optimized(directory)
  Dir.foreach(directory) do |filename|
    if File.directory?("#{directory}/#{filename}") &&
      filename != "." && filename != ".."
      puts "#{directory}/#{filename}"
      find_dir_optimized("#{directory}/#{filename}")
    end
  end
end

find_dir_optimized(".")
