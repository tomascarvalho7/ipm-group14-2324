import { useNavigate, useLocation } from "react-router-dom"

export function AuthorsSection() {

  const authors = [
    { name: 'Francisco Barreiras', number: 67208, photo: '/assets/francisco.jpg', tag: 'francisco' },
    { name: 'Tomás Carvalho', number: 67209, photo: '/assets/tomas.jpg', tag: 'tomas' },
    { name: 'Miguel Palma', number: 67210, photo: '/assets/miguel.jpg', tag: 'miguel' },
    { name: 'Alexandre Madeira', number: 67211, photo: '/assets/alexandre.jpg', tag: 'alex' },
  ]
  
  const navigate = useNavigate();
  const location = useLocation();
  const tag = location.pathname.substring(location.pathname.indexOf("/authors") + 9)
  
  const getClass = (authorTag: string) => authorTag == tag ? "selected-card" : "author-card"

  return (
    <div className="authors-section">
      <div className="authors-container">
        {authors.map((author) => (
          <div className={getClass(author.tag)} key={author.number} onClick={() => navigate("/authors/" + author.tag)} >

            <img src={author.photo} alt={author.name} className="author-photo" />
            <p><b>{author.name}</b></p>
            <p>{author.number}</p>
          </div>
        ))}
      </div>
    </div>
  )
}
