#!/usr/bin/env ruby
<<PROGRAM_DESCRIPTION
  problem_helper create 10001
    Creates the problem's directory, the file, an input directory and the test file.

  problem_helper test 10001
    Executes all test files (files starting in test_*) in the problem directory of the given
    problem ID
PROGRAM_DESCRIPTION

require 'gli'
require_relative 'utils'

include GLI::App

program_desc 'My Sample CLI with subcommands using GLI'

version '1.0.0'

desc 'Sets up the problem environment.'
command 'create' do |c|
  c.desc 'Problem bundle'
  c.arg_name 'bundle'

  c.desc 'Problem name'
  c.arg_name 'problem'

  c.desc 'Removes the existing directory if exists, and creates the problem\'s directory.'
  c.switch [:f, :force]

  c.action do |global_options, options, args|
    problem_bundle = args.first
    problem_name = args[1]

    if problem_name.nil? || problem_bundle.nil?
      puts 'No problem name or bundle given.'
      exit 1
    end

    puts ">> CREATING SETUP FOR '#{problem_name}'..."

    problem_dir = Pathname(problem_bundle).join(problem_name)

    if File.exist?(problem_dir)
      if options[:force]
        FileUtils.rm_rf(problem_dir)
      else
        puts "A problem with ID #{problem_dir} already exists. Use -f/--force to remove."
        exit 1
      end
    end

    Utils::create_file(problem_dir.join("#{problem_name}.rb"))
    Utils::create_file(problem_dir.join("test_#{problem_name}.rb"))
    FileUtils.mkdir_p(problem_dir.join('inputs'))
  end
end

desc 'Runs the testfiles of the specified problem.'
command 'test' do |c|
  c.desc 'Problem bundle'
  c.arg_name 'bundle'

  c.desc 'Problem name'
  c.arg_name 'problem'

  c.action do |global_options, options, args|
    problem_bundle = args.first
    problem_name = args[1]

    if problem_name.nil? || problem_bundle.nil?
      puts 'No problem bundle or name given.'
      exit 1
    end

    problem_dir = Pathname(problem_bundle).join(problem_name)

    if !File.exist? problem_dir
      puts "No such problem: #{problem_dir}"
      exit 1
    end

    puts ">> TESTING '#{problem_dir}'..."
    puts "Problem: #{problem_dir}"

    test_files = Dir["#{problem_dir}/test_*.rb"]
    puts "Testing #{test_files.length} test files..."
    failed = 0
    test_files.each do |test_file|
      success = false

      Dir.chdir(problem_dir) do
        success = system 'ruby', File.basename(test_file)
      end

      failed += 1 if !success
    end

    puts "(#{failed} failed / #{test_files.length} tests ran)"
  end
end

desc 'Stashes the solution in a different file (to do not interfere with other testing) with the given name.'
command 'stash' do |c|
  c.desc 'Problem bundle'
  c.arg_name 'bundle'

  c.desc 'Problem name'
  c.arg_name 'problem'

  c.desc 'Name for the solution'
  c.arg_name 'name'

  c.desc 'Overwrites a previously stashed solution'
  c.switch [:f, :force]

  c.action do |global_options, options, args|
    problem_bundle, problem_name, solution_name = args
    force_switch = options[:force]

    if problem_name.nil? || problem_bundle.nil? || solution_name.nil?
      puts 'No problem bundle or name given.'
      exit 1
    end

    solution_path = Pathname(problem_bundle).join(problem_name).join("#{problem_name}.rb")
    target_solution_path = Pathname(problem_bundle).join(problem_name).join("#{problem_name}_#{solution_name}.rb")

    if !File.exist?(solution_path)
      puts "No such solution file: #{solution_path}"
      exit 1
    end

    if File.exist?(target_solution_path) && !force_switch
      puts "Such solution already exists: #{target_solution_path} (use -f/--force to overwrite the existing stashed solution)"
      exit 1
    end

    puts ">> STASHING '#{solution_path}'..."

    FileUtils.cp(solution_path, target_solution_path)
  end
end

exit run(ARGV)