class CustomMetric < PrometheusExporter::Server::TypeCollector

  unless defined? Rails
    require File.expand_path("../../config/environment", __FILE__)
  end

  def type
    "articles"
  end

  def metrics
    article_count_gauge = PrometheusExporter::Metric::Gauge.new('articles_count', 'number of articles in the app')
    article_count_gauge.observe Article.count
    [article_count_gauge]
  end
end
