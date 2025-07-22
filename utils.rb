##
# Utils module, contains some methods to save development time and
# avoid repetition.
module Utils
  INPUT_DIR_NAME = './inputs/'

  ##
  # Opens the input file of the given name located in './inputs/{input_file_name}.txt' 
  def self.input_file(input_file_name)
    input_file_path = Pathname(INPUT_DIR_NAME).join input_file_name
    File.read(input_file_path)
  end

  ##
  # Creates a file and its parent directories if they didn't exist yet.
  def self.create_file(file_name, contents = '')
    FileUtils.mkdir_p(File.dirname(file_name))
    File.write(file_name, contents)
  end
end