<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Pengumuman</h1>
    </div>
                <!-- /.col-lg-12 -->
</div>
	<div class="row">
       <!-- /.col-lg-6 -->
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Pengumuman
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">

                             <?php  
                                $npm1 = $mahasiswa->mahasiswa_npm;                      
                                $query = $this->db->query("SELECT * FROM pengajuan WHERE mahasiswa_npm ='$npm1' ORDER BY pengajuan_post DESC LIMIT 1");
                                 foreach ($query->result() as $row1){}
                            ?>
                            <?php error_reporting(0); if($row1->mahasiswa_npm == ''){ ?>
                            <div class="alert alert-warning alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        Tidak ada Pengumuman pengajuan Proposal Karya Ilmiah karena anda belum mengajukan.
                                    </div>
                            <?php } else { ?>
                             <?php  
                                $npm = $mahasiswa->mahasiswa_npm;                      
                                $query = $this->db->query("SELECT 
                        pengajuan.pengajuan_id AS pengajuan_id,
                        pengajuan.pengajuan_judul AS pengajuan_judul,
                        pengajuan.pengajuan_status AS pengajuan_status,
                        pengajuan.pengajuan_catatan AS pengajuan_catatan,
                        pengajuan.mahasiswa_npm AS mahasiswa_npm,
                        pengajuan.dosen_nip AS dosen_nip,
                        pengajuan.katpengajuan_id AS katpengajuan_id,
                        mahasiswa.mahasiswa_nama AS mahasiswa_nama,
                        mahasiswa.mahasiswa_foto AS mahasiswa_foto,
                        dosen.dosen_nama AS dosen_nama,
                        katpengajuan.katpengajuan_nama AS katpengajuan_nama
                        FROM pengajuan
                        LEFT JOIN mahasiswa ON mahasiswa.mahasiswa_npm = pengajuan.mahasiswa_npm
                        LEFT JOIN dosen ON dosen.dosen_nip = pengajuan.dosen_nip
                        LEFT JOIN katpengajuan ON katpengajuan.katpengajuan_id = pengajuan.katpengajuan_id WHERE pengajuan.mahasiswa_npm ='$npm' ORDER BY pengajuan_post DESC LIMIT 1");
                                 foreach ($query->result() as $row){ 
                            ?>
                            <?php if($row->pengajuan_status == '?'){ ?>
                                        <div class="alert alert-warning alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        Harap Menunggu, karena Proposal Karya Ilmiah a/n:<strong><?php echo $mahasiswa->mahasiswa_nama; ?>!</strong> belum diperiksa.
                                    </div>
                            <?php }elseif($row->pengajuan_status == 'DITERIMA') { ?>
                                   <div class="alert alert-success alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                      Proposal Karya Ilmiah a/n:<strong><?php echo $mahasiswa->mahasiswa_nama; ?>!</strong> <strong>DITERIMA</strong>, silahkan melakukan bimbingan dengan dosen yang telah ditentukan.
                                    </div>
                              <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Judul</th>
                                        <th>Status</th>
                                        <th>Dosen Pembimbing</th>
                                        <th>Catatan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd gradeX">
                                        <td><?php echo $row->pengajuan_judul; ?></td>
                                        <td><b class="success"><?php echo $row->pengajuan_status; ?></b></td>
                                        <td><?php echo $row->dosen_nama; ?></td>
                                        <td><?php echo $row->pengajuan_catatan; ?></td>
                                    </tr>
                                </tbody>
                            </table>
                            <?php }else{ ?>
                            <div class="alert alert-danger alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                      Proposal Karya Ilmiah a/n:<strong><?php echo $mahasiswa->mahasiswa_nama; ?>!</strong> <strong>DITOLAK</strong>, silahkan memperbaiki atau mengganti.
                                    </div>
                              <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Judul</th>
                                        <th>Status</th>
                                        <th>Dosen Pembimbing</th>
                                        <th>Catatan</th>
                                        <th>Perbaiki</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd gradeX">
                                        <td><?php echo $row->pengajuan_judul; ?></td>
                                        <td><b class="required"><?php echo $row->pengajuan_status; ?></b></td>
                                        <td><?php echo $row->dosen_nama; ?></td>
                                        <td><?php echo $row->pengajuan_catatan; ?></td>
                                        <td><a href="<?php echo base_url();?>home/pengajuan/edit/<?php echo $row->pengajuan_id; ?>" title="klik untuk memperbaiki" class="btn btn-danger btn-circle btn-lg"><i class="fa fa-pencil"></i></a></td>

                                    </tr>
                                </tbody>
                            </table>
                            <?php } ?>          
                        <?php } ?>      
                        <?php } ?>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
	</div>