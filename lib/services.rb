module Services
  include Pagination
  class Pagination
    attr_reader :collection, :params

    def initialize(collection, params)
      @collection = collection
      @params = params.merge(total: collection.size)
    end

    def metadata
      @metadata ||= ViewModel::Pagination.new(params)
    end

    def results
      collection.limit(metadata.limit).offset(metadata.offset)
    end
  end
end