# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    return self.max - self.min
  end
  
  def average
    return nil if self.empty?
    return self.sum / self.length.to_f
  end

  def median
    return nil if self.empty?
    if self.length.odd?
        med = self.length / 2
        return self.sort[med]
    else
        med = self.length / 2
        divisor = med - 1
        return (self.sort[med] + self.sort[divisor]) / 2.0
    end
  end

  def counts
    ans = Hash.new(0)
    self.each do |ele|
        ans[ele] += 1
    end
    ans
  end

  def my_count(v)
    count = 0
    self.each do |ele|
        count += 1 if v.include?(ele)
    end
    count
  end

  def my_index(v)
    self.each_with_index do |ele, idx|
        if v.include?(ele)
            return idx
            break 
        end 
    end
    nil
  end

  def my_uniq
    ans = []
    self.each { |ele| ans << ele if !ans.include?(ele) }
    ans 
  end

  def my_transpose
    ans = [] 
    (0...self.length).each do |idx1|
        ans2 = []
        (0...self.length).each do |idx2|
            ans2 << self[idx2][idx1]
        end
        ans << ans2
    end
    ans
  end

end
