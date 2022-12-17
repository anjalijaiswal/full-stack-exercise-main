module StatusHistoryHelper
    def get_status(value)
        Applicant.statuses.key(value).titleize
    end
end
