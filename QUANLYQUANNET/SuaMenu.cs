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
    public partial class SuaMenu : Form
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = Properties.Settings.Default.Str;
        public SuaMenu(string ten,string loai,string soluong,string dvt,string dongia)
        {
            InitializeComponent();
            txtten.Text = ten;
            cbbloai.Text = loai;
            txtsoluong.Text = soluong;
            txtdvt.Text = dvt;
            txtdongia.Text = dongia;
        }

        private void SuaMenu_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(str);
            con.Open();
        }

        private void btnsua_Click(object sender, EventArgs e)
        {
            string selectedItem = cbbloai.Text;
            string temp = "";
            if (selectedItem == "Nước uống")
                temp = "ML02";
            else
                temp = "ML01";

            cmd = con.CreateCommand();
            cmd.CommandText = "update menu set TENHANG = '"+ txtten.Text + "',SOLUONGTON= '"+ txtsoluong.Text + "',MALOAIHANG='"+temp+"',DVT='"+txtdvt.Text+"',DONGIA='"+txtdongia.Text+"' where TENHANG = '"+txtten.Text+"'";
            cmd.ExecuteNonQuery();
            MessageBox.Show("Đã sửa thành công");
        }

        private void btnthoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
