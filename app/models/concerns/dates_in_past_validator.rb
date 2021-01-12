class DatesInPastValidator < ActiveModel::Validator
  def validate(record)
    if record.instance_of?(Era) && record.start_date && record.end_date
      era(record)
    elsif record.instance_of?(Event) && record.date
      event(record)
    end
  end

  private
  
  def era(record)
    record.errors.add(:start_date, 'cannot be in the future') if record.start_date > Time.zone.today
    record.errors.add(:end_date, 'cannot be in the future') if record.end_date > Time.zone.today
  end

  def event(record)
    record.errors.add(:date, 'cannot be in the future') if record.date > Time.zone.today
  end
end
