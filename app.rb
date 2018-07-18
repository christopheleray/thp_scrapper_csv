require 'csv'
load 'lib/scrapper.rb'


def create_new_csv
  CSV.open("db/annuaire.csv", "wb") do |csv|
    csv << ["city", "email"]
  end
  return 0
end

def add_infos_to_csv
  list = get_the_email_of_a_townhal_from_its_webpage(get_all_the_urls_of_val_doise_townhalls)
  list.each do |hash|
    CSV.open("db/annuaire.csv", "a+") do |csv|
      csv << [hash[:name], hash[:email]]
    end
  end
  return 0
end

def perform
  create_new_csv
  add_infos_to_csv
end

perform
