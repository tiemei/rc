class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # TODO replace ramdon string and filetype judge method
  def trans_img_to_path(uploaded_io, &block)
    if uploaded_io = uploaded_io
      filename = "#{ Time.now.to_i }#{ File.extname(uploaded_io.original_filename) }"
      File.open(Rails.root.join('app', 'assets', 'images', 'uploads', filename), 'wb') do |file|
        file.write(uploaded_io.read)
        block.call("uploads/#{ filename }")
      end
    end
  end 
end
