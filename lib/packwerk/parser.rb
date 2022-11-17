# typed: strict
# frozen_string_literal: true

module Packwerk
  module Parser
    extend T::Helpers
    extend T::Sig

    requires_ancestor { Kernel }

    interface!

    @parsers = T.let([], T::Array[Class])

    sig { params(base: Class).void }
    def self.included(base)
      @parsers << base
    end

    sig { returns(T::Array[T.untyped]) }
    def self.all
      T.unsafe(@parsers).map(&:new)
    end

    sig { abstract.params(io: File, file_path: String).returns(T.untyped) }
    def call(io:, file_path:)
    end

    sig { abstract.returns(Regexp) }
    def path_regex
    end
  end
end
