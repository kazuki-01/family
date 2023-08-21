class GroupsController < ApplicationController

  def update
    @group = Group.find(current_user.family_id)
    
  end

end
