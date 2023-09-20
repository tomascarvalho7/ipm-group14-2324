import { Navigate, useParams } from "react-router-dom";
import { getAuthor } from "../authors";

export function Author() {
  const params = useParams()
  const number = params["number"] ?? ""
  const author = getAuthor(parseInt(number))
  if (!author) return <Navigate to="/" />

  return (
    <div className="authorinfo">
      <h1>{author?.name}</h1>
      <div className="authorbox">
        <h3>Individual tasks:</h3>
        <a href={`/assets/${author?.number}/assignment1.pdf`} target="_blank">Assignment 1</a>
      </div>
    </div>
  )
}
