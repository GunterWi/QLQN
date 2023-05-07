using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace QUANLYQUANNET
{
    public partial class ThemMenu : Form
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = Properties.Settings.Default.Str;
        public ThemMenu()
        {
            InitializeComponent();

        }

        private void btnthem_Click(object sender, EventArgs e)
        {
            string selectedItem = cbbloai.Text;
            string temp="";
            if (selectedItem == "Nước uống")
                temp = "ML02";
            else
                temp = "ML01";
                
            cmd = con.CreateCommand();
            cmd.CommandText = "INSERT INTO MENU VALUES('"+txtma.Text+"',N'"+txtten.Text+"','"+txtsoluong.Text+"','"+temp+"','"+txtdvt.Text+"','"+txtdongia.Text+"')";
            cmd.ExecuteNonQuery();
            MessageBox.Show("Đã thêm thành công");
        }

        private void ThemMenu_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(str);
            con.Open();
        }
    }
}
