# typed: strict

module Tapioca
  module Compilers
    class AbstractService < Tapioca::Dsl::Compiler
      extend T::Sig

      ConstantType = type_member {{ fixed: T.class_of(::AbstractService) }}

      sig { override.returns(T::Enumerable[Module]) }
      def self.gather_constants
        all_classes.select { |klass| klass < ::AbstractService }
      end

      sig { override.void }
      def decorate
        root.create_path(constant) do |klass|
          parameters = T.unsafe(constant).props.map do |name, prop|
            create_kw_param(name, type: prop[:type_object].to_s)
          end
          klass.create_method(
            "call",
            parameters:,
            return_type: "::ServiceResult",
            class_method: true
          )
        end
      end
    end
  end
end
