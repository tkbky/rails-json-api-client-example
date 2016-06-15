module ApplicationHelper

  def pager(paginated)
    content_tag(:nav) do
      concat(content_tag(:ul, class: 'pagination') do
        paginated.pager_urls.map do |seq, url|
          concat(content_tag(:li) do
            content_tag(:a, seq, href: url)
          end)
        end
      end)
    end
  end

end
