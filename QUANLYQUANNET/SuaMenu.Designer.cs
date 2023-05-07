namespace QUANLYQUANNET
{
    partial class SuaMenu
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnthoat = new System.Windows.Forms.Button();
            this.btnsua = new System.Windows.Forms.Button();
            this.cbbloai = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtdongia = new System.Windows.Forms.TextBox();
            this.txtdvt = new System.Windows.Forms.TextBox();
            this.txtsoluong = new System.Windows.Forms.TextBox();
            this.txtten = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // btnthoat
            // 
            this.btnthoat.Location = new System.Drawing.Point(351, 163);
            this.btnthoat.Name = "btnthoat";
            this.btnthoat.Size = new System.Drawing.Size(89, 38);
            this.btnthoat.TabIndex = 27;
            this.btnthoat.Text = "Thoát";
            this.btnthoat.UseVisualStyleBackColor = true;
            this.btnthoat.Click += new System.EventHandler(this.btnthoat_Click);
            // 
            // btnsua
            // 
            this.btnsua.Location = new System.Drawing.Point(230, 163);
            this.btnsua.Name = "btnsua";
            this.btnsua.Size = new System.Drawing.Size(89, 38);
            this.btnsua.TabIndex = 26;
            this.btnsua.Text = "Sửa";
            this.btnsua.UseVisualStyleBackColor = true;
            this.btnsua.Click += new System.EventHandler(this.btnsua_Click);
            // 
            // cbbloai
            // 
            this.cbbloai.FormattingEnabled = true;
            this.cbbloai.Items.AddRange(new object[] {
            "Nước uống",
            "Đồ ăn"});
            this.cbbloai.Location = new System.Drawing.Point(126, 119);
            this.cbbloai.Name = "cbbloai";
            this.cbbloai.Size = new System.Drawing.Size(121, 24);
            this.cbbloai.TabIndex = 25;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(36, 125);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(66, 16);
            this.label6.TabIndex = 24;
            this.label6.Text = "Loại hàng";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(269, 83);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(53, 16);
            this.label5.TabIndex = 23;
            this.label5.Text = "Đơn giá";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(269, 38);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(35, 16);
            this.label4.TabIndex = 22;
            this.label4.Text = "DVT";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(36, 80);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(81, 16);
            this.label3.TabIndex = 21;
            this.label3.Text = "Số lượng tồn";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(36, 39);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(60, 16);
            this.label2.TabIndex = 20;
            this.label2.Text = "Tên món";
            // 
            // txtdongia
            // 
            this.txtdongia.Location = new System.Drawing.Point(343, 77);
            this.txtdongia.Name = "txtdongia";
            this.txtdongia.Size = new System.Drawing.Size(100, 22);
            this.txtdongia.TabIndex = 18;
            // 
            // txtdvt
            // 
            this.txtdvt.Location = new System.Drawing.Point(343, 35);
            this.txtdvt.Name = "txtdvt";
            this.txtdvt.Size = new System.Drawing.Size(100, 22);
            this.txtdvt.TabIndex = 17;
            // 
            // txtsoluong
            // 
            this.txtsoluong.Location = new System.Drawing.Point(126, 80);
            this.txtsoluong.Name = "txtsoluong";
            this.txtsoluong.Size = new System.Drawing.Size(34, 22);
            this.txtsoluong.TabIndex = 16;
            // 
            // txtten
            // 
            this.txtten.Location = new System.Drawing.Point(126, 35);
            this.txtten.Name = "txtten";
            this.txtten.Size = new System.Drawing.Size(109, 22);
            this.txtten.TabIndex = 15;
            // 
            // SuaMenu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(498, 228);
            this.Controls.Add(this.btnthoat);
            this.Controls.Add(this.btnsua);
            this.Controls.Add(this.cbbloai);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtdongia);
            this.Controls.Add(this.txtdvt);
            this.Controls.Add(this.txtsoluong);
            this.Controls.Add(this.txtten);
            this.Name = "SuaMenu";
            this.Text = "SuaMenu";
            this.Load += new System.EventHandler(this.SuaMenu_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnthoat;
        private System.Windows.Forms.Button btnsua;
        private System.Windows.Forms.ComboBox cbbloai;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtdongia;
        private System.Windows.Forms.TextBox txtdvt;
        private System.Windows.Forms.TextBox txtsoluong;
        private System.Windows.Forms.TextBox txtten;
    }
}