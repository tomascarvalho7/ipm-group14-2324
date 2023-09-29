export function Stage(props: { stageNr: string, onClick: () => void }) {

    return <div className="stage" onClick={props.onClick}>   
        Stage {props.stageNr}
        </div>
}