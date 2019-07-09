class ProductUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # após o upload da imagem
  # remove o arquivo original
  after :store, :remove_original_file

  def remove_original_file(file)
    if self.version_name.nil?
      self.file.delete if self.file.exists?
    end
  end

  # define o tipo de armazenamento de acordo
  # com cada ambiente funcionando
  if Rails.env.development?
    storage :file
  else
    storage :fog
  end

  # define o diretório para armazenamento
  # das imagens que são carregadas
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  # tipo de arquivos que são aceitos
  # para upload
  def extension_whitelist
    %w(jpg jpeg png)
  end

  # diferente dimensões para cada tipo de imagem

  version :large do
    process resize_to_fit: [600, 600]
  end

  version :medium do
    process resize_to_fit: [400, 400]
  end

  version :thumb do
    process resize_to_fit: [100, 100]
  end

end