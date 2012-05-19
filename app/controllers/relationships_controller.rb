class RelationshipsController < ApplicationController
  # get /relationships/contact/:to_id
  def contact
    Relationship.add_contact(session[:current_user_id],
                             params[:to_id])
    redirect_to :back
  end

  # get /relationships/cancle/:to_id
  def cancel
    Relationship.cancel_contact(session[:current_user_id],
                                params[:to_id])
    redirect_to :back
  end
end
