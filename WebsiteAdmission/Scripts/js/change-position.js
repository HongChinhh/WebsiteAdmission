$(document).ready(function () {
    function disabledBtn(value) {
        $('.btn_up:first').attr('disabled', value);
        $('.btn_down:last').attr('disabled', value);
    }

    $('#btn_edit_position').click(function () {
        $('.btn_up, .btn_down').attr('disabled', !$(this).data('disabled'));
        $(this).data('disabled', !$(this).data('disabled'));
        $(this).text(!$(this).data('disabled') ? 'Tắt Sửa Position' : 'Bật Sửa Position');
        disabledBtn(true);
    });

    function changePositionValue(thisBtn, next) {
        var $currentBtn = $(thisBtn);
        var $currentTr = $(thisBtn).parent().parent();
        var currentPositionVal = $currentBtn.siblings('.formChangePositionValue').find('input[name="Position"]').val();

        var $currentForm = $currentBtn.siblings('.formChangePositionValue');
        var $nextTr;
        if (next) {
            $nextTr = $currentTr.next();
            $nextTr.insertBefore($currentTr);
        }
        else {
            $nextTr = $currentTr.prev();
            $nextTr.insertAfter($currentTr);
        }
        var $nextForm = $nextTr.find('.formChangePositionValue');

        var $currentPosition = $currentBtn.siblings('.formChangePositionValue').find('input[name="Position"]');
        var $nextPosition = $nextTr.find('input[name="Position"]');
        $currentPosition.val($nextPosition.val());
        $nextPosition.val(currentPositionVal);
        $.ajax({
            url: $currentForm.attr('action'),
            type: $currentForm.attr('method'),
            data: $currentForm.serialize(),
        });
        $.ajax({
            url: $nextForm.attr('action'),
            type: $nextForm.attr('method'),
            data: $nextForm.serialize(),
        });
    }

    disabledBtn(true);

    $('.btn_up').click(function () {
        disabledBtn(false);
        changePositionValue(this, false);
        disabledBtn(true);
    });
    $('.btn_down').click(function () {
        disabledBtn(false);
        changePositionValue(this, true);
        disabledBtn(true);
    });
})