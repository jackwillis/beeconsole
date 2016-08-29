class ExistingTables < ActiveRecord::Migration[5.0]
  def change
    # https://github.com/tomwillis608/beestation/blob/dbd3549a82239c448ede3289fef69a375475fd15/server/mysql/create_sensor_table.mysql
    create_table(:dht22, primary_key: :id) do |t|
      t.timestamp :event, null: false, comment: "Event Date and Time"
      t.string :sensor, limit: 30, null: false, comment: "Unique ID of the sensor"
      t.string :celsius, limit: 10, null: false, comment: "Measured Temperature in Celsius"
      t.string :humidity, limit: 10, null: false, comment: "Measured Relative Humidity"

      t.index [:event, :sensor]
    end

    # https://github.com/tomwillis608/beestation/blob/dbd3549a82239c448ede3289fef69a375475fd15/server/mysql/create_info_table.mysql
    create_table(:beestation, primary_key: :id) do |t|
      t.timestamp :event, comment: "Event Date and Time"
      t.string :sensor, limit: 30, comment: "Unique ID of the sensor"
      t.string :message, limit: 127, comment: "What happened"

      t.index [:event, :sensor]      
    end
  end
end
