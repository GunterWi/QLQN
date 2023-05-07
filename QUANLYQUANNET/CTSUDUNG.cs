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
    public partial class CTSUDUNG : Form
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = Properties.Settings.Default.Str;
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table;
        public CTSUDUNG()
        {
            InitializeComponent();
        }
        private void CTSUDUNG_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(str);
            con.Open();
            loaddata();
        }
        void loaddata()
        {
            cmd = con.CreateCommand();
            cmd.CommandText = "select mk.MAMT as [Mã Máy Tính], mk.TENMAYTINH as [Tên Máy tính], tv.MATAIKHOAN as[Mã tài khoản], tv.TENTAIKHOAN as[Tên tài khoản],GIOBATDAU as[Giờ bắt đầu], GIOKETTHUC as[Giờ kết thúc ] from CTSUDUNG ct join MAYKHACH mk on ct.MAMT=mk.MAMT join THANHVIEN tv on tv.MATAIKHOAN = ct.MATAIKHOAN where mk.MAMT like '%"+txttimkiem.Text+ "%' or mk.TENMAYTINH like N'%"+txttimkiem.Text+ "%' or tv.MATAIKHOAN like '%"+txttimkiem.Text+ "%' or tv.TENTAIKHOAN like N'%"+txttimkiem.Text+ "%' or GIOBATDAU like '%"+txttimkiem.Text+ "%' or GIOKETTHUC like '%"+txttimkiem.Text+"%' ";
            adapter.SelectCommand = cmd;
            table = new DataTable();
            adapter.Fill(table);
            dgvctsudung.DataSource = table;
        }
        private void txttimkiem_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
