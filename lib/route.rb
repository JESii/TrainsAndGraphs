class Route < Struct.new(:path, :distance)
  def initialize(path, distance)
    self.path = Path.new(path)
    self.distance = distance
  end
end

class Path < Struct.new(:path)
  def to_s
    self.path.to_s
  end
  def first
    self.path[0]
  end
  def last
    self.path[self.path.size-1]
  end
  def [] index
    self.path[index]
  end
  def size
    self.path.size
  end
end
