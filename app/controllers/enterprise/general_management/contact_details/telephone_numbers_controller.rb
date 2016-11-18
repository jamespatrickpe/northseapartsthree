class Enterprise::GeneralManagement::ContactDetails::TelephoneNumbersController < Enterprise::GeneralManagement::ContactDetailsController

  ApplicationController.new.setup_resource_controller(TelephoneNumber,
                                                      'fa fa-phone',
                                                      'Telephone Numbers',
                                                      'Communication Assets',
                                                      @@routes.enterprise_general_management_contact_details_telephone_numbers_path,
                                                      [],
                                                      ['label','owner'])

  def index
    setup_index( @@routes.enterprise_general_management_contact_details_path)
  end

  def search_suggestions
    setup_search_suggestions
  end

  def process_form(my_telephone, current_params)

    telephone_processing = Proc.new do
      my_telephone.digits = current_params[:digits]
      my_telephone.contact_detail_id = current_params[:contact_detail_id]
      my_telephone.save!
    end

    setup_process(telephone_processing)
  end

  def new
    setup_form
  end

  def create
    process_form(TelephoneNumber.new, params[:telephone_number])
  end

  def show
    setup_form
  end

  def edit
    setup_form
  end

  def update
    process_form(TelephoneNumber.find(params[:id]), params[:telephone_number])
  end

  def destroy
    setup_delete
  end

end