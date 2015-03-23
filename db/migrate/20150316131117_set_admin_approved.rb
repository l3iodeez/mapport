class SetAdminApproved < ActiveRecord::Migration
    def up
  execute("UPDATE users SET approved = true")
  end
  def down
  end
end
