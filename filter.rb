require 'json'

while gets
  f = JSON.parse($_.strip)
  layer = f['properties']['LAYER'] || f['properties']['Layer'] || 'unknown'
  f['properties'].delete('LAYER')
  f['properties'].delete('Layer')
  f['properties'].delete('OBJECTID')
  f['properties'].delete('Shape_Leng')

  layer = 'Gorong_Gorong' if layer == 'Gorong-gorong'
  layer = 'TPU' if layer == 'Tpu'
  layer = 'Kolam' if layer == 'kolam'

#$stderr.print f['geometry']['type'], "\n"

  f[:tippecanoe] = {
    :layer => layer,
    :minzoom => %w{Polygon MultiPolygon}.include?(f['geometry']['type']) ? 15 : 
      layer == 'Batas Pantai' ? 8 : layer == 'Alur' ? 12 : 11,
    :maxzoom => 17
  }
  print JSON.dump(f)
end

