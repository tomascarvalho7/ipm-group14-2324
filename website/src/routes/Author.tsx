import { Navigate, useNavigate, useParams } from "react-router-dom";
import { authors, getAuthor } from "../constants";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap-icons/font/bootstrap-icons.css';


export function Author() {
  const params = useParams()
  const navigate = useNavigate();
  const number = params["number"] ?? ""
  const author = getAuthor(parseInt(number))

  if (!author) return <Navigate to="/" />

  document.title = `SyncShop | ${author.name}`

  const handleLeftArrowClick = () => {
    let newNumber = parseInt(number) - 1;
    let newAuthorNumber = authors.find(author => author.number == newNumber)?.number ?? authors[authors.length - 1].number;

    navigate(`/authors/${newAuthorNumber}`, {replace: true});
  };

  const handleRightArrowClick = () => {
    let newNumber = parseInt(number) + 1;
    let newAuthorNumber = authors.find(author => author.number == newNumber)?.number ?? authors[0].number;

    navigate(`/authors/${newAuthorNumber}`, {replace: true});
  };

  return (
    <div className="author-container">
      <div className="name">
        <h1>{author?.name}</h1>
      </div>

      <div className="number">
        <h1>{author?.number}</h1>
      </div>

      <div className="nav-arrow left-arrow" onClick={handleLeftArrowClick}>
        <span><i className="bi bi-arrow-left-short"></i></span>
      </div>

      <div className="authorbox">
        <h3 className="task-box-text">Individual Tasks</h3>
        <a className="hyperlink" href={`/assets/${author?.number}/assignment1.pdf`} target="_blank"> 
          <i className="bi bi-arrow-right-short"></i> Assignment 1
        </a>
      </div>

      <div className="nav-arrow right-arrow" onClick={handleRightArrowClick}>
        <span><i className="bi bi-arrow-right-short"></i></span>
      </div>
    </div>
  );
}
