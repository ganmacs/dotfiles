require_relative '../shared/tags'

module Overcommit::Hook::PostRewrite
  class Tags < Base
    include Overcommit::Hook::Shared::Tags
  end
end
