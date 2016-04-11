class TemplateDownloaderController < ApplicationController
    before_action :check_authentication

    def download
        filename = params[:filename]
        send_file(
            "#{Rails.root}/public/" << filename << '.xlsx',
            filename: filename << '.xlsx'
        )
    end

end
