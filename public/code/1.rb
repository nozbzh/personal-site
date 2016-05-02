ascii = ['0'..'9', ’A’..’Z’, ’a’..’z’].map{|range| range.to_a}.flatten.map{|c| c.ord}

self.short_url = 6.times.map{ascii.sample}.pack(‘UUUUUU’)
