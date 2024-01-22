using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace DA_QLNhanSu.Models
{
    public partial class QLNhanSuContext : DbContext
    {
        public QLNhanSuContext()
        {
        }

        public QLNhanSuContext(DbContextOptions<QLNhanSuContext> options)
            : base(options)
        {
        }

        public virtual DbSet<TblBaoHiemXh> TblBaoHiemXhs { get; set; }
        public virtual DbSet<TblChuyenMon> TblChuyenMons { get; set; }
        public virtual DbSet<TblDonVi> TblDonVis { get; set; }
        public virtual DbSet<TblLuong> TblLuongs { get; set; }
        public virtual DbSet<TblThang> TblThangs { get; set; }
        public virtual DbSet<TblThongKeLuong> TblThongKeLuongs { get; set; }
        public virtual DbSet<TblThueThuNhapCaNhan> TblThueThuNhapCaNhans { get; set; }
        public virtual DbSet<TblTrinhDo> TblTrinhDos { get; set; }
        public virtual DbSet<TblTtnhanVien> TblTtnhanViens { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=QLNhanSu;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Latin1_General_CI_AS");

            modelBuilder.Entity<TblBaoHiemXh>(entity =>
            {
                entity.HasKey(e => e.MaBhxh)
                    .HasName("PK__tblBaoHi__8338BDD3EEA2E475");

                entity.ToTable("tblBaoHiemXH");

                entity.Property(e => e.MaBhxh).HasColumnName("MaBHXH");

                entity.Property(e => e.GhiChu).HasMaxLength(50);

                entity.Property(e => e.NgayCap).HasColumnType("datetime");

                entity.Property(e => e.NoiCap).HasMaxLength(50);

                entity.Property(e => e.NoiDkkcb)
                    .HasMaxLength(50)
                    .HasColumnName("NoiDKKCB");
            });

            modelBuilder.Entity<TblChuyenMon>(entity =>
            {
                entity.HasKey(e => e.MaCm)
                    .HasName("PK__tblChuye__27258E0F938B2085");

                entity.ToTable("tblChuyenMon");

                entity.Property(e => e.MaCm).HasColumnName("MaCM");

                entity.Property(e => e.GhiChu).HasMaxLength(100);

                entity.Property(e => e.TenCm)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("TenCM");
            });

            modelBuilder.Entity<TblDonVi>(entity =>
            {
                entity.HasKey(e => e.MaDv)
                    .HasName("PK__tblDonVi__272586574D294F31");

                entity.ToTable("tblDonVi");

                entity.Property(e => e.MaDv).HasColumnName("MaDV");

                entity.Property(e => e.GhiChu).HasMaxLength(100);

                entity.Property(e => e.TenDv)
                    .HasMaxLength(50)
                    .HasColumnName("TenDV");
            });

            modelBuilder.Entity<TblLuong>(entity =>
            {
                entity.HasKey(e => e.MaLuong)
                    .HasName("PK__tblLuong__6609A48DD3FAEBAD");

                entity.ToTable("tblLuong");

                entity.Property(e => e.GhiChu).HasMaxLength(100);

                entity.Property(e => e.LuongCbmoi).HasColumnName("LuongCBMoi");

                entity.Property(e => e.MaCm).HasColumnName("MaCM");

                entity.Property(e => e.MaDv).HasColumnName("MaDV");

                entity.Property(e => e.MaTd).HasColumnName("MaTD");

                entity.Property(e => e.NgayNhap).HasColumnType("datetime");

                entity.Property(e => e.NgaySua).HasColumnType("datetime");

                entity.HasOne(d => d.MaCmNavigation)
                    .WithMany(p => p.TblLuongs)
                    .HasForeignKey(d => d.MaCm)
                    .HasConstraintName("FK_tblLuong_tblChuyenMon");

                entity.HasOne(d => d.MaDvNavigation)
                    .WithMany(p => p.TblLuongs)
                    .HasForeignKey(d => d.MaDv)
                    .HasConstraintName("FK_tblLuong_tblDonVi");

                entity.HasOne(d => d.MaTdNavigation)
                    .WithMany(p => p.TblLuongs)
                    .HasForeignKey(d => d.MaTd)
                    .HasConstraintName("FK_tblLuong_tblTrinhDo");
            });

            modelBuilder.Entity<TblThang>(entity =>
            {
                entity.HasKey(e => e.MaThang)
                    .HasName("PK__tblThang__94C869910E932198");

                entity.ToTable("tblThang");

                entity.Property(e => e.GhiChu).HasMaxLength(200);

                entity.Property(e => e.TenThang)
                    .IsRequired()
                    .HasMaxLength(200);
            });

            modelBuilder.Entity<TblThongKeLuong>(entity =>
            {
                entity.HasKey(e => e.MaTkluong)
                    .HasName("PK__tblThong__B68A03198E463511");

                entity.ToTable("tblThongKeLuong");

                entity.Property(e => e.MaTkluong).HasColumnName("MaTKLuong");

                entity.Property(e => e.GhiChu).HasMaxLength(200);

                entity.Property(e => e.MaNv).HasColumnName("MaNV");

                entity.Property(e => e.NgayTao).HasColumnType("datetime");

                entity.HasOne(d => d.MaNvNavigation)
                    .WithMany(p => p.TblThongKeLuongs)
                    .HasForeignKey(d => d.MaNv)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__tblThongKe__MaNV__5070F446");

                entity.HasOne(d => d.MaThangNavigation)
                    .WithMany(p => p.TblThongKeLuongs)
                    .HasForeignKey(d => d.MaThang)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__tblThongK__MaTha__5165187F");
            });

            modelBuilder.Entity<TblThueThuNhapCaNhan>(entity =>
            {
                entity.HasKey(e => e.MaThue)
                    .HasName("PK__tblThueT__9CC2FDA3DF5BB7D2");

                entity.ToTable("tblThueThuNhapCaNhan");

                entity.Property(e => e.CoQuanQuanLyThue).HasMaxLength(100);

                entity.Property(e => e.GhiChu).HasMaxLength(50);

                entity.Property(e => e.NgayDangKi).HasColumnType("datetime");

                entity.HasOne(d => d.MaLuongNavigation)
                    .WithMany(p => p.TblThueThuNhapCaNhans)
                    .HasForeignKey(d => d.MaLuong)
                    .HasConstraintName("FK__tblThueTh__MaLuo__440B1D61");
            });

            modelBuilder.Entity<TblTrinhDo>(entity =>
            {
                entity.HasKey(e => e.MaTd)
                    .HasName("PK__tblTrinh__27250069353C98B0");

                entity.ToTable("tblTrinhDo");

                entity.Property(e => e.MaTd).HasColumnName("MaTD");

                entity.Property(e => e.GhiChu).HasMaxLength(100);

                entity.Property(e => e.TenTrinhDo)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<TblTtnhanVien>(entity =>
            {
                entity.HasKey(e => e.MaNv)
                    .HasName("PK__tblTTNha__2725D70A75C9AD46");

                entity.ToTable("tblTTNhanVien");

                entity.Property(e => e.MaNv).HasColumnName("MaNV");

                entity.Property(e => e.Cmnd)
                    .HasMaxLength(12)
                    .IsUnicode(false)
                    .HasColumnName("CMND")
                    .IsFixedLength(true);

                entity.Property(e => e.DanToc).HasMaxLength(30);

                entity.Property(e => e.DiaChi).HasMaxLength(100);

                entity.Property(e => e.Email).HasMaxLength(100);

                entity.Property(e => e.GhiChu).HasMaxLength(100);

                entity.Property(e => e.GioiTinh).HasMaxLength(3);

                entity.Property(e => e.HoTen).HasMaxLength(30);

                entity.Property(e => e.MaBhxh).HasColumnName("MaBHXH");

                entity.Property(e => e.MaCm).HasColumnName("MaCM");

                entity.Property(e => e.MaDv).HasColumnName("MaDV");

                entity.Property(e => e.MaTd).HasColumnName("MaTD");

                entity.Property(e => e.NgaySinh).HasColumnType("datetime");

                entity.Property(e => e.NoiSinh)
                    .HasMaxLength(10)
                    .IsFixedLength(true);

                entity.Property(e => e.Password).HasMaxLength(30);

                entity.Property(e => e.QuocTich).HasMaxLength(30);

                entity.Property(e => e.Sdt)
                    .HasMaxLength(12)
                    .IsUnicode(false)
                    .HasColumnName("SDT")
                    .IsFixedLength(true);

                entity.Property(e => e.TonGiao).HasMaxLength(30);

                entity.HasOne(d => d.MaBhxhNavigation)
                    .WithMany(p => p.TblTtnhanViens)
                    .HasForeignKey(d => d.MaBhxh)
                    .HasConstraintName("FK__tblTTNhan__MaBHX__47DBAE45");

                entity.HasOne(d => d.MaCmNavigation)
                    .WithMany(p => p.TblTtnhanViens)
                    .HasForeignKey(d => d.MaCm)
                    .HasConstraintName("FK__tblTTNhanV__MaCM__4BAC3F29");

                entity.HasOne(d => d.MaDvNavigation)
                    .WithMany(p => p.TblTtnhanViens)
                    .HasForeignKey(d => d.MaDv)
                    .HasConstraintName("FK__tblTTNhanV__MaDV__49C3F6B7");

                entity.HasOne(d => d.MaLuongNavigation)
                    .WithMany(p => p.TblTtnhanViens)
                    .HasForeignKey(d => d.MaLuong)
                    .HasConstraintName("FK__tblTTNhan__MaLuo__48CFD27E");

                entity.HasOne(d => d.MaTdNavigation)
                    .WithMany(p => p.TblTtnhanViens)
                    .HasForeignKey(d => d.MaTd)
                    .HasConstraintName("FK__tblTTNhanV__MaTD__46E78A0C");

                entity.HasOne(d => d.MaThueNavigation)
                    .WithMany(p => p.TblTtnhanViens)
                    .HasForeignKey(d => d.MaThue)
                    .HasConstraintName("FK__tblTTNhan__MaThu__4AB81AF0");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
