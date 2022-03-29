# typed: strict
# frozen_string_literal: true

module Packwerk
  module Parsers
    module ParserInterface
      extend T::Helpers
      extend T::Sig

      interface!

      sig { abstract.params(io: File, file_path: String).returns(T.untyped) }
      def call(io:, file_path:)
      end

      sig { abstract.returns(Regexp) }
      def self.path_regex
      end
    end
  end
end
