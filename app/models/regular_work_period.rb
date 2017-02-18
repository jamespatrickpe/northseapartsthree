class RegularWorkPeriod < ApplicationRecord

  include GenericResourceCommon
  include AssociatedEmployee
  include TimeOverlap
  include Remark
  include ImplementedAt
  include TimePrecedence

  validate :exact_work_period
  validates :one_hour_break, inclusion: {in: [true,false]}

  setup_model('fa-play',
              'work_period',
              @@routes.enterprise_human_resources_attendance_regular_work_periods_path,
              Enterprise::HumanResources::Attendance::RegularWorkPeriodsController )

  def work_period
    time_in.to_s + ' to ' + time_out.to_s
  end

  def exact_work_period
    allowable_work_hours_per_day = (SystemConstant.extract_constant(implemented_at, 'hr.allowable_work_hours_per_day')).to_f

    temp_work_hours_per_day = (time_out - time_in)/3600
    (temp_work_hours_per_day = (time_out - time_in - 1.hour)/3600) if one_hour_break

    unless allowable_work_hours_per_day == temp_work_hours_per_day
      errors.add(:time_out, 'Allowable Work Hours per Day does not match Proposed Work Hours')
    end

  end

  def self.current_work_period(inquired_date = Date.today, employee_id)
    regular_work_period = RegularWorkPeriod.where(['implemented_at <= ? AND employee_id = ?', inquired_date, employee_id])
    regular_work_period.order('implemented_at DESC').first if regular_work_period.present?
  end

end
