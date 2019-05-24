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
    blur_maps!
    end
  end


  private

    def blur_maps!
      blur_maps = []
      @image.each_with_index do |row, row_index|
        row.each_with_index do |x, col_index|
          blur_maps << [row_index, col_index] if x == 1
        end
      end


      blur_maps.each do |map|
        @image[map[0]][map[1]+1] = 1 if map[1] + 1 <= @image[map[0]].length - 1
        @image[map[0]][map[1]-1] = 1 if map[1] - 1 >= 0
        @image[map[0] + 1][map[1]] = 1 if map[0] + 1 <= @image.length - 1
        @image[map[0] - 1][map[1]] = 1 if map[0] - 1 >= 0
      end
    end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
  
image.blur!(2)
image.output_image
