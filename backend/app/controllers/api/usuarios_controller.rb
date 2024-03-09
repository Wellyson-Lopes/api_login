module Api
  class UsuariosController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:login]
    skip_before_action :valida_token, only: [:login]

    # [POST] /api/usuarios/login
    def login
      usuario = Usuario.find_by_email(params[:email])
      if usuario&.authenticate_senha(params[:senha])
        token = JWT.encode(usuario.attributes.except("senha_digest"), "12345", "HS256")
        render json: {token: token, usuario: usuario}, status: :accepted
      else
        render json: {errors: "Email ou senha inválidos"}, status: :unauthorized
      end
    end

    # Lista usuários
    #
    # GET /api/usuarios
    def index
      @usuarios = Usuario.all
    end

    # Detalha usuário
    #
    # GET /api/usuarios/:id
    def show
      usuario = Usuario.find_by(id: params[:id])
      render status: :not_found and return if @usuario.nil?

      render json: usuario
    end

    # Cria usuário
    #
    # POST /api/usuarios
    def create
      usuario = Usuario.new(usuario_params)

      if usuario.save
        render json: usuario, status: :created
      else
        render json: usuario.errors, status: :unprocessable_entity
      end
    end

    # Atualiza usuário
    #
    # PUT /api/usuarios/:id
    def update
      usuario = Usuario.find_by(id: params[:id])
      render status: :not_found and return if @usuario.nil?

      if usuario.update(usuario_params)
        render json: usuario, status: :accepted
      else
        render json: usuario.errors, status: :unprocessable_entity
      end
    end

    private

    def usuario_params
      params.require(:usuario).permit(:nome, :email, :senha, :admin)
    end
  end
end
