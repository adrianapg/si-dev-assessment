class PagesController < ApplicationController

  def home
    #@phone = Phone.new
    #@message = Message.new
  end

  def sms
    phone_number=params[:phone]
    text_message=params[:message]
  
    acct_sid = ENV['TWILIO_SID'] 
    auth_token = ENV['TWILIO_TOKEN'] 
    from = ENV['TWILIO_FROM']
    
    @client = Twilio::REST::Client.new acct_sid, auth_token
    message = @client.account.messages.create(
        :from => from,
        :to => '+591'+phone_number,
        :body => text_message 
        )
    
  end
end

  #def sms
    #@phone = Phone.new(phone_params)
    #@phone.send_sms(params[:phone],params[:message])
 #end

 #private 

  #def phone_params
    #params.fetch(:phone, {}).permit(:number)
    #params.require(:phone).permit(:number) if params[:phone]
  #end  

