class Paginator

  PAGE_NUM_KEY = 'page[number]'
  PER_PAGE_KEY = 'page[size]'
  PAGER_SEQUENCES = [:first, :prev, :next, :last].freeze

  attr_reader :collection

  def initialize(collection, controller)
    @collection = collection
    @controller = controller
  end

  def pager_urls
    (PAGER_SEQUENCES & page_links.keys).each_with_object({}) do |seq, urls|
      urls[seq] = @controller.url_for(page: query_params(page_links[seq])[PAGE_NUM_KEY].first.to_i)
    end
  end

  private

  def query_params(url)
    CGI.parse(URI(url).query)
  end

  def page_links
    @collection.pages.links.symbolize_keys
  end

  def per_page
    @collection.pages.per_page
  end

end
