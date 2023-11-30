import { Boarding } from "./Boarding"

function Stage(props: { stageNr: number, description: Array<string>, hasEvaluation: boolean }) {
  const {stageNr, description, hasEvaluation } = props;
  return (
    <div id={`stage${stageNr}`} className="stage-container">
     
      <div className="stage-label">
        <div className="stage-name">{"Stage " + stageNr} </div>
        {description.map((item : string) => (
          <div className="stage-description">{item} </div>
        ))}
        <p></p>
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

      {hasEvaluation &&
            <div className="stagebox">
            <div className="stage-img">
              <i className="bi bi-file-earmark-pdf-fill bi-10x"></i>
            </div>
            <a className="hyperlink" href={`/assets/reports/stage5_eval.pdf`} target="_blank">
                <div className="stage-link">
                    <i className="bi bi-download"></i>
                    <div className="link-text">Report</div>
                </div>
            </a>
        </div>
      }
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
      

      <div className="content-list">
        <Boarding/>
        <ContentItem element={ <Stage stageNr={1} description={["Project Proposal"]} hasEvaluation={false} /> }  />
        <ContentItem element={ <Stage stageNr={2} description={["User and Task Analysis"]} hasEvaluation={false}/> }  />
        <ContentItem element={ <Stage stageNr={3} description={["First Prototype"]} hasEvaluation={false}/> }  />
        <ContentItem element={ <Stage stageNr={4} description={["Computational Prototype"]} hasEvaluation={false}/> }  />
        <ContentItem element={ <Stage stageNr={5} description={["Heuristic Evaluation", "Group 14 -> Group 15", "Group 13 -> Group 14"]} hasEvaluation={true}/> }  />
        <ContentItem element={ <Stage stageNr={6} description={["Evaluation Results And Presentation"]} hasEvaluation={false}/> }  />
      </div>
      
    </div>
  )
}

/*
<div id="title">
        <h1>SyncShop</h1>
        <h2>Human-Computer Interaction p.2</h2>
      </div>
*/
