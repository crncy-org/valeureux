ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    columns do


     column do
        panel "Recent Users" do
          ul do
            User.last(10).map do |user|
              li link_to(user.full_name, batch_action_admin_users_path(user))
            end
          end
        end
      end

      column do
        panel "Recent Accounts" do
          ul do
            Account.last(10).map do |account|
              li link_to(account.number, batch_action_admin_accounts_path(account))
            end
          end
        end
      end

      column do
        panel "Recent Transactions" do
          ul do
            Transaction.last(10).map do |transaction|
              li link_to(transaction.amount, batch_action_admin_transactions_path(transaction))
            end
          end
        end
      end

      column do
        panel "Recent Topups" do
          ul do
            Topup.last(10).map do |topup|
              li link_to(topup.amount, batch_action_admin_topups_path(topup))
            end
          end
        end
      end

    end
  end # content
end

