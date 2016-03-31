require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

include Capybara::DSL
Capybara.default_driver = :poltergeist

url = "http://www.teleticket.com.pe/tlk_formularios/frm_Busqueda.aspx?l_categoria=2&l_subcategoria=0"

namespace :events_teleticket do
  desc 'Extraer data de eventos en teleticket'
  task :extraer do
    visit url
    pages = find('.cssPageBusqueda').find('tr').all('a')
    pages.each do |pagina|
      sleep 5
      # events_css = all(".resultado_bloque")
      # events_show = []
      # list_address = []
      # events_css.each do |event|
      #   trs = event.all('tr')
      #   tds = trs[1].all('td')
      #   script_show = tds[0].find('a')['href']
      #   events_show << script_show
      # end
      # events_show.each do |event_show|
      #   execute_script(event_show)
      #   sleep 5
      #   address = find('.Texto_calendvereventos').find(:xpath, "..").text
      #   list_address << address
      #   execute_script('window.history.back()')
      #   sleep 5
      # end
      # list_address.each do |address|
      #   puts address
      # end

      events = all(".resultado_bloque")
      events.each do |event|
        trs = event.all('tr')
        image_url = trs[0].find("input")['src']
        tds = trs[1].all('td')
        title = tds[0].find('a').text
        start_at = tds[1].find('a').text
        place = trs[2].find('td span').text
        script_show = tds[0].find('a')['href']
        sleep 5
        execute_script(script_show)
        sleep 5
        #show event
        address = find('.Texto_calendvereventos').find(:xpath, "..").text
        # tr_descrip = all('.bloque_contenido1')[1].all('tr')[1]
        # description = tr_descrip.find('td').find('div').text
        # tr.all('td')[1]
        # puts "image_url: #{image_url}"
        # puts "title: #{title}"
        # puts "start_at: #{start_at}"
        # puts "place: #{place}"
        puts "address: #{address}"
        puts "description: #{description}"
        execute_script('window.history.back()')
        sleep 5
      end
      # byebug
      execute_script(pagina['href'])
    end
  end
end
