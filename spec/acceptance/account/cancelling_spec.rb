require 'spec_helper'

feature "Account cancelling" do
  scenario "User can cancel his own account if he is signed in" do
    user = create(:user)
    log_in_as(user)

    EditAccountPage.open
    EditAccountPage.on { cancel_my_account }
    HomePage.on do
      expect(text).to include("Bye! Your account was successfully cancelled. We hope to see you again soon.")
    end
  end

end
