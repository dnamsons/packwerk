# typed: true
# frozen_string_literal: true

require "singleton"

module Packwerk
  module Parsers
    class Factory
      extend T::Sig
      include Singleton

      DEFAULT_PARSERS = [Ruby, Erb].freeze

      sig { params(path: String).returns(T.nilable(ParserInterface)) }
      def for_path(path)
        parser_class = parsers.find { |parser| parser.path_regex.match?(path) }

        parser_class.new if parser_class
      end

      def parsers
        @parsers ||= DEFAULT_PARSERS
      end

      def parsers=(parsers)
        @parsers = parsers
      end
    end
  end
end
