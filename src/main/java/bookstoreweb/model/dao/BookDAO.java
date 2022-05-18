package bookstoreweb.model.dao;

import bookstoreweb.model.bean.Book;
import connection.MySQLConnection;
import java.sql.*;
import java.sql.PreparedStatement;
import java.util.*;
import java.util.logging.*;

/**
 *
 * @author devsys-b
 */
public class BookDAO {

    private static final String SQL_INSERT = "INSERT INTO book(titulo,"
            + " autor, preco) "
            + "VALUES (?, ?, ?)";

    private static final String SQL_SELECT_ALL = "SELECT * FROM book";
    private static final String SQL_SELECT_ID = "SELECT * FROM book WHERE id = ?";

    private static final String SQL_UPDATE = "UPDATE book SET titulo = ?, "
            + "autor = ?, preco = ? WHERE id = ?";

    private static final String SQL_DELETE = "DELETE FROM book WHERE id = ?";

    public void create(Book b) {
        Connection conn = MySQLConnection.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = conn.prepareStatement(SQL_INSERT);
            stmt.setString(1, b.getTitulo());
            stmt.setString(2, b.getAutor());
            stmt.setDouble(3, b.getPreco());

            //Executa a query
            int auxRetorno = stmt.executeUpdate();

            Logger.getLogger(BookDAO.class.getName()).log(Level.INFO, null,
                    "Inclusao: " + auxRetorno);

        } catch (SQLException sQLException) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null,
                    sQLException);
        } finally {
            //Encerra a conexão com o banco e o statemnet
            MySQLConnection.closeConnection(conn, stmt);
        }
    }

    public List<Book> getResults() {
        Connection conn = MySQLConnection.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Book b = null;
        List<Book> listaBooks = null;

        try {
            //Prepara a string de SELECT e executa a query.
            stmt = conn.prepareStatement(SQL_SELECT_ALL);
            rs = stmt.executeQuery();

            //Carrega os dados do REsultSet rs, converte em Book e 
            // adiciona na lista de retorno.
            listaBooks = new ArrayList<>();

            while (rs.next()) {
                b = new Book();
                b.setId(rs.getInt("id"));
                b.setTitulo(rs.getString("titulo"));
                b.setAutor(rs.getString("autor"));
                b.setPreco(rs.getDouble("preco"));

                listaBooks.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return listaBooks;
    }

    public Book getResultsById(int id) {
        Connection conn = MySQLConnection.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Book b = null;

        try {
            stmt = conn.prepareStatement(SQL_SELECT_ID);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            //Carrega os dados do REsultSet rs, converte em Book e 
            // adiciona na lista de retorno.
            if (rs.next()) {
                b = new Book();
                b.setId(rs.getInt("id"));
                b.setTitulo(rs.getString("titulo"));
                b.setAutor(rs.getString("autor"));
                b.setPreco(rs.getDouble("preco"));

            }
        } catch (SQLException sQLException) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, sQLException);
        } finally {
            MySQLConnection.closeConnection(conn, stmt, rs);
        }
        return b;
    }

    public void update(Book b) {
        Connection conn = MySQLConnection.getConnection();
        PreparedStatement stmt = null;

        
        try {

            stmt = conn.prepareStatement(SQL_UPDATE);
            stmt.setString(1, b.getTitulo());
            stmt.setString(2, b.getAutor());
            stmt.setDouble(3, b.getPreco());
            stmt.setInt(4, b.getId());
            
            //Executa a query
            int auxRetorno = stmt.executeUpdate();

            Logger.getLogger(BookDAO.class.getName()).log(Level.INFO, null,
                    "Update: " + auxRetorno);
        } catch (SQLException sQLException) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null,
                    sQLException);

        } finally {
            //Encerra a conexão com o banco e o statement
            MySQLConnection.closeConnection(conn, stmt);
        }
    }

    public void delete(int id) {
        Connection conn = MySQLConnection.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setInt(1, id);

            //Executa a query
            int auxretorno = stmt.executeUpdate();

            Logger.getLogger(BookDAO.class.getName()).log(Level.INFO, null,
                    "Delete: " + auxretorno);

        } catch (SQLException sQLException) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null,
                    sQLException);

        } finally {
            //Encera a conexão com o banco e o statement.
            MySQLConnection.closeConnection(conn, stmt);
        }
    }
}
