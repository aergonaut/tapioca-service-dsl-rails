# typed: strict

class ServiceResult < T::Struct
  extend T::Sig

  prop :body, T.untyped
  prop :errors, T.nilable(T.any(T::Array[String], String))

  sig { params(body: T.untyped).returns(T.attached_class) }
  def self.ok(body)
    new(body: body, errors: nil)
  end

  sig { params(errors: T.nilable(T.any(T::Array[String], String))).returns(T.attached_class) }
  def self.error(errors)
    new(body: nil, errors: errors)
  end

  sig { returns(T::Boolean) }
  def success?
    errors.nil?
  end

  sig { returns(T::Boolean) }
  def failure?
    !success?
  end
end
