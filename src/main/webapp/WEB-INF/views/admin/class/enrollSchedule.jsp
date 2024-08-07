 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>송파여성인력개발센터</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
/* CSS Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html, body {
    height: 1080px;
}

body {
    font-family: Arial, sans-serif;
    display: flex;
    flex-direction: column;
    background-color: white;
}

main {
    flex: 1;
    margin-left: 250px;
    padding-top: 90px;
    overflow-y: auto;
    top: 120px;
    left: 250px;
    background-color: white;
}

.box {
    height: 100%;
}

.form-container {
    padding: 20px;
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 5px;
    width: 60%;
    margin: auto;
}

.form-container h2 {
    text-align: center;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    margin-bottom: 5px;
    font-weight: bold;
}

.form-group input, .form-group select {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.form-group.period {
    border: 1px solid #ddd;
    padding: 15px;
    margin-bottom: 10px;
    border-radius: 4px;
    background-color: #f1f1f1;
    position: relative;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
}

.form-group.period label {
    margin-bottom: 0;
}

.form-group.period .time-group {
    display: flex;
    align-items: center;
    width: 100%;
}

.form-group.period .time-group div {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.add-period-btn, .add-day-group-btn {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    text-align: center;
    margin-top: 10px;
}

.add-period-btn:hover, .add-day-group-btn:hover {
    background-color: #218838;
}

.day-checkboxes {
    display: flex;
    flex-wrap: wrap;
}

.day-checkbox {
    margin-right: 10px;
}

.day-group {
    border: 1px solid #ddd;
    padding: 15px;
    margin-bottom: 10px;
    border-radius: 4px;
    background-color: #e1e1e1;
}

.day-group .form-group {
    margin-bottom: 0;
}

.remove-day-group-btn {
    display: block;
    padding: 5px;
    background-color: #dc3545;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
    text-align: center;
    margin-top: 10px;
}

.remove-day-group-btn:hover {
    background-color: #c82333;
}

.remove-period-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    padding: 3px 7px;
    background-color: #dc3545;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 12px;
    cursor: pointer;
}

.remove-period-btn:hover {
    background-color: #c82333;
}
</style>
</head>
<body>

    <!-- 메뉴바 연결 -->
    <%@ include file="../../common/header.jsp"%>

    <!-- 사이드바 연결 -->
    <%@ include file="aside.jsp"%>

    <main>
        <!-- Main content -->
        <div class="form-container">
            <h2>시간표 등록</h2>
            <form id="schedule-form" action="/admin/class/enrollSchedule" method="post">
                <div class="form-group">
                    <label for="classNo">반 번호:</label>
                    <input type="text" id="classNo" name="classNo" required>
                </div>
                <div id="day-groups">
                    <div class="day-group" data-group-id="1">
                        <div class="form-group">
                            <label>요일:</label>
                            <div class="day-checkboxes">
                                <label class="day-checkbox"><input type="checkbox" name="daysOfWeek1" value="월"> 월요일</label>
                                <label class="day-checkbox"><input type="checkbox" name="daysOfWeek1" value="화"> 화요일</label>
                                <label class="day-checkbox"><input type="checkbox" name="daysOfWeek1" value="수"> 수요일</label>
                                <label class="day-checkbox"><input type="checkbox" name="daysOfWeek1" value="목"> 목요일</label>
                                <label class="day-checkbox"><input type="checkbox" name="daysOfWeek1" value="금"> 금요일</label>
                                <label class="day-checkbox"><input type="checkbox" name="daysOfWeek1" value="토"> 토요일</label>
                                <label class="day-checkbox"><input type="checkbox" name="daysOfWeek1" value="일"> 일요일</label>
                            </div>
                        </div>
                        <div id="periods1" class="sortable-periods">
                            <div class="form-group period" data-period-id="1">
                                <label>1교시</label>
                                <div class="time-group">
                                    <div>
                                        <label for="startTime1_1">시작 시간</label>
                                        <input type="time" id="startTime1_1" name="startTime1_1" required>
                                    </div>
                                    <div>
                                        <label for="endTime1_1">종료 시간</label>
                                        <input type="time" id="endTime1_1" name="endTime1_1" required>
                                    </div>
                                </div>
                                <button type="button" class="remove-period-btn">X</button>
                            </div>
                        </div>
                        <button type="button" class="add-period-btn" data-group-id="1">+ 교시 추가</button>
                        <button type="button" class="remove-day-group-btn" style="display: none;">삭제</button>
                    </div>
                </div>
                <button type="button" class="add-day-group-btn">+ 시간표 추가</button>
                <div class="form-group">
                    <button type="submit" class="add-period-btn">등록</button>
                </div>
            </form>
        </div>
    </main>

    <!-- 푸터 연결 -->
    <%@ include file="../../common/footer.jsp"%>

<script>
$(document).ready(function() {
    var groupCount = 1;
    var periodCounts = { 1: [1] };

    function updateRemoveButtons() {
        if ($('.day-group').length > 1) {
            $('.remove-day-group-btn').show();
        } else {
            $('.remove-day-group-btn').hide();
        }
    }

    function updatePeriodLabels(groupId) {
        $('#periods' + groupId + ' .form-group.period').each(function(index) {
            $(this).find('label:first').text((index + 1) + '교시');
            var periodId = index + 1;
            $(this).data('period-id', periodId);
            $(this).find('input[type="time"]').each(function() {
                var name = $(this).attr('name').replace(/\d+$/, periodId);
                $(this).attr('name', name);
                var id = $(this).attr('id').replace(/\d+$/, periodId);
                $(this).attr('id', id);
            });
        });
        periodCounts[groupId] = $('#periods' + groupId + ' .form-group.period').map(function() {
            return $(this).data('period-id');
        }).get();
    }

    // 요일 그룹 추가
    $('.add-day-group-btn').on('click', function() {
        groupCount++;
        periodCounts[groupCount] = [1];

        var dayGroupHtml = `
            <div class="day-group" data-group-id="` + groupCount + `">
                <div class="form-group">
                    <label>요일:</label>
                    <div class="day-checkboxes">
                        <label class="day-checkbox"><input type="checkbox" name="daysOfWeek` + groupCount + `" value="월"> 월요일</label>
                        <label class="day-checkbox"><input type="checkbox" name="daysOfWeek` + groupCount + `" value="화"> 화요일</label>
                        <label class="day-checkbox"><input type="checkbox" name="daysOfWeek` + groupCount + `" value="수"> 수요일</label>
                        <label class="day-checkbox"><input type="checkbox" name="daysOfWeek` + groupCount + `" value="목"> 목요일</label>
                        <label class="day-checkbox"><input type="checkbox" name="daysOfWeek` + groupCount + `" value="금"> 금요일</label>
                        <label class="day-checkbox"><input type="checkbox" name="daysOfWeek` + groupCount + `" value="토"> 토요일</label>
                        <label class="day-checkbox"><input type="checkbox" name="daysOfWeek` + groupCount + `" value="일"> 일요일</label>
                    </div>
                </div>
                <div id="periods` + groupCount + `" class="sortable-periods">
                    <div class="form-group period" data-period-id="1">
                        <label>1교시</label>
                        <div class="time-group">
                            <div>
                                <label for="startTime` + groupCount + `_1">시작 시간</label>
                                <input type="time" id="startTime` + groupCount + `_1" name="startTime` + groupCount + `_1" required>
                            </div>
                            <div>
                                <label for="endTime` + groupCount + `_1">종료 시간</label>
                                <input type="time" id="endTime` + groupCount + `_1" name="endTime` + groupCount + `_1" required>
                            </div>
                        </div>
                        <button type="button" class="remove-period-btn">X</button>
                    </div>
                </div>
                <button type="button" class="add-period-btn" data-group-id="` + groupCount + `">+ 교시 추가</button>
                <button type="button" class="remove-day-group-btn">삭제</button>
            </div>
        `;
        $('#day-groups').append(dayGroupHtml);
        $('#periods' + groupCount).sortable({
            update: function(event, ui) {
                var groupId = $(this).closest('.day-group').data('group-id');
                updatePeriodLabels(groupId);
            }
        });
        updateRemoveButtons();
    });

    // 교시 추가 
    $(document).on('click', '.add-period-btn', function() {
        var groupId = $(this).data('group-id');
        var periodIds = periodCounts[groupId];
        var nextPeriodId = periodIds.length > 0 ? Math.max(...periodIds) + 1 : 1;
        periodIds.push(nextPeriodId);

        var periodHtml = `
            <div class="form-group period" data-period-id="` + nextPeriodId + `">
                <label>` + nextPeriodId + `교시</label>
                <div class="time-group">
                    <div>
                        <label for="startTime` + groupId + `_` + nextPeriodId + `">시작 시간</label>
                        <input type="time" id="startTime` + groupId + `_` + nextPeriodId + `" name="startTime` + groupId + `_` + nextPeriodId + `" required>
                    </div>
                    <div>
                        <label for="endTime` + groupId + `_` + nextPeriodId + `">종료 시간</label>
                        <input type="time" id="endTime` + groupId + `_` + nextPeriodId + `" name="endTime` + groupId + `_` + nextPeriodId + `" required>
                    </div>
                </div>
                <button type="button" class="remove-period-btn">X</button>
            </div>
        `;
        $('#periods' + groupId).append(periodHtml);
        updatePeriodLabels(groupId);
    });

    // 요일 그룹 삭제
    $(document).on('click', '.remove-day-group-btn', function() {
        $(this).closest('.day-group').remove();
        updateRemoveButtons();
    });

    // 교시 삭제
    $(document).on('click', '.remove-period-btn', function() {
        var $period = $(this).closest('.form-group.period');
        var groupId = $period.closest('.day-group').data('group-id');
        var periodId = $period.data('period-id');
        periodCounts[groupId] = periodCounts[groupId].filter(id => id !== periodId);
        $period.remove();
        updatePeriodLabels(groupId);
    });

    // 시간표 등록
    $('#schedule-form').on('submit', function() {
        var periods = [];
        $('.day-group').each(function() {
            var groupId = $(this).data('group-id');
            var selectedDays = [];
            $('input[name="daysOfWeek' + groupId + '"]:checked').each(function() {
                selectedDays.push($(this).val());
            });
            if (selectedDays.length === 0) {
                alert('요일 그룹에 요일을 하나 이상 선택해주세요.');
                return false;
            }
            var daysOfWeek = selectedDays.join(',');

            $('#periods' + groupId + ' .form-group.period').each(function() {
                var periodId = $(this).data('period-id');
                var period = {
                    dayOfWeek: daysOfWeek,
                    periodName: $(this).find('label:first').text(),
                    startTime: $('#startTime' + groupId + '_' + periodId).val(),
                    endTime: $('#endTime' + groupId + '_' + periodId).val()
                };
                periods.push(period);
            });
        });

        periods.forEach(function(period, index) {
            $('<input>').attr({
                type: 'hidden',
                name: 'periods[' + index + '].dayOfWeek',
                value: period.dayOfWeek
            }).appendTo('#schedule-form');
            $('<input>').attr({
                type: 'hidden',
                name: 'periods[' + index + '].periodName',
                value: period.periodName
            }).appendTo('#schedule-form');
            $('<input>').attr({
                type: 'hidden',
                name: 'periods[' + index + '].startTime',
                value: period.startTime
            }).appendTo('#schedule-form');
            $('<input>').attr({
                type: 'hidden',
                name: 'periods[' + index + '].endTime',
                value: period.endTime
            }).appendTo('#schedule-form');
        });

        return true;
    });

    $('.sortable-periods').sortable({
        update: function(event, ui) {
            var groupId = $(this).closest('.day-group').data('group-id');
            updatePeriodLabels(groupId);
        }
    });
    updateRemoveButtons();
});
</script>


</body>
</html>
