import { useNavigate, useLocation } from "react-router-dom"

export function AuthorsSection() {

  const authors = [
    { name: 'Francisco Barreiras', number: 67208, photo: '/assets/francisco.jpg' },
    { name: 'Tomás Carvalho', number: 67209, photo: '/assets/tomas.jpg' },
    { name: 'Miguel Palma', number: 67210, photo: '/assets/miguel.jpg' },
    { name: 'Alexandre Madeira', number: 67211, photo: '/assets/alexandre.jpg' },
  ]
  
  const navigate = useNavigate();
  const location = useLocation();
  const number = location.pathname.substring(location.pathname.lastIndexOf("/") + 1)
  
  const getClass = (authorNumber: string) => authorNumber == number ? "selected-card" : "author-card"
  

  return (
    <div className="authors-section">
      <div className="authors-container">
        {authors.map((author) => (
          <div className={getClass(author.number.toString())} key={author.number} onClick={() => navigate("/authors/" + author.number, {replace: true})} >

            <img src={author.photo} alt={author.name} className="author-photo" />
            <p><b>{author.name}</b></p>
            <p>{author.number}</p>
          </div>
        ))}
      </div>
    </div>
  )
}
