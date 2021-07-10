class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :syozoku, null:false
      # 締め切り
      t.datetime :target_at, null: true
      # タスク完了日
      t.datetime :completed_at, null: true
      # タスク完了したか
      t.boolean :completed, null: false, default: true
      # userモデルのuser_idに結びつけるため、必要
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end