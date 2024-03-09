json.array! @usuarios do |usuario|
  json.id usuario.id
  json.nome usuario.nome
  json.email usuario.email
  json.created_at usuario.created_at
  json.admin usuario.admin
end
