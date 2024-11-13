namespace :import do
  desc "Importar dados da planilha para as tabelas Incident, Error, e Robot"
  task :from_spreadsheet, [:file_path] => :environment do |t, args|
    require 'roo'

    xlsx = Roo::Spreadsheet.open(args[:file_path])

    # Importando dados para a tabela Incidents
    sheet_incidents = xlsx.sheet('support_V2')
    incident_count = 0
    sheet_incidents.each_with_index(headers: true) do |row, index|
      next if index.zero? # pular a linha de cabeçalho

      Incident.create!(
        robot: row['Robot'],
        treatment_id: row['treatmentId'],
        status: row['status'],
        recovery: row['recovery'],
        date_time: row['datetime'],
        percentage: row['percentage'],
        error_code: row['error code']
      )
      
      incident_count += 1
      puts "Importando Incident #{incident_count}/#{sheet_incidents.count}" # Mostrar progresso
    end
    puts "Importação de Incidents concluída! #{incident_count} registros importados."

    # Importando dados para a tabela Errors
    sheet_errors = xlsx.sheet('Error-codes')
    error_count = 0
    sheet_errors.each_with_index(headers: true) do |row, index|
      next if index.zero? # pular a linha de cabeçalho

      Error.create!(
        description: row['Error description'],
        code: row['Error code XL']
      )

      error_count += 1
      puts "Importando Error #{error_count}/#{sheet_errors.count}" # Mostrar progresso
    end
    puts "Importação de Errors concluída! #{error_count} registros importados."

    # Importando dados para a tabela Robots
    sheet_robots = xlsx.sheet('Robots')
    robot_count = 0
    sheet_robots.each_with_index(headers: true) do |row, index|
      next if index.zero? # pular a linha de cabeçalho

      Robot.create!(
        site_name: row['SiteName'],
        site_id: row['SiteId'],
        robot_id: row['RobotId'],
        display_name: row['DisplayName'],
        robot_type: row['Type']
      )

      robot_count += 1
      puts "Importando Robot #{robot_count}/#{sheet_robots.count}" # Mostrar progresso
    end
    puts "Importação de Robots concluída! #{robot_count} registros importados."

    puts "Dados importados com sucesso!"
  end
end
