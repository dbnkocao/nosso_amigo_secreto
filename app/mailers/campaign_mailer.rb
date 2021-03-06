class CampaignMailer < ApplicationMailer

  def raffle(campaign, member, friend)
    @campaign = campaign
    @member = member
    @friend = friend
    mail to: @member.email, subject: "Nosso Amigo Secreto: #{@campaign.title}"
  end

  def error(campaign)
    @campaign = campaign
    @owner = campaign.user

    mail to: @owner.email, subject: "Erro ao enviar email no sorteio"
  end
end