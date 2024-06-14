# typed: strict

module AbstractService
  extend T::Helpers
  extend T::Sig

  interface!

  sig { abstract.returns(ServiceResult) }
  def call; end

  module ClassMethods
    extend T::Sig

    sig { params(args: T.untyped).returns(ServiceResult) }
    def call(*args)
      T.unsafe(self).new(*args).call
    end
  end

  mixes_in_class_methods(ClassMethods)
end
