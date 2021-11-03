$(function () {
    var files = [];
    $('[type="file"][data-attach]').unbind();
    $('[type="file"][data-attach]').change(function () {
        var target = $(this).data('attach');
        var name = $(this);
        var $tt = [];
        var jj = 0;

        $.each($(this)[0].files, function (i, file) {
            var form_data = new FormData();
            form_data.append("file", file);
            form_data.append("x", $('[name="x"]').val());
            form_data.append("target", target);

            $tt[i] = file.name.replace(".", "-");
            $clone = $('.block-' + target).last().clone();
            $clone.attr("data-item", $tt[i]);
            $clone.removeClass("uk-hidden");
            $clone.prependTo('#' + target);
            $clone.find('.uk-position-relative').append('<div class="uk-position-center tmp" uk-spinner></div>')

            $.ajax({
                url: '/index.php?r=attach',
                data: form_data,
                cache: false,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (data) {
                    // console.log(data);
                    var d = $.parseJSON(data);
                   // console.log(d);
                    if (d.preview || d.mime_type) {
                        $('#' + target + ">div").each(function (i) {
                            $('[data-attach="req-' + target + '"]').val(i);
                        });
                        if (d.mime_type) {
                            $('[data-item="' + $tt[i] + '"]').find('img').attr("src", "/plugins/attach/assets/images/" + d.mime_type + ".png");
                            $('[data-item="' + $tt[i] + '"]').find('img').attr("titile", d.mime_type);
                        }
                        if (d.preview) {
                            $('[data-item="' + $tt[i] + '"]').find('img').attr("src", d.preview);
                        }
                        $('[data-item="' + $tt[i] + '"]').find('img').attr("src", d.preview);
                        $('[data-item="' + $tt[i] + '"]').attr("data-id", d.id);
                        $('[data-item="' + $tt[i] + '"]').find('[data-delete-id]').attr("data-delete-id", d.id);
                        $('[data-item="' + $tt[i] + '"]').find('.tmp').remove();
                        item_remove();
                    }
                    if (d.message) {
                        $('[data-item="' + $tt[i] + '"]').remove();
                        alert(d.message);
                    }

                }
            });
            jj++;
        });
    });


    UIkit.util.on('[uk-sortable]', 'moved', function () {
        var id = $(this).attr("id");
        var items = $(this).find(">div");
        var form_data = new FormData();
        form_data.append("x", $('[name="x"]').val());

        items.each(function (i, e) {
            if (!$(e).hasClass("uk-hidden")) {
                form_data.append($(e).attr("data-id"), i);
            }
        });

        $.ajax({
            url: '/index.php?r=attach&&att_a=sortable',
            data: form_data,
            cache: false,
            contentType: false,
            processData: false,
            type: 'POST',
            success: function (data) {
                console.log(data);
            }
        });
    });
});


function item_remove() {
    $("[data-delete-id]").unbind("click");
    $("[data-delete-id]").click(function () {
        $this = $(this);
        var target = $(this).data('target');
        $('[data-attach="req-' + target + '"]').val(0);
        console.log(target);
        $('#' + target + ">div").each(function (i) {
            $('[data-attach="req-' + target + '"]').val(i);
        });
        $.post(url + "&att_a=delete&item=" + $this.data("delete-id"), function (data) {
        });
        $('#' + target + ' [data-id="'+ $this.data('deleteId') +'"]').remove();
        return false;
    });
}
item_remove();