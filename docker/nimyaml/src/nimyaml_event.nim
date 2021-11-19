import yaml/stream, yaml/parser, streams

var
  p: YamlParser

p.init()

var events = p.parse(newFileStream(stdin))

for event in events:
  echo p.display(event)
