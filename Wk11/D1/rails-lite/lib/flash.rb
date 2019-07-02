require 'json'

class Flash
    def initialize(req)
        @req = req
    end
    def []=(k, v)
        self[k][v] = v
    end

    def store_flash
        p res
    end

end
