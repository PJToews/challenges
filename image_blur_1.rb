class Image
  attr_accessor :arrayimage

  def initialize(array)
    @arrayimage = array
  end

  def output_image
    array = Image.new(3) { Image.new(3) }
    # array = Array.new(3) { Array.new(3) }

    @arrayimage.each do |row|
      puts row.join
    end
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
  
image.output_image
