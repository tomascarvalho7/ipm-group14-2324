
function Stage(props: { stageNr: number }) {
  return (
    <div id={`stage${props.stageNr}`} className="stage-container">
      <div className="stage-name">
        <h1>Stage {props.stageNr}</h1>
      </div>

      

      <div className="stagebox">
        <h3>Stage documents</h3>
      <a className="hyperlink" href={`/assets/reports/stage${props.stageNr}.pdf`} target="_blank"> 
          <i className="bi bi-arrow-right-short" />Report
      </a>
      </div>
    </div>
  )
}

/**
 * Home page with final project content
*/
export function Home() {
  document.title = "SyncShop | Home"

  return (
    <div className="home">
      <div id="title">
        <h1>SyncShop</h1>
        <h2>Human-Computer Interaction p.2</h2>
      </div>

      <Stage stageNr={1} />
      <Stage stageNr={2} />
      <Stage stageNr={3} />
      <Stage stageNr={4} />
      
    </div>
  )
}
