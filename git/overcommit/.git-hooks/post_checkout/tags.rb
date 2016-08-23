require_relative '../shared/tags'

module Overcommit::Hook::PostCheckout
  class Tags < Base
    include Overcommit::Hook::Shared::Tags
  end
end
