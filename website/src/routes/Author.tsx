import { Navigate, useNavigate, useParams } from "react-router-dom";
import { authors, getAuthor } from "../authors";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap-icons/font/bootstrap-icons.css';


export function Author() {
  const params = useParams()
  const navigate = useNavigate();
  const number = params["number"] ?? ""
  const author = getAuthor(parseInt(number))

  if (!author) return <Navigate to="/" />

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
    <div className="authorinfo">
      <div className="nav-arrow left-arrow" onClick={handleLeftArrowClick}>
        <span><i className="bi bi-arrow-left-short"></i></span>
      </div>

      <h1>{author?.name}</h1>
  
      <div className="authorbox">
        <h3>Individual tasks:</h3>
        <a href={`/assets/${author?.number}/assignment1.pdf`} target="_blank">Assignment 1</a>
      </div>
      
      <div className="nav-arrow right-arrow" onClick={handleRightArrowClick}>
        <span><i className="bi bi-arrow-right-short"></i></span>
      </div>
    </div>
  )
}
