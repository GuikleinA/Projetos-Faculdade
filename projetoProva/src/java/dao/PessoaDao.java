/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;
import model.Pessoa;

public class PessoaDao {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
            //ALTERAR O CAMINHO DO ARQUIVO TEST.DB
            con = DriverManager.getConnection("jdbc:postgresql://localhost/pessoadb?user=postgres&password=postgres&ssl=false");
      
        } catch (Exception e) {
            System.out.println(e);

        }
        return con;
    }

    public static int salvar(Pessoa u) {
        int status = 0;
        try {
            System.out.println("teste");
            Connection con = getConnection();
            Statement ps = con.createStatement();
            status=ps.executeUpdate("insert into pessoa(nome,telefone,email,cpf) values('" + u.getNome() + "','" + u.getTelefone() + "','" + u.getEmail() + "','" + u.getCpf() + "')");
            

        } catch (Exception e) {

            System.out.println(e);

        }
        return status;
    }

    public static int atualizar(Pessoa u) {
        int status = 0;
        try {
            Connection con = getConnection();
            Statement ps = con.createStatement();
             status=ps.executeUpdate("update pessoa set nome='" + u.getNome() + "',telefone='" + u.getTelefone() + "',email='" + u.getEmail() + "',cpf='" + u.getCpf() + "' where id=" + u.getId());

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static int deletar(Pessoa u) {
        int status = 0;
        try {
            Connection con = getConnection();
            Statement ps = con.createStatement();
            status= ps.executeUpdate("delete from pessoa where id=" + u.getId());

        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("STATUS  " + status);
        return status;
    }

    public static List<Pessoa> lerTudo() {
        List<Pessoa> list = new ArrayList<Pessoa>();

        try {
            Connection con = getConnection();
            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery("select * from pessoa");
            while (rs.next()) {
                Pessoa u = new Pessoa();
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setTelefone(rs.getString("telefone"));
                u.setEmail(rs.getString("email"));
                u.setCpf(rs.getString("cpf"));
                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static Pessoa getContatoPorId(int id) {
        Pessoa u = null;
        try {
            Connection con = getConnection();
            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery("select * from pessoa where id ="+id);
            
            while (rs.next()) {
                u = new Pessoa();
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setTelefone(rs.getString("telefone"));
                u.setEmail(rs.getString("email"));
                u.setCpf(rs.getString("cpf"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return u;
    }  
}
