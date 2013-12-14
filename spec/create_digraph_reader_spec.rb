require_relative 'spec_helper'
require_relative '../lib/digraph_reader'

puts "========test========="

describe DigraphReader do
  it "accepts a file for input" do
    expect{
    dr = DigraphReader.new('test.dat')
    }.to raise_exception "Missing file"
  end

  it "raises an exception if the file isn't there" do
    file_methods_that_never_find_a_file = double( "File", :exists? => false )
    expect{
    dr = DigraphReader.new('blah',file_methods_that_never_find_a_file)
    }.to raise_exception "Missing file"
  end

  class FakeFileMethods
    def initialize( file_to_open )
      @file_to_open = file_to_open
    end

    def open(file_name)
      yield @file_to_open
    end

    def exists?(file_name)
      true
    end
  end

  class FakeFile
    def initialize(*contents)
      @contents = contents
    end
    def each_line
      @contents.each do |line|
        yield line
      end
    end
  end

  it "doesn't yield for an empty file" do
    fake_file = FakeFile.new()
    file_methods_for_an_empty_file = FakeFileMethods.new(fake_file)

    dr =  DigraphReader.new('blah', file_methods_for_an_empty_file)
    dr.read_graph_input do |f,t,d|
      raise "didn't expect block to actually be called!"
    end
  end
  it "returns one route" do
    fake_file = FakeFile.new("AB5")
    file_methods_for_fake_file = FakeFileMethods.new(fake_file)
    dr = DigraphReader.new('blah',file_methods_for_fake_file)
    times_yielded = 0
    dr.read_graph_input do |f,t,d|
      times_yielded += 1
      expect(f).to eq 'A'
      expect(t).to eq 'B'
      expect(d).to eq 5
    end
    expect(times_yielded).to eq 1
  end
  it "returns one route" do
    dr = DigraphReader.new('anotherroutefile.dat')
    dr.read_graph_input do |f,t,d|
      expect(f).to eq 'B'
      expect(t).to eq 'C'
      expect(d).to eq 9
    end
  end
end
