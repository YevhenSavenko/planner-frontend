import styles from './Cell.module.css'

interface Props extends React.PropsWithChildren {}

const Cell: React.FC<Props> = ({ children }) => {
  return <div className={styles.cell}>{children}</div>
}

export default Cell
