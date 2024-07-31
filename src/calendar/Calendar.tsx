import Cell from '../components/Cell'
import styles from './Calendar.module.css'

const daysOfWeek = [
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
  'Mon',
]

interface Props {}

const Calendar: React.FC<Props> = () => {
  return (
    <div className={styles.calendar}>
      {['Code', 'Description', ...daysOfWeek].map((day) => (
        <Cell key={day}>{day}</Cell>
      ))}
      {Array.from({ length: 32 * 21 }).map((_, index) => (
        <Cell key={index} children={'Жека лох'} />
      ))}
    </div>
  )
}

export default Calendar
