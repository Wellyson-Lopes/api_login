class ApplicationController < ActionController::Base
  before_action :valida_token

  private

  def valida_token
    token = request.headers["Authorization"]

    render json: {erro: "Token inválido"}, status: :unauthorized and return if token.nil?

    token = token.gsub(/^Bearer /, "")

    # Salva o usuario numa variável global
    decoded = JWT.decode token, "12345"
    @usuario = Usuario.find(decoded[0]["id"])
    @current_user = @usuario
  end
end
