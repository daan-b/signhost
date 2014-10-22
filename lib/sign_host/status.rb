module SignHost::Status
  CONTRACT_STATUSES = {
    "5"  => "Waiting for document",
    "10" => "Waiting for signer",
    "20" => "In progress",
    "30" => "Signed",
    "40" => "Rejected",
    "50" => "Expired",
    "60" => "Cancelled",
    "70" => "Failed"
  }

  SIGNER_STATUSES = {
    "101" => "Initation sent",
    "102" => "Received",
    "103" => "Opened",
    "104" => "Reminder sent",
    "201" => "Cancelled",
    "202" => "Rejected",
    "203" => "Signed",
    "301" => "Signed document sent",
    "302" => "Signed document opened",
    "303" => "Signed document downloaded",
    "401" => "Receipt sent",
    "402" => "Receipt opened",
    "403" => "Receipt downloaded",
    "500" => "Finished",
    "600" => "Deleted",
    "700" => "Expired",
    "999" => "Failed"
  }

  def self.lookup_contract_status(status)
    return "" unless  status
    CONTRACT_STATUSES.fetch(status.to_s)
  end

  def self.lookup_signer_status(status)
    return "" unless  status
    SIGNER_STATUSES.fetch(status.to_s)
  end
end
