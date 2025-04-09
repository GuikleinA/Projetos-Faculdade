package model;
import utils.InvalidEntryException;

public class Pessoa {
    private int id;
    private String nome;
    private String telefone;
    private String email;
    private String cpf;

    public Pessoa()
    {
        this.nome = null;
        this.telefone = null;
        this.email = null;
        this.cpf = null;
    }
    
    public Pessoa(int id, String nome, String telefone, String email, String cpf){
        this.id = id;
        this.nome = nome;
        this.telefone = telefone;
        this.email = email;
        this.cpf = cpf;
    }
    
    public Pessoa(String nome, String telefone, String email, String cpf)throws InvalidEntryException{
        this.nome = this.validadeNome(nome);
        this.telefone = this.validadeTelefone(telefone);
        this.email = this.validadeEmail(email);
        this.cpf = this.validadeCpf(cpf);
    }

    public String validadeNome(String nome) throws InvalidEntryException{

        if (nome.length() > 0)
        {
            return nome;
        }
        else
        {
            throw new InvalidEntryException("Nome inválido");
        }
    }
    
    public String validadeTelefone(String telefone) throws InvalidEntryException{
        telefone = telefone.replaceAll("[^0-9]", "");
        if (telefone.length() >= 10 && telefone.length() <= 11)
        {
            return telefone;
        }
        else
        {
            throw new InvalidEntryException("Telefone inválido");
        }
    }
    
    public String validadeEmail(String email) throws InvalidEntryException{

        if (email.length() > 0)
        {
            return email;
        }
        else
        {
            throw new InvalidEntryException("Email inválido");
        }
    }
    
    public String validadeCpf(String cpf) throws InvalidEntryException{
        cpf = cpf.replaceAll("[^0-9]", "");

        if (cpf.length() == 0)
        {
            return cpf;
        }
        else
        {
            throw new InvalidEntryException("CPF inválido");
        }
    }
    
    
    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public String getEmail() {
        return email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    
    
    
}
