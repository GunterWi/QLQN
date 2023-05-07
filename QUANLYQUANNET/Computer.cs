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

namespace QUANLYQUANNET
{
    public partial class Computer : Form
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = Properties.Settings.Default.Str;
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table;
        public Computer()
        {
            InitializeComponent();
        }
        void loaddata()
        {
            cmd = con.CreateCommand();
            cmd.CommandText = "select * from MayKhach";
            adapter.SelectCommand = cmd;
            table = new DataTable();
            adapter.Fill(table);
            dgvmaykhach.DataSource = table;
        }

        private void Computer_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(str);
            con.Open();
            loaddata();
        }
    }
}
