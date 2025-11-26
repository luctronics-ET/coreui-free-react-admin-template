import React, { useRef } from 'react'
import FullCalendar from '@fullcalendar/react'
import dayGridPlugin from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid'
import interactionPlugin from '@fullcalendar/interaction'
import listPlugin from '@fullcalendar/list'
import ptBrLocale from '@fullcalendar/core/locales/pt-br'
import './fullcalendar.scss'

const FullCalendarComponent = ({ events, onEventClick, onDateClick, onEventDrop, onEventResize }) => {
  const calendarRef = useRef(null)

  const handleEventClick = (info) => {
    if (onEventClick) {
      onEventClick({
        id: info.event.id,
        title: info.event.title,
        start: info.event.start,
        end: info.event.end,
        extendedProps: info.event.extendedProps,
      })
    }
  }

  const handleDateClick = (info) => {
    if (onDateClick) {
      onDateClick(info.date)
    }
  }

  const handleEventDrop = (info) => {
    if (onEventDrop) {
      onEventDrop({
        id: info.event.id,
        start: info.event.start,
        end: info.event.end,
      })
    }
  }

  const handleEventResize = (info) => {
    if (onEventResize) {
      onEventResize({
        id: info.event.id,
        start: info.event.start,
        end: info.event.end,
      })
    }
  }

  return (
    <div className="fullcalendar-wrapper">
      <FullCalendar
        ref={calendarRef}
        plugins={[dayGridPlugin, timeGridPlugin, interactionPlugin, listPlugin]}
        initialView="dayGridMonth"
        locale={ptBrLocale}
        headerToolbar={{
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth',
        }}
        buttonText={{
          today: 'Hoje',
          month: 'Mês',
          week: 'Semana',
          day: 'Dia',
          list: 'Lista',
        }}
        events={events}
        editable={true}
        selectable={true}
        selectMirror={true}
        dayMaxEvents={true}
        weekends={true}
        eventClick={handleEventClick}
        dateClick={handleDateClick}
        eventDrop={handleEventDrop}
        eventResize={handleEventResize}
        height="auto"
        eventDisplay="block"
        displayEventTime={true}
        eventTimeFormat={{
          hour: '2-digit',
          minute: '2-digit',
          hour12: false,
        }}
        slotLabelFormat={{
          hour: '2-digit',
          minute: '2-digit',
          hour12: false,
        }}
        firstDay={0} // Domingo
        navLinks={true}
        businessHours={{
          daysOfWeek: [1, 2, 3, 4, 5], // Segunda a Sexta
          startTime: '08:00',
          endTime: '18:00',
        }}
      />
    </div>
  )
}

export default FullCalendarComponent
