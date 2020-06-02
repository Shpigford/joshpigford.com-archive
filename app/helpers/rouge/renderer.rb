require 'redcarpet'
require 'rouge'
# require 'rouge/plugins/redcarpet'
require_dependency 'rouge/plugins/redcarpet'

class Rouge::Renderer < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end