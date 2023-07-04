class MessagePolicy
  attr_reader :user, :message

  def initialize(user, message)
    @user = user
    @message = message
  end

  def create?
    user.present?
  end
end
