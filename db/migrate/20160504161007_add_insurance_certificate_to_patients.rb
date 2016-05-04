class AddInsuranceCertificateToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :insurance_certificate, :string
  end
end
