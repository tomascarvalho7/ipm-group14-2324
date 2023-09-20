import { getAuthor } from "../authors";

export function Author(props: { number: number }) {
  const author = getAuthor(props.number);
  return (
    <div className="authorinfo">
      <h1>{author?.name}</h1>
      <div className="authorbox">
        <h3>Individual tasks:</h3>
        <a href={`/assets/${props.number}/assignment1.pdf`} target="_blank">Assignment 1</a>
      </div>
    </div>
  )
}
