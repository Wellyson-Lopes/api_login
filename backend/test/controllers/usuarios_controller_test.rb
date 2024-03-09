require "test_helper"

class Api::UsuariosControllerTest < ActionDispatch::IntegrationTest
  def setup
    usuario = FactoryBot.create(:usuario, :admin)
    @token = JWT.encode(usuario.attributes.except("senha_digest"), "12345", "HS256")
  end

  context "#login" do
    setup do
      @usuario = FactoryBot.create(:usuario, :admin)
    end

    subject { post api_login_url, params: {email: @usuario.email, senha: @usuario.senha} }

    context "com usuario e senha corretos" do
      setup { subject }

      should "retorna :accepted" do
        assert_response :accepted
      end

      should "retorna token" do
        assert_not_nil JSON.parse(@response.body)["token"]
      end

      should "retorna dados do usuário" do
        assert @usuario.nome, JSON.parse(@response.body)["usuario"]["nome"]
        assert @usuario.email, JSON.parse(@response.body)["usuario"]["email"]
        assert @usuario.admin, JSON.parse(@response.body)["usuario"]["admin"]
      end
    end

    context "com usuario e senha incorretos" do
      setup do
        @usuario.email = "email@inexistente.com"
        subject
      end

      should "retorna :unauthorized" do
        assert_response :unauthorized
      end
    end
  end

  context "#index" do
    subject { get api_usuarios_url, headers: {HTTP_AUTHORIZATION: @token} }

    context "usuário não atenticado" do
      setup do
        @token = nil
      end

      should "retorna :unauthorized" do
        subject

        assert_response :unauthorized
      end
    end

    context "usuário autenticado" do
      should "retorna :ok" do
        subject
        assert_response :ok
      end

      should "retorna lista com a quantidade de usuários" do
        @usuarios = FactoryBot.create_list(:usuario, 2)
        subject

        assert JSON.parse(@response.body).is_a?(Array)
        assert_equal 3, JSON.parse(@response.body).size
      end
    end
  end

  context "#show" do
    setup do
      @usuario = FactoryBot.create(:usuario)
    end

    subject { get api_usuario_url(@usuario), headers: {HTTP_AUTHORIZATION: @token} }

    context "usuário não atenticado" do
      setup do
        @token = nil
      end

      should "retorna :unauthorized" do
        subject

        assert_response :unauthorized
      end
    end

    context "usuário autenticado" do
      should "retorna :ok" do
        subject
        assert_response :ok
      end

      should "retorna objeto com dados do usuário" do
        subject

        usuario = JSON.parse(@response.body)
        assert usuario.is_a?(Hash)
        assert_equal @usuario.id, usuario["id"]
        assert_equal @usuario.nome, usuario["nome"]
        assert_equal @usuario.email, usuario["email"]
        assert_equal @usuario.admin, usuario["admin"]
      end
    end
  end

  context "#update" do
    setup do
      @usuario = FactoryBot.create(:usuario)
      @params = {
        usuario: {
          id: @usuario.id,
          nome: "Novo nome"
        }
      }
    end

    subject {
      put api_usuario_url(@usuario), headers: {HTTP_AUTHORIZATION: @token},
        params: @params
    }

    context "usuário não atenticado" do
      setup do
        @token = nil
      end

      should "retorna :unauthorized" do
        subject

        assert_response :unauthorized
      end
    end

    context "usuário autenticado" do
      should "retorna :accepted" do
        subject
        assert_response :accepted
      end

      should "atualiza usuario" do
        subject
        assert_equal "Novo nome", @usuario.reload.nome
      end

      should "retorna objeto com dados do usuário" do
        subject

        usuario = JSON.parse(@response.body)
        assert usuario.is_a?(Hash)
        assert_equal @usuario.id, usuario["id"]
        assert_equal "Novo nome", usuario["nome"]
      end
    end
  end

  context "#create" do
    setup do
      @params = {
        usuario: {
          nome: "Novo usuario",
          email: "novo@usuario.com",
          senha: "123456",
          admin: false
        }
      }
    end

    subject {
      post api_usuarios_url, headers: {HTTP_AUTHORIZATION: @token},
        params: @params
    }

    context "usuário não atenticado" do
      setup do
        @token = nil
      end

      should "retorna :unauthorized" do
        subject

        assert_response :unauthorized
      end
    end

    context "usuário autenticado" do
      should "retorna :created" do
        subject
        assert_response :created
      end

      should "cria usuario" do
        assert_difference("Usuario.count", 1) do
          subject
        end
      end

      should "retorna objeto com dados do usuário" do
        subject

        usuario = JSON.parse(@response.body)
        assert usuario.is_a?(Hash)
        assert_equal "Novo usuario", usuario["nome"]
      end
    end
  end
end
