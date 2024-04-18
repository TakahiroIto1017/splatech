class ProfilesController < ApplicationController

  def index
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    prof_make
    prof_upload
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :profile, :policy_id, :skill_id, :xp, :image)
  end

  def prof_make
    require 'mini_magick'
    template_path = Rails.root.join('app', 'assets', 'images', 'profile.png')
    image = MiniMagick::Image.open(template_path)

    font = Rails.root.join('app', 'assets', 'fonts', 'Buildingsandundertherailwaytracksfree_ver.otf').to_s
    size = 80
    color = "#FFFFFF"
    name = @profile.name
    name_x = 74
    name_y = 430
    policy = @profile.policy.name
    policy_x = 74
    policy_y = 660

    image.combine_options do |cmd|
      cmd.font(font)
      cmd.fill(color)
      cmd.draw "text #{name_x},#{name_y} '#{name}'"
      cmd.draw "text #{policy_x},#{policy_y} '#{policy}'"
      cmd.pointsize(size)
    end

    output_path = Rails.root.join('storage', 'output_image.png')
    image.write(output_path)

    return image
  end

  def prof_upload
    image = prof_make # prof_makeから画像オブジェクトを取得

    # 一時的なファイルとして画像を保存
    temp_file = Tempfile.new(['image', '.png'])
    image.write(temp_file.path)
  
    # Active Storageを使用して画像をデータベースに保存
    image_blob = ActiveStorage::Blob.create_and_upload!(
      io: temp_file,
      filename: 'output_image.png',
      content_type: 'image/png'
    )
  
    # 画像への参照をプロフィールに関連付けて保存
    @profile.image.attach(image_blob)  
  end

end