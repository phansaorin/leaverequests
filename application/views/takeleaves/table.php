<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><?php echo ucwords($title); ?></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    DataTables Advanced Tables
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th><?php echo form_checkbox("checkAll"); ?></th>
                                    <th>No</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Reason</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                if ($records) {
                                    $recordId = 0;
                                    foreach ($records->result_array() as $row) { 
                                        $recordId++;
                                    ?>
                                    <tr class="<?php echo $recordId % 2 ? 'even' : 'odd' ?>">
                                        <td><?php echo form_checkbox("checkedID", $row['take_id']); ?></td>
                                        <td><?php echo $recordId; ?></td>
                                        <td><?php echo $row['start_date']; ?></td>
                                        <td><?php echo $row['end_date']; ?></td>
                                        <td><?php echo $row['content']; ?></td>
                                        <td>
                                            <?php echo anchor("$controller_name/view/".$row['take_id'], ' ', array('class' => 'theTooltip glyphicon glyphicon-eye-open', 'title' => 'View', "data-toggle"=>"tooltip", "data-placement"=>"top")); ?> | 
                                            <?php echo anchor("$controller_name/edit/".$row['take_id'], ' ', array('class' => 'theTooltip glyphicon glyphicon-edit', 'title' => 'Edit')); ?> | 
                                            <?php echo anchor("$controller_name/delete/".$row['take_id'], ' ', array('class' => 'theTooltip glyphicon glyphicon-remove delete', 'title' => 'Delete')); ?>
                                        </td> 
                                    </tr>
                                    <?php }
                                }
                                ?> 
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                    <!-- <div class="well">
                        <h4>DataTables Usage Information</h4>
                        <p>DataTables is a very flexible, advanced tables plugin for jQuery. In SB Admin, we are using a specialized version of DataTables built for Bootstrap 3. We have also customized the table headings to use Font Awesome icons in place of images. For complete documentation on DataTables, visit their website at <a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.</p>
                        <a class="btn btn-default btn-lg btn-block" target="_blank" href="https://datatables.net/">View DataTables Documentation</a>
                    </div> -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->