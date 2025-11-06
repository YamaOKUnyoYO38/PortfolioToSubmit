class TemplatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @templates = current_user.templates

    # 絞り込み
    if params[:filter].present?
      filter = params[:filter]
      @templates = @templates.where("person_name LIKE ? OR relationship LIKE ?", "%#{filter}%", "%#{filter}%")
    end

    # ソート
    case params[:sort]
    when "name_asc"
      @templates = @templates.order(person_name: :asc)
    when "name_desc"
      @templates = @templates.order(person_name: :desc)
    else
      @templates = @templates.order(created_at: :desc)
    end
  end

  def new
    @template = Template.new
  end

  def create
    @template = current_user.templates.build(template_params)
    if @template.save
      redirect_to templates_path, notice: "テンプレートを保存しました。"
    else
      flash.now[:alert] = "入力内容に誤りがあります。"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @template = current_user.templates.find(params[:id])
  end

  def destroy
    @template = current_user.templates.find(params[:id])
    @template.destroy
    redirect_to templates_path, notice: "テンプレートを削除しました。"
  end

  private

  def template_params
    params.require(:template).permit(:person_name, :relationship, :message, :title, :content)
  end
end
