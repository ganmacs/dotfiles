require_relative '../shared/tags'

module Overcommit::Hook::PreCommit
  class Tags < Base
    include Overcommit::Hook::Shared::Tags
  end
end
