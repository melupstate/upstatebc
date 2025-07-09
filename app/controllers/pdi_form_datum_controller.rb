class PdiFormDatumController < ApplicationController
  def update
    @pdi = PdiFormDatum.find(params[:id])
    @categories = CounselingCategory.order(category: :asc)
    if @pdi.update(pdi_params)
      
    puts "PARMAS"
      puts params[:form_number]
    
      if defined?(params[:form_number])
        @form_number = params[:form_number] .to_i + 1
      else 
        @form_number = params[:form_number]
      end
      if @form_number < 6
        v_pdi_form_data = "pdi_form_data#{@form_number}"
        puts "PDI FORM DATA"
        puts v_pdi_form_data
        @pdi_columns = PdiColumnDescription.where(pdi_form: v_pdi_form_data).order(sort: :asc)
        respond_to do |format|
            format.turbo_stream
            
          end
      else
        # no more forms and need to refresh page with a different screen
        @request_counseling_form_submitted = PageDatum.where(navigation_location: 'request_counseling_form_submitted').order(dataid: :desc).first
        respond_to do |format|
            format.turbo_stream { render :form_submitted}
            
          end
      end
    else
    end

  end
  private 
  def pdi_params
    params.require(:pdi_form_datum).permit(  :occupation, :referral, :martial_status, :spouse_name, :children, :medical_conditions, 
      :medications, :additional_medical_details, :church_name, :church_attendance, :church_member, :church_involvement, 
      :salvation_story, :friends, :co_counselee, :past_counseling, :past_counseling_duration, :past_counseling_details, 
      :counseling_details, :counseling_contribution, :counseling_solutions, :counseling_directions,:counseling_category)
  end
end
