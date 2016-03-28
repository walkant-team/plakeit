require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

include Capybara::DSL
Capybara.default_driver = :poltergeist

url = 'http://www.tuentrada.com.pe/index_area.asp?id=1'

namespace :events_tuentrada do
  desc 'Extraer data de eventos en tuentrada'
  task :extraer do
    visit url
    all(".columna_izq .evento").each do |event|
      divs = event.find('.cont').all('div')
      image_url = divs[0].find(".imagen img")['src']
      title = divs[1].find(".bold").text.strip
      start_at = divs[1].all("p").last.text.strip
      place = divs[2].first(".bold").text.strip
      puts "image_url: #{image_url}"
      puts "title: #{title}"
      puts "start_at: #{start_at}"
      puts "place: #{place}"
    end
  end
end


def save_event(celdas)
  image_url = celdas[0].find('a')['href']
  title = celdas[1].find('.bold').text.strip
  puts image_url
  puts title
  # celdas[1].text.strip
  # Event.create(
  #   image: celdas[0].find('a')['href'],
  #   aporte_efectivo: celdas[1].text.strip,
  #   aporte_especies: celdas[2].text.strip,
  #   total: celdas[3].text.strip
  # )
end


def save_events
  list_events = find('.columna_izq')
  list_events.all('.evento').each do |event|
    byebug
    celdas = event.all('div')
    save_event(celdas)
  end
end
