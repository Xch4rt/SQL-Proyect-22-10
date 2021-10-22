using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using SistemaTeatroNacionalRD.Controller;

namespace SistemaTeatroNacionalRD.Views
{
    public partial class FrmLoggin : Form
    {
        
        public FrmLoggin()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DataTable dato;
            dato = CUsuario.Validar_acceso(this.txtUsuario.Text, this.txtContraseña.Text);
            string nombreUsuario;
            string rol;

            if (dato != null)
            {
                if (dato.Rows.Count > 0)
                {
                    if (dato.Rows[0][0].ToString() == "Acceso Exitoso")
                    {
                        nombreUsuario = dato.Rows[0][1].ToString();
                        rol = dato.Rows[0][2].ToString();
                        MessageBox.Show("Bienvenido al Sistema", "Sistema de Reservas", MessageBoxButtons.OK, MessageBoxIcon.Information);



                    }
                    else
                    {
                        MessageBox.Show("Acceso Denegado al Sistema de Reservaciones", "Sistema de Reservas", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    }
                }
            }
            else
            {
                MessageBox.Show("No hay conexión al servidor "+(dato == null).ToString(), "Sistema de Reservas", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
    }
}
