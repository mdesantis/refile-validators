require 'active_support/dependencies/autoload'
require 'refile'

module Refile
  module Validators
    extend ActiveSupport::Autoload

    autoload :ContentTypeConsistence
  end
end
