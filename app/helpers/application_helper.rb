module ApplicationHelper
  def list_match
    list = []
    User.all.each do |user|
      if User.match?(current_user, user) && user != current_user
      list << user
      end
     end
    return list
  end
end
