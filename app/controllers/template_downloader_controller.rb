class TemplateDownloaderController < ApplicationController
    before_action :check_authentication

    # This controller is used for downloading the excel templates used in the
    # csv uploader. The files are stored in the /public folder.

    def download
        filename = params[:filename]
        send_file(
            "#{Rails.root}/public/" << filename << '.xlsx',
            filename: filename << '.xlsx'
        )
    end

    def training_manual
        filename = "TrainingManual.docx"
        send_file(
            "#{Rails.root}/public/" << filename,
            filename: filename
        )
    end

end
