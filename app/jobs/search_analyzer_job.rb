class SearchAnalyzerJob < ApplicationJob
  queue_as :default

  def perform(*args)
     # Add logic to analyze and summarize searches here
     popular_queries = Search.group(:query).count.sort_by { |_, count| -count }.take(10)

     # You can store these results in another table or perform any other desired action
     Trend.create(data: popular_queries.to_h)
  end
end
