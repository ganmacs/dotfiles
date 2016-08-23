require_relative '../shared/tags'

module Overcommit::Hook::PrePush
  class Tags < Base
    include Overcommit::Hook::Shared::Tags
  end
end
