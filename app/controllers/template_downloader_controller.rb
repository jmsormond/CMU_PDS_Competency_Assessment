class TemplateDownloaderController < ApplicationController

    def download
        filename = params[:filename]
        send_file(
            "#{Rails.root}/public/" << filename << '.csv',
            filename: filename
        )
    end

end
