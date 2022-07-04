package br.com.criandoapi.projeto.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data

@Entity
@Table(name = "usuario")
public class Usuario {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_usuario")
	private Integer id;
	

	@NotBlank(message = "O nome é obrigatório!")
	@Size(min = 10 , message = "O nome deve ter no mínimo 10 caracteres!")
	@Column(name = "nome_usuario", length = 200, nullable = true)
	private String nome;
	
	@NotBlank(message = "O nome da empresa é obrigatório!")
	@Column(name = "nome_empresa", length = 200, nullable = true)
	private String empresa;
		
	@Email(message = "Insira um e-mail válido!")
	@NotBlank(message = "O e-mail é obrigatório!")
	@Column(name = "email_usuario", length = 50, nullable = true)
	private String email;
	
	@NotBlank(message = "A senha é obrigatória!")
	@Column(name = "senha_usuario", columnDefinition = "TEXT" ,nullable = true)
	private String senha;
	
	@NotBlank(message = "O telefone é obrigatório!")
	@Column(name = "telefone_usuario", length = 15, nullable = true)
	private String telefone;
	
}