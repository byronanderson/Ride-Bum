class InvitationsController < ApplicationController
  # GET /invitations
  # GET /invitations.json
  def index
    @invitations = Invitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invitations }
    end
  end

  # GET /invitations/1
  # GET /invitations/1.json
  def show
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invitation }
    end
  end

  # GET /invitations/new
  # GET /invitations/new.json
  def new
    @invitation = Invitation.new(event: Event.find(params[:event_id]), user: User.new)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invitation }
    end
  end

  # GET /invitations/1/edit
  def edit
    @invitation = Invitation.find(params[:id])
  end

  # POST /invitations
  # POST /invitations.json
  def create
    user_attributes = params[:invitation][:user_attributes]
    user = User.find_by_email(user_attributes[:email]) || User.new(user_attributes)
    @invitation = Invitation.new(event_id: params[:invitation][:event_id], user: user)

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to new_event_invitation_path(@invitation.event, Invitation.new(event: @invitation.event)), notice: "#{@invitation.user.username} has been added" }
        format.json { render json: @invitation, status: :created, location: @invitation }
      else
        format.html { render action: "new" }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invitations/1
  # PUT /invitations/1.json
  def update
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      if @invitation.update_attributes(params[:invitation])
        format.html { redirect_to @invitation, notice: 'Invitation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.json
  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to invitations_url }
      format.json { head :no_content }
    end
  end

  def send_emails
    @event = Event.find(params[:event_id])
    email_results = @event.invitations.unsent.map(&:send_email)
    if email_results.any? { |result| not result }
      #failure
      redirect_to event_invitations_path(@event), notice: "Email Unsuccessful"
    else
      #success
      redirect_to event_invitations_path(@event), notice: "Email Successful"
    end
  end
end
