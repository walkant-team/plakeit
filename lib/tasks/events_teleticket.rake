# require 'capybara'
# require 'capybara/dsl'
# require 'capybara/poltergeist'
#
# include Capybara::DSL
# Capybara.default_driver = :poltergeist
#
# url = "http://www.teleticket.com.pe/tlk_formularios/frm_Busqueda.aspx?l_categoria=2&l_subcategoria=0"
# next_page = "div[onclick='javascript:funcionLecturaSig2();']"
#
# namespace :events_teleticket do
#   desc 'Extraer data de eventos en teleticket'
#   task :extraer do
#     visit url
#     # pages = find('.cssPageBusqueda').find('tr').all('a')
#     # pages.each do |pagina|
#       all(".resultado_bloque").each do |event|
#         trs = event.all('tr')
#         image_url = trs[0].find("input")['src']
#         tds = trs[1].all('td')
#         title = tds[0].find('a').text
#         start_at = tds[1].find('a').text
#         place = trs[2].find('td span').text
#         puts "image_url: #{image_url}"
#         puts "title: #{title}"
#         puts "start_at: #{start_at}"
#         puts "place: #{place}"
#       end
#       # execute_script(pages['href'])
#     # end
#   end
# end
