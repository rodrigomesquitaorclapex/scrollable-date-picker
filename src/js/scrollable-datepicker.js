function removeTime(date = new Date()) {
  return new Date(
    date.getFullYear(),
    date.getMonth(),
    date.getDate()
  );
}
function lPadTo2(number) {
    if (number <= 9) {
        number = ("0" + number).slice(-2);
    }
    return number;
}

var scrollableDatepicker = {
    init: function(pItemId, weekDays, monthNames, pformatMask) {
        try {
            var aWeekDays = JSON.parse(weekDays);
        } catch (err) {
            console.log(weekDays);
            apex.message.clearErrors();
            apex.message.showErrors([{
                type: "error",
                location: "page",
                message: "Invalid Week Days, use a valid JSON Array",
                unsafe: false
            }]);
        }
        try {
            var aMonthNames = JSON.parse(monthNames);
        } catch (err) {
            console.log(monthNames);
            apex.message.clearErrors();
            apex.message.showErrors([{
                type: "error",
                location: "page",
                message: "Invalid Month Names, use a valid JSON Array",
                unsafe: false
            }]);
         }       

        var _this = $('#sd_' + pItemId);
        loadDatepicker(_this);

        _this.find('#sd-previous-month').click(function() {
            let pCurrentMonth = _this.find('.sd-monthPicker').attr('currentMonth');
            let pCurrentYear = _this.find('.sd-monthPicker').attr('currentYear');
            let previousMonth;
            if (pCurrentMonth != 0) {
                previousMonth = Number(pCurrentMonth) - 1
            } else {
                previousMonth = 11;
                _this.find('.sd-monthPicker').attr('currentYear', Number(pCurrentYear) - 1);
            }
            _this.find('.sd-monthPicker').attr('currentMonth', previousMonth);
            loadDatepicker(_this);
        });

        _this.find('#sd-next-month').click(function() {
            let nCurrentMonth = _this.find('.sd-monthPicker').attr('currentMonth');
            let nCurrentYear = _this.find('.sd-monthPicker').attr('currentYear');
            let nextMonth;
            if (nCurrentMonth != 11) {
                nextMonth = Number(nCurrentMonth) + 1
            } else {
                nextMonth = 0;
                _this.find('.sd-monthPicker').attr('currentYear', Number(nCurrentYear) + 1);
            }
            _this.find('.sd-monthPicker').attr('currentMonth', nextMonth);
            loadDatepicker(_this);
        });

        function loadDatepicker(id) {

            var _this = id;
            let mouseDown = false;
            let startX, scrollLeft;
            const slider = document.querySelector('.scrollable-datepicker');

            const startDragging = (e) => {
                mouseDown = true;
                startX = e.pageX - slider.offsetLeft;
                scrollLeft = slider.scrollLeft;
            }

            const stopDragging = (e) => {
                mouseDown = false;
            }

            const move = (e) => {
                e.preventDefault();
                if (!mouseDown) {
                    return;
                }
                const x = e.pageX - slider.offsetLeft;
                const scroll = x - startX;
                slider.scrollLeft = scrollLeft - scroll;
            }

            slider.addEventListener('mousemove', move, false);
            slider.addEventListener('mousedown', startDragging, false);
            slider.addEventListener('mouseup', stopDragging, false);
            slider.addEventListener('mouseleave', stopDragging, false);

            function daysInMonth(month, year) {
                return new Date(year, Number(month) + 1, 0).getDate();
            }
            _this.find('#'+pItemId+'_sd-calendar').children().remove();

            let currentDay = 0;
            let currentMonth = 0;
            let currentYear = 0;

            let weekday = aWeekDays;
            const sdMonthNames = aMonthNames;


            var date = new Date();
            if (_this.find('.sd-monthPicker').attr('currentmonth') == '') {
                _this.find('.sd-monthPicker').attr('currentMonth', date.getMonth());
                _this.find('.sd-monthPicker').attr('currentYear', date.getFullYear());
            }
            currentDay = date.getDay();
            currentMonth = _this.find('.sd-monthPicker').attr('currentMonth');
            currentYear = _this.find('.sd-monthPicker').attr('currentYear');


            _this.find('.sd-monthName').html(sdMonthNames[currentMonth] + ', ' + currentYear);
            

            for (var i = 1; i <= daysInMonth(currentMonth, currentYear); i++) {
                var date2 = new Date(currentYear, currentMonth, i)
                var ul = document.getElementById(pItemId+'_sd-calendar');
                var li = document.createElement("li");

                //Today's date
                var bool = (date.toDateString() === date2.toDateString());
                var disableFuture = (date2 > date);
                if (bool) {
                    li.classList.add('sd-active')
                }
                li.setAttribute('id', date2.getTime() / 1000)

                if (disableFuture) {
                    li.classList.add('sd-disabled')
                }

                //Days od the month
                let dayNum = document.createElement('span');
                dayNum.classList.add('sd-dayNum')
                dayNum.appendChild(document.createTextNode(date2.getDate()))
                if (bool) {
                    dayNum.classList.add('sd-active')
                }
                let weekDay = document.createElement('span');
                weekDay.classList.add('sd-weekday');
                weekDay.appendChild(document.createTextNode(weekday[date2.getDay()]))
                if (bool) {
                    weekDay.classList.add('sd-active');
                    weekDay.scrollIntoView({
                        behavior: "smooth",
                        block: "center",
                        inline: "center"
                    });
                }
                li.appendChild(weekDay);
                li.appendChild(dayNum);
                var thisMonth = Number(currentMonth) + 1;
                li.setAttribute('data-date', currentYear + '-' + lPadTo2(thisMonth) + '-' +  lPadTo2(date2.getDate()));
                ul.appendChild(li);
            }
            // scroll to active date
            if (_this.find('.sd-active').length != 0) {
                var activeScrollPos = _this.find('.sd-active').offset().left + _this.find('.sd-active').outerWidth(true) / 2 + _this.find('.scrollable-datepicker').scrollLeft() - _this.find('.scrollable-datepicker').width() / 2;
                let todaysDate = removeTime(new Date());
                let dateFormatted = apex.date.format( todaysDate, pformatMask);
                apex.item(pItemId).setValue(dateFormatted);

                _this.find('.scrollable-datepicker').animate({
                    scrollLeft: activeScrollPos - 10
                }, 'slow');
            }
            // select Day
            _this.find('.scrollable-datepicker').unbind("click");
            _this.find('.scrollable-datepicker').on('click', 'li', function() {
                _this.find('.scrollable-datepicker li').removeClass('sd-active');
                _this.find('.sd-dayNum').removeClass("sd-active");
                _this.find('.sd-weekday').removeClass("sd-active");
                _this.find(this).addClass('sd-active');
                _this.find(this).children('.sd-dayNum').addClass('sd-active');
                _this.find(this).children('.sd-weekday').addClass('sd-active');
                var dataDateString = _this.find(this).attr('data-date')+'T00:00:00';
                var date = new Date(dataDateString);
                var userTimezoneOffset = date.getTimezoneOffset() * 60000;
                var dataDate = new Date(date.getTime() - userTimezoneOffset);
                try {
                     var dateFormatted = apex.date.format( dataDate, pformatMask);
                    } catch (err) {
                        apex.message.clearErrors();
                        apex.message.showErrors([{
                            type: "error",
                            location: "page",
                            message: "Invalid format mask: "+pformatMask,
                            unsafe: false
                        }]);
                    }
                  apex.item(pItemId).setValue(dateFormatted);
                  $('#' + pItemId).trigger('scrollable-datepicker-change');

            });
        };
    }
};
