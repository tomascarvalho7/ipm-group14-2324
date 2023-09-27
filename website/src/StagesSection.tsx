export function AuthorsSection(props: {showInfo: () => void}) {  
    const navigate = useNavigate();
    const location = useLocation();
    const number = location.pathname.substring(location.pathname.lastIndexOf("/") + 1)
    
    const getClass = (authorNumber: string) => authorNumber == number ? "selected-card" : "author-card"
    
  
    return (
      <div className="authors-section">
        <div className="authors-container">
          {authors.map((author) => (
            <div className={getClass(author.number.toString())} key={author.number} onClick={() => handleClick(author.number)} >
              <img src={`/assets/${author.number}/photo.jpg`} alt={author.name} className="author-photo" />
              <p><b>{author.name}</b></p>
              <p>{author.number}</p>
            </div>
          ))}
        </div>
      </div>
    )
  
    // auxiliary function to handle the click on an author card
    function handleClick(authorNumber: number) {
      
      const desiredPath = "/authors/" + authorNumber;
      
      if (location.pathname !== desiredPath) {
        navigate(desiredPath, {replace: true});
      } else {
        navigate("/", {replace: true});
      }
  
      props.showInfo();
    }
  }
  