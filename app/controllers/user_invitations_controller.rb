class UserInvitationsController < ApplicationController
    
    def update
        @invitation = UserInvitedToOrder.find(params[:invitation])
        @notice = ''

        if params[:user_action] == 'accept'
            @invitation.status = 'accepted'
            @notice = 'You Accepted the Invitation'
            UserJoinOrder.create order_id: @invitation.order_id, user_id: @invitation.guest_id
            @order = Order.find(@invitation.order_id)
            if @order.joined_num 
                @order.joined_num = @order.joined_num + 1
            else
                @order.joined_num = 1
            end
            @order.save
            
        else
            @invitation.status = 'rejected'
            @notice = 'You Rejected the Invitation'
        end
        @invitation.save
        respond_to do |format|
            format.html { redirect_to notifications_path, notice: @notice, invitation_status: @invitation.status }
        end
    end
end
