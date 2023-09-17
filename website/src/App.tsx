import { useState } from 'react'
import './App.css'

function AuthorsSection() {

  const authors = [
    { name: 'Francisco Barreiras', number: 67208, photo: 'src/assets/francisco.jpg' },
    { name: 'Tomás Carvalho', number: 67209, photo: 'src/assets/tomas.jpg' },
    { name: 'Miguel Palma', number: 67210, photo: 'src/assets/miguel.jpg' },
    { name: 'Alexandre Madeira', number: 67211, photo: 'src/assets/alexandre.jpg' },
  ]

  return (
    <div className="authors-section">
      <div className="authors-container">
        {authors.map((author) => (
          <div className="author-card" key={author.number}>
            <img src={author.photo} alt={author.name} className="author-photo" />
            <p><b>{author.name}</b></p>
            <p>{author.number}</p>
          </div>
        ))}
      </div>
    </div>
  )
}

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <AuthorsSection />
      <div id="title">
        <h1>Project Title</h1>
        <h2>Human-Computer Interaction p.2</h2>
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
