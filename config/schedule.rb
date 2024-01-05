every 1.hour do
    runner 'SearchAnalyzerJob.perform_later'
  end