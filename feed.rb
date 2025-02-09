SRC_DIR = "src"
Dir.glob("#{SRC_DIR}/*.shp") {|path|
  system <<-EOS
ogr2ogr -of GeoJSONSeq -s_srs EPSG:32751 -t_srs EPSG:4326 /vsistdout #{path} | \
tippecanoe-json-tool | \
ruby filter.rb
  EOS
}
