# app/views/companies/index.jbuilder
json.array! @companies do |company|
  json.partial! 'companies/company', company: company
end