RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  config.authorize_with do
    unless current_user.admin?
      flash[:alert] = t 'devise.failure.not_admin'
      redirect_to main_app.root_path
    end
  end

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  # Visible models in admins
  config.included_models = %w[User Payment Spend]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    # export
    # bulk_delete
    show
    edit
    delete
    show_in_app

    config.model 'User' do
      list do
        field :id
        field :full_name
        field :avatar
        field :status
      end

      create do
        field :first_name do
          required true
        end
        field :last_name do
          required true
        end
        field :phone_number
        field :avatar
        field :email
        field :password
      end

      update do
        field :first_name
        field :last_name
        field :phone_number
        field :avatar
        field :email
        field :password
      end
    end

    config.model 'Payment' do
      list do
        field :user_full_name
        field :spend
        field :purchased?
      end

      create do
        field :user_id, :enum do
          enum do
            User.all.collect {|p| [p.full_name, p.id]}
          end
        end
        field :spend
        field :purchased_at
      end
    end

    config.model 'Spend' do
      list do
        field :name
        field :price
        field :created_at
      end

      create do
        field :name do
          required true
        end
        field :price do
          required true
        end
      end

      update do
        field :name do
          required true
        end
        field :price do
          required true
        end
      end
    end


    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
