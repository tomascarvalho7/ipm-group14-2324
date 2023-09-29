export function StagePage() {
    return <div className="stage-container">
        <div className="stage-name">
        <h1>{window.location.hash}</h1>
        </div>

        <div className="stagebox">
        <h3>Stage documents</h3>
        <a className="hyperlink" href={`/assets/assignment1.pdf`} target="_blank"> 
            <i className="bi bi-arrow-right-short"></i> Assignment 1
        </a>
        </div>
    </div>
}