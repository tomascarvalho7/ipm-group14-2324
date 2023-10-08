
function Stage(props: { stageNr: number, description: string }) {
  const {stageNr, description } = props;
  return (
    <div id={`stage${stageNr}`} className="stage-container">
     
      <div className="stage-label">
        <div className="stage-name">{"Stage " + stageNr} </div>
        <div className="stage-description">{description} </div>
      </div>

      

      <div className="stagebox">
          <div className="stage-img">
            <i className="bi bi-file-earmark-pdf-fill bi-10x"></i>
          </div>
          <a className="hyperlink" href={`/assets/reports/stage${props.stageNr}.pdf`} target="_blank">
              <div className="stage-link">
                  <i className="bi bi-download"></i>
                  <div className="link-text">Report</div> 
              </div>
          </a>
      
      </div>
    </div>
  );
}

function ContentItem(props: {element: JSX.Element}) {
  const { element } = props;
  return (
    <div className="content-item">
      <div className="divider" />
        {element}
      </div>
  );
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

      <div className="content-list">
        <ContentItem element={ <Stage stageNr={1} description="Project Proposal"/> }  />
        <ContentItem element={ <Stage stageNr={2} description="User and Task Analysis"/> }  />
      </div>
      
    </div>
  )
}
