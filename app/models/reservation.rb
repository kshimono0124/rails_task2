class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :start_date,    presence: true
  validates :end_date,      presence: true
  validates :person_num,    presence: true
  validates :total_price,   presence: true
  
  validate :date_before_start
  validate :start_end_check
  
  def date_before_start
    errors.add(:start_date, "は今日以降のものを選択してください") if
    self.start_date < Date.today
  end

  def start_end_check
    errors.add(:end_date, "は開始日より前の日付は登録できません。") unless
    self.start_date < self.end_date 
  end
  
end
