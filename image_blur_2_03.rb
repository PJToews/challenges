class Image
  attr_accessor :image

  def initialize(array)
    @image = array
  end

  def output_image
    array = Image.new(3) { Image.new(3) }

    @image.each do |row|
      puts row.join
    end
  end


  def blur!(distance=1)
    distance.times do
      blur_pixels!
    end
  end


  private

    def blur_pixels!
      blur_pixels = []
      @image.each_with_index do |row, row_index|
        row.each_with_index do |x, col_index|
          blur_pixels << [row_index, col_index] if x == 1
        end
      end


      blur_pixels.each do |pixel|
        @image[pixel[0]][pixel[1]+1] = 1 if pixel[1] + 1 <= @image[pixel[0]].length - 1
        @image[pixel[0]][pixel[1]-1] = 1 if pixel[1] - 1 >= 0
        @image[pixel[0] + 1][pixel[1]] = 1 if pixel[0] + 1 <= @image.length - 1
        @image[pixel[0] - 1][pixel[1]] = 1 if pixel[0] - 1 >= 0
      end
    end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0]
])
  
image.blur!(1)
image.output_image
