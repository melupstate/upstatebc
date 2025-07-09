class PdiFormsController < ApplicationController 
  before_action :get_pdi_options
  
  def request_counseling
     
    @image = 'istockphoto-2171340930-1024x1024.jpg'
    @lowcountry_affiliation = PageDatum.where(navigation_location: 'lowcountry_affiliation').first
    @request_counseling_landing = PageDatum.where(navigation_location: 'request_counseling_landing').order(dataid: :desc).first
 
    @pdi = PdiForm.new
    @pdi_columns = PdiColumnDescription.where(pdi_form: 'pdi_form').order(sort: :asc)
    
  end

  def create
    @pdi = PdiForm.create(pdi_params)
    if @pdi.save
        @pdiid = @pdi.pdiid 
         @pdi_columns = PdiColumnDescription.where(pdi_form: 'pdi_form1').order(sort: :asc) 
         @form_number = 1     
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to edit_form1_path(@pdiid) }
        end
      else
          
      end
   

  end
  def edit_form1
     @pdi_columns = PdiColumnDescription.where(pdi_form: 'pdi_form1').order(sort: :asc)
  end
  def update
    @pdi = PdiForm.find(params[:id])
    if @pdi.update(pdi_params)
      @pdiid = @pdi.pdiid
      @pdi = PdiFormDatum.create(pdiid: @pdiid)
    
        @form_number = 1
    
      v_pdi_form_data = "pdi_form_data#{@form_number}"
      puts "PDI FORM DATA"
      puts v_pdi_form_data
      @pdi_columns = PdiColumnDescription.where(pdi_form: v_pdi_form_data).order(sort: :asc)
       respond_to do |format|
          format.turbo_stream
          format.html { redirect_to edit_pga_form_datum_path(@pdiid) }
        end
    else
    end

  end
  def populate_category
    #params = pdiid"=>"32", "categoryid"=>"22", "checked"=>true
     
    if params[:checked] == true && !params[:pdiid].nil?
      PdiCategory.create(pdiid: params[:pdiid], category: params[:categoryid])
    else
      PdiCategory.where(pdiid: params[:pdiid], category: params[:categoryid]).delete_all
    end
  end
  private
  def get_pdi_options
    @reminder_types = ReminderType.all 
    @categories = CounselingCategory.order(category: :asc)
   
  end
  def pdi_params
    params.require(:pdi_form).permit( :first_name, :last_name, :phone_number, :second_phone_number, :street_address, :us_state, :zipcode, :email, :counseling_for, :reminder_type, :date_of_birth, :gender, :counselee_status)
  end

end
