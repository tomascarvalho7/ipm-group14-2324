import { useState } from 'react'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <div id="title">
        <h1>Project Title</h1>
        <h2>Human-Computer Interaction p.2</h2>
      </div>
      <div id="authors">
        <h3>(photo) 67208 - Francisco Barreiras</h3>
        <h3>(photo) 67209 - Tomás Carvalho</h3>
        <h3>(photo) 67210 - Miguel Palma</h3>
        <h3>(photo) 67211 - Alexandre Madeira</h3>
      </div>
      <div id="project" className="card">
        <button>Project</button>
      </div>
      
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
      </div>
    </>
  )
}

export default App
