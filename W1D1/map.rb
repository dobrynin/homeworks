class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map.each do |existing_key, _, pair_index|
      if key == existing_key
        @map[pair_index] = [key, value]
        return
      end
    end
    @map.push([key, value])
  end

  def lookup(key)
    @map.each do |existing_key, value|
      if key == existing_key
        return value
      end
    end
    nil
  end

  def remove(key)
    @map.each do |existing_key, value|
      if key == existing_key
        @map.delete([key, value])
        return
      end
    end
  end

  def show
    @map
  end
end
