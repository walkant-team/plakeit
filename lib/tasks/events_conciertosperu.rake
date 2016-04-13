# namespace :events_conciertosperu do
#   URL = 'http://conciertosperu.com.pe/agenda/'
#   SIGUIENTE_PAGINA = "div[onclick='javascript:funcionLecturaSig2();']"
#   Subtotal = Struct.new(:descripcion, :txt_importe)
#
#   task extraer: :environment do
#     include Capybara::DSL
#     carga_partido('TODOS POR EL PERU')
#     within('#accordion') do
#       find("[href='#collapse0']").click
#       tabla_periodos = find('table tbody')
#       guarda_todos_los_periodos(tabla_periodos)
#     end
#
#     puts "Total de periodos: #{Periodo.count}"
#
#     Periodo.all.each_with_index do |periodo, i|
#       all('#accordion table tbody tr')[i].all('td')[3].find('a').click
#       sleep 4
#       guarda_todos_los_aportes(periodo)
#       find("a[onclick='backPage();']").click
#       sleep 4
#     end
#   end
#
#   def guarda_periodo(celdas)
#     Periodo.create(
#       descripcion: celdas[0].text.strip,
#       aporte_efectivo: celdas[1].text.strip,
#       aporte_especies: celdas[2].text.strip,
#       total: celdas[3].text.strip
#     )
#   end
#
#   def guarda_todos_los_periodos(tabla)
#     tabla.all('tr').each do |tr|
#       celdas = tr.all('td')
#       guarda_periodo(celdas) unless celdas[0].text.strip == 'TOTAL'
#     end
#   end
#
#   def guarda_todos_los_aportes(periodo)
#     aportes_con_subtotales = []
#     loop do
#       sleep 5
#       filas = all('#detAll table tbody tr')
#       aportes_con_subtotales += acumula_aportes_de_pagina(filas)
#       sleep 5
#       break unless has_selector?(SIGUIENTE_PAGINA)
#       execute_script('funcionLecturaSig2()')
#     end
#     aportes_periodo = crear_aportes_periodo(aportes_con_subtotales)
#     periodo.aportes_periodo << aportes_periodo
#     periodo.save
#   end
#
#   def crear_aportes_periodo(aportes_con_subtotales)
#     aportes = []
#     aportes_con_subtotales.each_with_object([]) do |aporte, aportes_periodo|
#       if aporte.is_a?(Subtotal) && !aportes.empty?
#         aportes_periodo << nuevo_aporte_del_periodo(aportes)
#         aportes.clear
#       elsif aportes.size > 0 && se_olvidaron_poner_subtotal?(aportes.last, aporte)
#         aportes_periodo << nuevo_aporte_del_periodo(aportes)
#         aportes.clear
#         aportes << aporte
#       elsif !aporte.is_a?(Subtotal)
#         aportes << aporte
#       end
#     end
#   end
#
#   def se_olvidaron_poner_subtotal?(aporte_anterior, aporte_actual)
#     aporte_anterior.nombre_completo != aporte_actual.nombre_completo
#   end
#
#   def acumula_aportes_de_pagina(filas)
#     filas.each_with_object([]) do |fila ,aportes|
#       celdas = fila.all('td')
#       aportes << nuevo_aporte(celdas)
#     end.compact
#   end
#
#   def fila_total?(celdas)
#     celdas[0].text.strip == 'IMPORTE TOTAL'
#   end
#
#   def fila_subtotal?(celdas)
#     celdas[0].text.strip == 'TOTAL APORTADO'
#   end
#
#   def ultima_fila?(celdas)
#     celdas[0].text.strip == 'IMPORTE TOTAL DE PAGINA' || fila_total?(celdas)
#   end
#
#   def nuevo_aporte_del_periodo(aportes)
#     total_aportado = aportes.map(&:importe).sum
#     p "Nro de aportess de #{aportes.first.nombre_completo}: #{aportes.size}"
#     p "Aportes: #{aportes.map(&:campos_importantes)}"
#     p "TOTAL APORTADO: #{total_aportado}"
#     AportePeriodo.new(
#       nombre: aportes.first.nombre,
#       tipo_doc: aportes.first.tipo_doc,
#       nro_doc: aportes.first.nro_doc,
#       importe: total_aportado,
#       aportes: aportes
#     )
#   end
#
#   def nuevo_aporte(celdas)
#     if fila_subtotal?(celdas) || ultima_fila?(celdas)
#       return Subtotal.new(celdas[0].text.strip, celdas[1].text.strip)
#     end
#     return Aporte.new(
#       fecha: celdas[0].text.strip,
#       proceso_electoral: celdas[1].text.strip,
#       apellido_paterno: celdas[2].text.strip,
#       apellido_materno: celdas[3].text.strip,
#       nombre: celdas[4].text.strip,
#       tipo_doc: celdas[5].text.strip,
#       nro_doc: celdas[6].text.strip,
#       tipo: celdas[7].text.strip,
#       naturaleza: celdas[8].text.strip,
#       importe: celdas[9].text.strip.delete(',')
#     ) if celdas.size == 10
#     Aporte.new(
#       fecha: celdas[0].text.strip,
#       proceso_electoral: celdas[1].text.strip,
#       apellido_paterno: celdas[2].text.strip,
#       apellido_materno: celdas[3].text.strip,
#       nombre: celdas[4].text.strip,
#       tipo_doc: celdas[4].text.strip,
#       nro_doc: celdas[4].text.strip,
#       tipo: celdas[5].text.strip,
#       naturaleza: celdas[6].text.strip,
#       importe: celdas[7].text.strip.delete(',')
#     )
#   end
#
#   def carga_partido(partido)
#     visit URL
#     find('#cboTipo').select('PARTIDO POLITICO')
#     sleep 1
#     find('#cboOrga').select(partido)
#     click_on('BUSCAR')
#   end
# end
