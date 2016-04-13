Category.find_or_create_by!(name: 'concert')
Category.find_or_create_by!(name: 'musical')
Category.find_or_create_by!(name: 'theater')

# Tag de eventos concierto
list_tag_concert = ['Música Sinfónica', 'Navidad']

list_tag_concert.each do |tag|
  ActsAsTaggableOn::Tag.find_or_create_by!(name: tag)
end

# Tag de eventos musica
list_tag_music =
  ['Alternativa', 'Reggae', 'Rap', 'Reggae', 'Rap', 'Pop', 'Ska', 'Blues',
   'Jazz', 'Música Clásica', 'Reggaeton', 'Salsa', 'Cumbia', 'Electronica', 'Punk', 'Metal',
   'Metal Alternativo', 'Black Metal', 'Nu Metal', 'Power Metal', 'Death Metal', 'Funk Metal',
   'Doom Metal', 'Thrash Metal', 'Bolero', 'Country', 'Indie', 'Música Criolla', 'Disco',
   'Dance', 'Eurodance', 'Kpop', 'Trova', 'Hip Hop', 'Soul', 'Folk', 'Baladas Romanticas',
   'Fusión', 'Techno', 'Vallenato', 'Tropical', 'Urbano', 'Cubana', 'Bossa Nova', 'Flamengo',
   'Folklore', 'Latin Pop', 'Merengue', 'Tango', 'Tradicional', 'Bachata', 'Andina']

list_tag_music.each do |tag|
  ActsAsTaggableOn::Tag.find_or_create_by!(name: tag)
end

# Tag de eventos teatro
list_tag_theater =
  ['Monólogo', 'Tragedia', 'Comedia', 'Drama', 'Tragicomedia', 'Ópera', 'Zarzuela', 'Pantomimaa',
   'Títeres y Marionetas', 'Callejero', 'Trágico', 'Infantil', 'Pedagógico', 'Mímico', 'Ballet',
   'Circo', 'Danza', 'Danza Aérea', 'Narración', 'Poesía', 'Cuenteros', 'Suspenso', 'Taller']

list_tag_theater.each do |tag|
  ActsAsTaggableOn::Tag.find_or_create_by!(name: tag)
end
