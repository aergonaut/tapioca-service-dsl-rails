# typed: strict

class FrobulatorService < T::Struct
  extend T::Sig

  include AbstractService

  prop :input, String
  prop :intensity, T.nilable(Integer)

  sig { override.returns(ServiceResult) }
  def call
    if input == 'frobnicate'
      ServiceResult.ok('frobnicated')
    else
      ServiceResult.error('invalid input')
    end
  end
end
