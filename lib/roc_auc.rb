class RocAuc
  # author vietlami

  def self.planar_arr(a,b)
    if a.length == b.length
      arr = []
      length = a.length
      0.upto(length-1).each do |len|
        item_arr = []
        item_arr << a[len]
        item_arr << b[len]
        arr << item_arr
      end
      return arr
    end
  end

  def self.tied_rank(x)
    r = []
    range_x = x.each_with_index.collect{|item,index| index if r << 0}
    sorted_x = self.planar_arr(x,range_x).sort_by{|x|x[0]}
    cur_val = sorted_x[0][0]
    last_rank = 0
    0.upto(sorted_x.length-1).each do |i|
      if cur_val != sorted_x[i][0]
        cur_val = sorted_x[i][0]

        last_rank.upto(i-1).each do |j|
          r[sorted_x[j][1]] = (last_rank+1+i)/2.0.to_f
          last_rank = i
        end
      end


      if i==sorted_x.length-1
        last_rank.upto(i).each do |j|
          r[sorted_x[j][1]] = (last_rank+i+2)/2.0.to_f
        end
      end

    end
    return r
  end


  def self.auc(actual, posterior)
    r = self.tied_rank(posterior)
    positive_actual = actual.collect{|item| item==1 ? item : ""}
    positive_actual.delete("")
    num_positive = positive_actual.length
    num_negative = actual.length-num_positive
    sum_positive_arr = 0.upto(r.length-1).collect{|i| actual[i]==1 ? r[i] : ""}
    sum_positive_arr.delete("")
    sum_positive = sum_positive_arr.sum
    auc =((sum_positive-num_positive*(num_positive+1)/2)/(num_negative*num_positive)).to_f
    return auc
  end

end