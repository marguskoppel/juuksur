/*$(document).ready(function() {
 $('li.active').removeClass('active');
 $('a[href="' + location.pathname + '"]').closest('li').addClass('active'); 
 });*/
/*
 $(document).ready(function() {
 // -----------------------------------------------------------------------
 $.each($('#navbar').find('li'), function() {
 $(this).toggleClass('active', 
 window.location.pathname.indexOf($(this).find('a').attr('href')) > -1);
 }); 
 // -----------------------------------------------------------------------
 });*/
/*$(document).ready(function() {
 $(document).on('click', '.nav-item a', function (e) {
 $(this).parent().addClass('active').siblings().removeClass('active');
 });
 });*/
/*$( document ).on( 'click', '.nav-list li', function ( e ) {
 $( this ).addClass( 'active' ).siblings().removeClass( 'active' );
 } );*//*
  $(document).ready(function(){
  $('.navbar-nav .nav-item').click(function(){
  $('.navbar-nav .nav-item').removeClass('active');
  $(this).addClass('active');
  })
  });*/
$(function () {
    $('[data-toggle="popover"]').popover();
});

$('.popover-dismiss').popover({
    trigger: 'focus'
});


$(document).ready(function () {

    var docHeight = $(window).height();
    var footerHeight = $('#footer').height();
    var footerTop = $('#footer').position().top + footerHeight;

    if (footerTop < docHeight)
        $('#footer').css('margin-top', 0 + (docHeight - footerTop) + 'px');
});

$(document).ready(function () {
    $.fn.dataTable.moment('DD-MM-YYYY');



    $('#appointments_admin').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#appointments_admin2').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#appointments_admin3').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#appointments_notactive_admin').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#limits_admin').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#statistics_admin_workers').DataTable({

        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });

    $('#workerstat_admin_services').DataTable({

        footerCallback: function (row, data, start, end, display) {
            var counter = 0;
            var api = this.api(), data;


            var intVal = function (i) {
                return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '') * 1 :
                        typeof i === 'number' ?
                        i : 0;
            };


            if (counter === 0) {
                counter = data.length;
            }
            // Total over all pages
            total = api
                    .column(1)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

            // Total over this page
            pageTotal = api
                    .column(1, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);


            pageData = api
                    .column(1, {page: 'current'})
                    .data();
            // Update footer
            $(api.column(0).footer()).html(
                    'Записи: на странице ' + pageData.count() + ' (всего ' + data.length + ')'
                    );
            $(api.column(1).footer()).html(
                    'Сумма: ' + parseFloat(pageTotal).toFixed(2) + ' &euro;' + ' (всего ' + parseFloat(total).toFixed(2) + ' &euro;)'
                    );

        },
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });


    $('#usernotactive_admin').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#userinfo_admin').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#userinfo_admin2').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#users_admin').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#users_admin2').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#appointments_master').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#appointments_master2').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#appointments_master3').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#users_admin3').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#limits_master').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#statistics_master').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#userinfo_user').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#userinfo_user2').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#userinfo_worker').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#userinfo_worker2').DataTable({
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }

    });
    $('#workerstat_admin').DataTable({
        footerCallback: function (row, data, start, end, display) {
            var counter = 0;
            var api = this.api(), data;
            // Remove the formatting to get integer data for summation
            var intVal = function (i) {

                if (typeof i === 'string') {
                    i = i.replace(/[\£,]/g, '') * 1;

                }
                // check if you got a valid number.
                if (Number.isNaN(i)) {
                    counter = counter + 1;

                    return '';
                }
                return i;
            };
            if (counter === 0) {
                counter = data.length;
            }
            // Total over all pages
            total = api
                    .column(4)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

            // Total over this page
            pageTotal = api
                    .column(4, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);


            pageData = api
                    .column(4, {page: 'current'})
                    .data();
            // Update footer
            $(api.column(3).footer()).html(
                    'Записи: на странице ' + pageData.count() + ' (всего ' + data.length + ')'
                    );




        },
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }


    });
    $('#workerstat_admin2').DataTable({
        footerCallback: function (row, data, start, end, display) {
            var counter = 0;
            var api = this.api(), data;
            // Remove the formatting to get integer data for summation
            var intVal = function (i) {

                if (typeof i === 'string') {
                    i = i.replace(/[\£,]/g, '') * 1;

                }
                // check if you got a valid number.
                if (Number.isNaN(i)) {
                    counter = counter + 1;

                    return '';
                }
                return i;
            };
            if (counter === 0) {
                counter = data.length;
            }
            // Total over all pages
            total = api
                    .column(4)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

            // Total over this page
            pageTotal = api
                    .column(4, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);


            pageData = api
                    .column(4, {page: 'current'})
                    .data();


            var average_mark = 0;
            if (isNaN(parseFloat(total / data.length).toFixed(2))) {
                average_mark = 0;

            } else {
                average_mark = parseFloat(total / data.length);
            }
            // Update footer
            $(api.column(2).footer()).html(
                    'Записи с оценкой: на странице ' + pageData.count() + ' (всего ' + data.length + ')'
                    );
            $(api.column(4).footer()).html(
                    'Средняя оценка: ' + average_mark.toFixed(2)
                    );

        },
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }


    });



    $('#workerstat_master').DataTable({
        footerCallback: function (row, data, start, end, display) {
            var counter = 0;
            var api = this.api(), data;
            // Remove the formatting to get integer data for summation
            var intVal = function (i) {

                if (typeof i === 'string') {
                    i = i.replace(/[\£,]/g, '') * 1;

                }
                // check if you got a valid number.
                if (Number.isNaN(i)) {
                    counter = counter + 1;

                    return '';
                }
                return i;
            };
            if (counter === 0) {
                counter = data.length;
            }
            // Total over all pages
            total = api
                    .column(4)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

            // Total over this page
            pageTotal = api
                    .column(4, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);


            pageData = api
                    .column(4, {page: 'current'})
                    .data();
            // Update footer
            $(api.column(3).footer()).html(
                    'Записи: на странице ' + pageData.count() + ' (всего ' + data.length + ')'
                    );




        },
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }


    });
    $('#workerstat_master2').DataTable({
        footerCallback: function (row, data, start, end, display) {
            var counter = 0;
            var api = this.api(), data;
            // Remove the formatting to get integer data for summation
            var intVal = function (i) {

                if (typeof i === 'string') {
                    i = i.replace(/[\£,]/g, '') * 1;

                }
                // check if you got a valid number.
                if (Number.isNaN(i)) {
                    counter = counter + 1;

                    return '';
                }
                return i;
            };
            if (counter === 0) {
                counter = data.length;
            }
            // Total over all pages
            total = api
                    .column(4)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

            // Total over this page
            pageTotal = api
                    .column(4, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);


            pageData = api
                    .column(4, {page: 'current'})
                    .data();

            var average_mark = 0;
            if (isNaN(parseFloat(total / data.length).toFixed(2))) {
                average_mark = 0;

            } else {
                average_mark = parseFloat(total / data.length);
            }
            // Update footer
            $(api.column(2).footer()).html(
                    'Записи с оценкой: на странице ' + pageData.count() + ' (всего ' + data.length + ')'
                    );
            $(api.column(4).footer()).html(
                    'Средняя оценка: ' + average_mark.toFixed(2)
                    );

        },
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }


    });








    $(function () {
        var start = moment().subtract(29, 'days');
        var end = moment();

        function cb(start, end) {
            $('#reportrange span').html(start.format('DD-MM-YYYY') + ' - ' + end.format('DD-MM-YYYY'));
        }

        $('#reportrange').daterangepicker({
            "showDropdowns": true,

            startDate: start,
            endDate: end,
            ranges: {
                'Сегодня': [moment(), moment()],
                'Вчера': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Последние 7 дней': [moment().subtract(6, 'days'), moment()],
                'Последние 30 дней': [moment().subtract(29, 'days'), moment()],
                'Этот месяц': [moment().startOf('month'), moment().endOf('month')],
                'Прошлый месяц': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            },
            "locale": {
                "format": "DD-MM-YYYY",
                "separator": " - ",
                "applyLabel": "Apply",
                "cancelLabel": "Cancel",
                "fromLabel": "От",
                "toLabel": "До",
                "customRangeLabel": "Ручная выборка",
                "weekLabel": "Н",
                "daysOfWeek": [
                    "вс",
                    "пн",
                    "вт",
                    "ср",
                    "чт",
                    "пт",
                    "сб"
                ],
                "monthNames": [
                    "Январь",
                    "Февраль",
                    "Март",
                    "Апрель",
                    "Май",
                    "Июнь",
                    "Июль",
                    "Август",
                    "Сентябрь",
                    "Октябрь",
                    "Ноябрь",
                    "Декабрь"
                ],
                "firstDay": 1
            },
            "alwaysShowCalendars": true,

        }, cb);

        cb(start, end);

    });


    $('#reportrange').on('apply.daterangepicker', function (ev, picker) {
        var start = picker.startDate;
        var end = picker.endDate;




        $.fn.dataTable.ext.search.push(
                function (settings, data, dataIndex) {
                    var min = start;
                    var max = end;
                    var startDate = new Date(data[2]);

                    if (min == null && max == null) {
                        return true;
                    }
                    if (min == null && startDate <= max) {
                        return true;
                    }
                    if (max == null && startDate >= min) {
                        return true;
                    }
                    if (startDate <= max && startDate >= min) {
                        return true;
                    }
                    return false;
                }
        );
        table.draw();
        $.fn.dataTable.ext.search.pop();
    });
    $('#reportrange').on('cancel.daterangepicker', function (ev, picker) {
        start = end = null;
        $(this).val('');
        table.draw();
    });


    /*===================================================================================================*/

    $(document).ready(function () {

        $(function () {
            var start = moment("2017-01-01");
            var end = moment("2018-03-03");

            function cb(start, end) {
                $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
            }

            $('#reportrange').daterangepicker({
                startDate: start,
                endDate: end,
                ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                }
            }, cb);

            cb(start, end);

        });


        $('#reportrange').on('apply.daterangepicker', function (ev, picker) {
            var start = picker.startDate;
            var end = picker.endDate;




            $.fn.dataTable.ext.search.push(
                    function (settings, data, dataIndex) {
                        var min = picker.startDate;
                        var max = picker.endDate;
                        var startDate = new Date(data[2]);
                        //var startDate = Date.parse(data[2]).getTime();

                        if (min == null && max == null) {
                            return true;
                        }
                        if (min == null && startDate <= max) {
                            return true;
                        }
                        if (max == null && startDate >= min) {
                            return true;
                        }
                        if (startDate <= max && startDate >= min) {
                            return true;
                        }
                        return false;
                    }
            );
            table.draw();
            $.fn.dataTable.ext.search.pop();
        });
        $('#reportrange').on('cancel.daterangepicker', function (ev, picker) {
            start = end = null;
            $(this).val('');
            table.draw();
        });
        var table = $('#workerstat_admin_appointments').DataTable({
            footerCallback: function (row, data, start, end, display) {
                var counter = 0;
                var api = this.api(), data;


                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };


                if (counter === 0) {
                    counter = data.length;
                }
                // Total over all pages
                total = api
                        .column(1)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                // Total over this page
                pageTotal = api
                        .column(1, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);


                pageData = api
                        .column(1, {page: 'current'})
                        .data();
                // Update footer
                $(api.column(3).footer()).html(
                        'Записи: на странице ' + pageData.count() + ' (всего ' + data.length + ')'
                        );
                $(api.column(1).footer()).html(
                        'Сумма: ' + pageTotal.toFixed(2) + ' &euro;' + ' (всего ' + total.toFixed(2) + ' &euro;)'
                        );

            },
            language: {
                "processing": "Подождите...",
                "search": "Поиск:",
                "lengthMenu": "Показать _MENU_ записей",
                "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
                "infoEmpty": "Записи с 0 до 0 из 0 записей",
                "infoFiltered": "(отфильтровано из _MAX_ записей)",
                "infoPostFix": "",
                "loadingRecords": "Загрузка записей...",
                "zeroRecords": "Записи отсутствуют.",
                "emptyTable": "В таблице отсутствуют данные",
                "paginate": {
                    "first": "Первая",
                    "previous": "Предыдущая",
                    "next": "Следующая",
                    "last": "Последняя"
                },
                "aria": {
                    "sortAscending": ": активировать для сортировки столбца по возрастанию",
                    "sortDescending": ": активировать для сортировки столбца по убыванию"
                }

            }


        });
    });

    /*===================================================================================================*/
});

$(document).ready(function () {

    $(function () {
        var start = moment("2017-01-01");
        var end = moment("2018-03-03");

        function cb(start, end) {
            $('#reportrange2 span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }

        $('#reportrange2').daterangepicker({
            startDate: start,
            endDate: end,
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        }, cb);

        cb(start, end);

    });


    $('#reportrange2').on('apply.daterangepicker', function (ev, picker) {
        var start = picker.startDate;
        var end = picker.endDate;
        $(this).val(start.format('DD-MM-YYYY') + ' to ' + end.format('DD-MM-YYYY'));
        table2.draw();


        $.fn.dataTable.ext.search.push(
                function (settings, data, dataIndex) {
                    var min = picker.startDate;
                    var max = picker.endDate;
                    var startDate = new Date(data[2]);
                    //var startDate = Date.parse(data[2]).getTime();

                    if (min == null && max == null) {
                        return true;
                    }
                    if (min == null && startDate <= max) {
                        return true;
                    }
                    if (max == null && startDate >= min) {
                        return true;
                    }
                    if (startDate <= max && startDate >= min) {
                        return true;
                    }
                    return false;
                }
        );

        table2.draw();
        $.fn.dataTable.ext.search.pop();
    });
    $('#reportrange2').on('cancel.daterangepicker', function (ev, picker) {
        start = end = null;
        $(this).val('');
        table2.draw();
    });
    var table2 = $('#workerstat_admin_appointments2').DataTable({
        footerCallback: function (row, data, start, end, display) {
            var counter = 0;
            var api = this.api(), data;




            // Remove the formatting to get integer data for summation
            /* var intVal = function (i) {
             
             if (typeof i === 'string') {
             i = i.replace(/[\£,]/g, '') * 1;
             
             }
             // check if you got a valid number.
             if (Number.isNaN(i)) {
             counter = counter + 1;
             
             return '';
             }
             return i;
             };*/





            var intVal = function (i) {
                return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '') * 1 :
                        typeof i === 'number' ?
                        i : 0;
            };


            if (counter === 0) {
                counter = data.length;
            }
            // Total over all pages
            total = api
                    .column(1)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

            // Total over this page
            pageTotal = api
                    .column(1, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);


            pageData = api
                    .column(1, {page: 'current'})
                    .data();
            // Update footer
            $(api.column(3).footer()).html(
                    'Записи: на странице ' + pageData.count() + ' (всего ' + data.length + ')'
                    );
            $(api.column(1).footer()).html(
                    'Сумма: ' + pageTotal + ' &euro;' + ' (всего ' + total + ' &euro;)'
                    );

        },
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }


    });


    $('#workerstat_admin_appointments_range').DataTable({
        footerCallback: function (row, data, start, end, display) {
            var counter = 0;
            var api = this.api(), data;




            // Remove the formatting to get integer data for summation
            /* var intVal = function (i) {
             
             if (typeof i === 'string') {
             i = i.replace(/[\£,]/g, '') * 1;
             
             }
             // check if you got a valid number.
             if (Number.isNaN(i)) {
             counter = counter + 1;
             
             return '';
             }
             return i;
             };*/





            var intVal = function (i) {
                return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '') * 1 :
                        typeof i === 'number' ?
                        i : 0;
            };


            if (counter === 0) {
                counter = data.length;
            }
            // Total over all pages
            total = api
                    .column(1)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

            // Total over this page
            pageTotal = api
                    .column(1, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);


            pageData = api
                    .column(1, {page: 'current'})
                    .data();
            // Update footer
            $(api.column(3).footer()).html(
                    'Записи: на странице ' + pageData.count() + ' (всего ' + data.length + ')'
                    );
            $(api.column(1).footer()).html(
                    'Сумма: ' + parseFloat(pageTotal).toFixed(2) + ' &euro;' + ' (всего ' + parseFloat(total).toFixed(2) + ' &euro;)'
                    );

        },
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }


    });

    $('#addbewservice_admin').DataTable({
        footerCallback: function (row, data, start, end, display) {
            var counter = 0;
            var api = this.api(), data;




            // Remove the formatting to get integer data for summation
            /* var intVal = function (i) {
             
             if (typeof i === 'string') {
             i = i.replace(/[\£,]/g, '') * 1;
             
             }
             // check if you got a valid number.
             if (Number.isNaN(i)) {
             counter = counter + 1;
             
             return '';
             }
             return i;
             };*/





            var intVal = function (i) {
                return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '') * 1 :
                        typeof i === 'number' ?
                        i : 0;
            };


            if (counter === 0) {
                counter = data.length;
            }
            // Total over all pages
            total = api
                    .column(1)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

            // Total over this page
            pageTotal = api
                    .column(1, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);


            pageData = api
                    .column(1, {page: 'current'})
                    .data();
            // Update footer
            /*$(api.column(3).footer()).html(
             'Записи: на странице ' + pageData.count() + ' (всего ' + data.length + ')'
             );
             $(api.column(1).footer()).html(
             'Сумма: ' + parseFloat(pageTotal).toFixed(2) + ' &euro;' + ' (всего ' + parseFloat(total).toFixed(2) + ' &euro;)'
             );*/

        },
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }


    });

    $('#service_notactive_admin').DataTable({
        footerCallback: function (row, data, start, end, display) {
            var counter = 0;
            var api = this.api(), data;




            // Remove the formatting to get integer data for summation
            /* var intVal = function (i) {
             
             if (typeof i === 'string') {
             i = i.replace(/[\£,]/g, '') * 1;
             
             }
             // check if you got a valid number.
             if (Number.isNaN(i)) {
             counter = counter + 1;
             
             return '';
             }
             return i;
             };*/





            var intVal = function (i) {
                return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '') * 1 :
                        typeof i === 'number' ?
                        i : 0;
            };


            if (counter === 0) {
                counter = data.length;
            }
            // Total over all pages
            total = api
                    .column(1)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

            // Total over this page
            pageTotal = api
                    .column(1, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);


            pageData = api
                    .column(1, {page: 'current'})
                    .data();
            // Update footer
            /*$(api.column(3).footer()).html(
             'Записи: на странице ' + pageData.count() + ' (всего ' + data.length + ')'
             );
             $(api.column(1).footer()).html(
             'Сумма: ' + parseFloat(pageTotal).toFixed(2) + ' &euro;' + ' (всего ' + parseFloat(total).toFixed(2) + ' &euro;)'
             );*/

        },
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }


    });

    $('#workerstat_master_appointments_range').DataTable({
        footerCallback: function (row, data, start, end, display) {
            var counter = 0;
            var api = this.api(), data;




            // Remove the formatting to get integer data for summation
            /* var intVal = function (i) {
             
             if (typeof i === 'string') {
             i = i.replace(/[\£,]/g, '') * 1;
             
             }
             // check if you got a valid number.
             if (Number.isNaN(i)) {
             counter = counter + 1;
             
             return '';
             }
             return i;
             };*/





            var intVal = function (i) {
                return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '') * 1 :
                        typeof i === 'number' ?
                        i : 0;
            };


            if (counter === 0) {
                counter = data.length;
            }
            // Total over all pages
            total = api
                    .column(1)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

            // Total over this page
            pageTotal = api
                    .column(1, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);


            pageData = api
                    .column(1, {page: 'current'})
                    .data();
            // Update footer
            $(api.column(3).footer()).html(
                    'Записи: на странице ' + pageData.count() + ' (всего ' + data.length + ')'
                    );
            $(api.column(1).footer()).html(
                    'Сумма: ' + parseFloat(pageTotal).toFixed(2) + ' &euro;' + ' (всего ' + parseFloat(total).toFixed(2) + ' &euro;)'
                    );

        },
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }

        }


    });
});





/*======================================*/
$(document).ready(function () {

    $(function () {
        var start = moment("2017-01-01 12:34:16");
        var end = moment("2018-03-03 10:08:07");

        function cb(start, end) {
            $('#reportrange3 span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }

        $('.datepick').daterangepicker({

            startDate: start,
            endDate: end,

            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            },
            "locale": {
                "format": "DD-MM-YYYY",
                "separator": " - ",
                "applyLabel": "Apply",
                "cancelLabel": "Cancel",
                "fromLabel": "От",
                "toLabel": "До",
                "customRangeLabel": "Ручная выборка",
                "weekLabel": "Н",
                "daysOfWeek": [
                    "вс",
                    "пн",
                    "вт",
                    "ср",
                    "чт",
                    "пт",
                    "сб"
                ],
                "monthNames": [
                    "Январь",
                    "Февраль",
                    "Март",
                    "Апрель",
                    "Май",
                    "Июнь",
                    "Июль",
                    "Август",
                    "Сентябрь",
                    "Октябрь",
                    "Ноябрь",
                    "Декабрь"
                ],
                "firstDay": 1
            },
            "alwaysShowCalendars": true,
        }, cb);

        cb(start, end);

    });


    $('.datepick').on('apply.daterangepicker', function (ev, picker) {
        var start = picker.startDate;
        var end = picker.endDate;




        $.fn.dataTable.ext.search.push(
                function (settings, data, dataIndex) {
                    var min = start;
                    var max = end;
                    var startDate = new Date(data[2]);

                    if (min == null && max == null) {
                        return true;
                    }
                    if (min == null && startDate <= max) {
                        return true;
                    }
                    if (max == null && startDate >= min) {
                        return true;
                    }
                    if (startDate <= max && startDate >= min) {
                        return true;
                    }
                    return false;
                }
        );
        table.draw();
        $.fn.dataTable.ext.search.pop();
    });
    $('.datepick').on('cancel.daterangepicker', function (ev, picker) {
        start = end = null;
        $(this).val('');
        table.draw();
    });
    var table = $('#example3').DataTable({

    });
});







