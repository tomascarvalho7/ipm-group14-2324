
/**
 * Fake Author page. This page should be generic for each author
*/
export function AuthorA(props: { name: string}) {
  return <div className="authorinfo">
    <h1>{props.name}</h1>
    <div className="authorbox">
      <h3>Individual tasks:</h3>
      <a href="/assets/documents/TrabalhoISI.pdf" download={true}> Download file</a>
    </div>
  </div>
}
