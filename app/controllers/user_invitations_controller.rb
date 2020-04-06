        @invitation.save
        respond_to do |format|
            format.html { redirect_to notifications_path, notice: @notice, invitation_status: @invitation.status }
        end
    end
end
