module ViewModel
  class Pagination
    DEFAULT = { page: 1, limit: 25 }.freeze
    attr_reader :page, :total, :limit

    def initialize(params = {})
      @page = (params[:page] || DEFAULT[:page]).to_i
      if @page <= 0
        @page = 1
      end
      @total = params[:total]
      @limit = (params[:limit] || DEFAULT[:limit]).to_i
      if @limit > 25
        @limit = 25
      end
      @total_pages = total_pages
    end

    def offset
      if page > 0
        (page - 1) * limit
      else
        0
      end
    end

    def total_pages
      (total / limit.to_f).ceil
    end
  end
end