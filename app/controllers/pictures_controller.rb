class PicturesController < ApplicationController

  def new_form

    render("pic_templates/new_form.html.erb")

  end

  def create_row

    p = Photo.new
    p.caption = params["the_caption"]
    p.source = params["the_source"]
    p.save

    @current_count = Photo.count

    render("pic_templates/create_row.html.erb")
  end

  def index

    @list_of_photos = Photo.all.order(:created_at => :desc)

    render("pic_templates/index.html.erb")
  end

  def show
    # The parameters look like: {"the_id"=>"4"}
    @my_photo = Photo.find(params["the_id"])

    render("pic_templates/show.html.erb")
  end

  def edit_form

    @my_photo = Photo.find(params["la_id"])

    render("pic_templates/edit_form.html.erb")
  end

  def update_row

    @my_photo = Photo.find(params["la_id"])
    @my_photo.caption = params["the_caption"]
    @my_photo.source = params["the_source"]
    @my_photo.save

    render("pic_templates/update_row.html.erb")
  end

  def destroy_row

    @my_photo = Photo.find(params["da_id"])
    @my_photo.destroy

    @current_count = Photo.count

    render("pic_templates/destroy_row.html.erb")
  end

end
